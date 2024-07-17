using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WorkTechHub.App_Code;
using WorkTechHub.Models;
using static WorkTechHub.App_Code.EmailSender;

namespace WorkTechHub.Controllers
{
    

    public class GeneralController : Controller
    {
         // Add model object
        // create object of database   tomake--- db_name+Entities
        WorkTechHubDBEntities1 db = new WorkTechHubDBEntities1();
        static string[] PicAndName = new string[2];
        [NonAction]
        void CreateNewCaptcha()
        {
           RandomCodeGenerator rg=new RandomCodeGenerator();
            PicAndName=rg.GetCaptchaImgAndCode();
            ViewBag.CaptchaPicName = PicAndName[0];
        }

        public JsonResult GetNewCaptchaByAjax()
        {
            CreateNewCaptcha();
            string s = PicAndName[0];
            return Json(s,JsonRequestBehavior.AllowGet);
        }
        // GET: General
        public ActionResult Home()
        {
            List<NotificationMaster> list = db.NotificationMasters.OrderByDescending(x=>x.Nid).Take(4).ToList();
            return View(list);
        }
        public ActionResult AboutUs()
        {
            return View();
        }
        public ActionResult TrendingProject()
        {
            List<ProjectMaster> pm=db.ProjectMasters.OrderByDescending(x=>x.ProjectId).Take(6).ToList();

            return View(pm);
        }
        [NonAction]
        void BindQualificationAndDesignation()
        {//first dropdown
            string[] qualification = new string[] { "BCA", "MCA", "Diploma(cs)", "Diploma(It)", "Marticulation(10th)", "BSC", "BA" };
            List<SelectListItem> listQualification = new List<SelectListItem>();
            foreach(string quali in qualification) 
            {
            SelectListItem sli= new SelectListItem();
                sli.Text = quali;
                listQualification.Add(sli);
            }
            ViewBag.Qualification= listQualification;
            
            //second dropdown
            
            string[] designation = new string[] { "Junior/Associate Developer", "Software Engineer", "Network Engineer", "Database Administrator (DBA)", "DevOps Engineer", "Game Developer", " UX/UI Designer" };
            List<SelectListItem> listdesignation = new List<SelectListItem>();
            foreach (string ds in designation )
            {
                SelectListItem sli = new SelectListItem();
                sli.Text = ds;
                listdesignation.Add(sli);
            }
            ViewBag.Designation = listdesignation;
        }
        //DeveloperSignUp Get method
        [HttpGet]
        public ActionResult DeveloperSignUp()
        {
            BindQualificationAndDesignation();
            CreateNewCaptcha();
            return View();
        }

        [HttpPost]
        // developersignup post
        public ActionResult DeveloperSignUp(DeveloperMaster dm,
            string ConPass, string Pass_word,string TxtCaptcha) //name of table
        {
            //comparing captcha
            string msg = string.Empty;
            if (TxtCaptcha == PicAndName[1])
            {
                //comparing password
                if(Pass_word==ConPass) 
                {
                    //Reading and saving User Picture
                    HttpPostedFileBase myfile = Request.Files["ProfilePic"];
                    bool IsFileError = false;
                    string ProfilePicName=string.Empty;
                    if(myfile!=null) 
                    {
                       if(myfile.ContentLength>0) 
                        {
                            ProfilePicName=Path.GetRandomFileName()+myfile.FileName;
                            string ftype=ProfilePicName.Substring(ProfilePicName.LastIndexOf(".")).ToUpper();
                            if(ftype==".JPG" || ftype==".JPEG" || ftype==".PNG")
                            {
                                string folderPath = Server.MapPath("/content/UserPics");
                                if(!Directory.Exists(folderPath))
                                    Directory.CreateDirectory(folderPath);
                                myfile.SaveAs(folderPath+"/"+ ProfilePicName);
                                dm.ProfilePic = ProfilePicName;
                            }
                            else 
                            {
                                msg = "Invalid picture. Please choose correct image file.";
                                IsFileError = true;
                            }
                        }
                    }
                    if(IsFileError==false)
                    {
                        dm.Registered_on=DateTime.Now;
                        db.DeveloperMasters.Add(dm); // Adding record in developerMaster table
                        //setting login details
                        LoginMaster lg = new LoginMaster(); 
                        lg.Email_Id = dm.Email_Id;
                        Cryptography cg = new Cryptography();
                        lg.Pass_word = cg.EncryptMyPassword(Pass_word);
                        lg.Utype = "DEVELOPER";
                        db.LoginMasters.Add(lg);
                        db.SaveChanges();
                        msg = "Congratulation! you are registered successfully.";
                        //Sending Email
                        Emailsender em =new Emailsender();
                       string msgs = "Hii" + dm.Name + "\nWelcome to our portal.\nThanks for visiting.We will contact you soon!";
                        em.SendEmail(dm.Email_Id, "Greeting from WorkTechHub !!", msgs);
                    }
                }
                else
                {
                   msg = "Password and Conform Password must be same.";
                }
            }
            else
            {
                msg = "Invalid captcha code. Please try again.";
            }
            ViewBag.Message = msg;
            BindQualificationAndDesignation();
            CreateNewCaptcha();
            return View();
        }
        // contact page
        public ActionResult Contact()
        {
            return View();
        }
        [HttpGet]
        public ActionResult LogIn()
        {
            return View();
        }
        [HttpPost]
        public ActionResult LogIn(LoginMaster lm)
        {
            
            
            Cryptography cg = new Cryptography();
            lm.Pass_word=cg.EncryptMyPassword(lm.Pass_word);
            LoginMaster lmdb = db.LoginMasters.SingleOrDefault(tbl => tbl.Email_Id == lm.Email_Id && tbl.Pass_word == lm.Pass_word && tbl.Utype == lm.Utype);
            if (lmdb !=null)
            {

                if (lmdb.Utype == "DEVELOPER")
                {
                    Session["DevloperId"] = lmdb.Email_Id;
                    return RedirectToAction("Welcome","Developer");
                }
                else if (lmdb.Utype == "ADMIN")
                {
                    Session["AdminId"] = lmdb.Email_Id;
                    return RedirectToAction("Dashboard", "Manager");
                }
            }
            ViewBag.Message = "Invalid userid or password.";
            return View();
        }
        //save enqury by AJAX
        public JsonResult SaveEnquiryByAJAX(EnquiryMaster em)
        {
            string msg=string.Empty;
            try
            {
                em.Enq_DT = DateTime.Now;
                db.EnquiryMasters.Add(em);
                db.SaveChanges();
                msg = "SUCCESS";
                //Sending Email
                Emailsender es = new Emailsender();
                string msgs = "Hii" + em.Name + "\nThanks for your enqury.\nWe will contact you soon.\nFrom-\nWorkTechHub";
                es.SendEmail(em.EmailId, "Greeting from WorkTechHub !!", msgs);
            }
            catch
            {
                msg = "fail";
            }
            return Json(msg,JsonRequestBehavior.AllowGet);
        }
        public ActionResult myintro()
        {
            return View();
        }
    }
}
