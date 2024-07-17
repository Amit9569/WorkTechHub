using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations.Sql;
using System.Diagnostics.Eventing.Reader;
using System.IO;
using System.Linq;
using System.Runtime.Versioning;
using System.Web;
using System.Web.Mvc;
using WorkTechHub.App_Code;
using WorkTechHub.Models;

namespace WorkTechHub.Controllers
{
    [AuthorizeDeveloper]
    public class DeveloperController : Controller
    {
        // GET: Developer
        // code for user photo and name
        WorkTechHubDBEntities1 db=new WorkTechHubDBEntities1();
        static string uid;
        [NonAction]
        void SetUserPicAndName()
        {
            if (Session["DevloperId"] != null)
            {
                uid = Session["DevloperId"].ToString();
                DeveloperMaster dm = db.DeveloperMasters.Find(uid);
                string picname = "";
                if (dm.ProfilePic==null )
                {
                    if (dm.Gender.ToUpper().Trim() == "MALE")
                    {
                        picname = "/content/images/defaultboy.png";
                    }
                    else 
                    {
                        picname = "/content/images/defaultgirl.png";
                    }
                }
                else
                    picname= "/content/UserPics/" + dm.ProfilePic;
                ViewBag.Pictures = picname;
                ViewBag.Name = dm.Name;
            }
        }
        //  End code for user photo and name

        // Dropdown of update profile
        [NonAction]
        void BindQualificationAndDesignation(string myqualification, string mydesignnation)
        {//first dropdown
            string[] qualification = new string[] { "BCA", "MCA", "Diploma(cs)", "Diploma(It)", "Marticulation(10th)", "BSC", "BA" };
            List<SelectListItem> listQualification = new List<SelectListItem>();
            foreach (string quali in qualification)
            {
                SelectListItem sli = new SelectListItem();
                sli.Text = quali;
                if (quali == myqualification)
                    sli.Selected = true;
                listQualification.Add(sli);
            }
            ViewBag.Qualification = listQualification;

            //second dropdown

            string[] designation = new string[] { "Junior/Associate Developer", "Software Engineer", "Network Engineer", "Database Administrator (DBA)", "DevOps Engineer", "Game Developer", " UX/UI Designer" };
            List<SelectListItem> listdesignation = new List<SelectListItem>();
            foreach (string ds in designation)
            {
                SelectListItem sli = new SelectListItem();
                sli.Text = ds;
                if (ds == mydesignnation)
                    sli.Selected = true;
                listdesignation.Add(sli);
            }
            ViewBag.Designation = listdesignation;
        }
        public ActionResult Welcome()
        {
            SetUserPicAndName();
            return View();
        }
        public ActionResult feedback()
        {
            SetUserPicAndName();
            return View();
        }

        //Feedback section start
        [HttpPost]
        public ActionResult feedback(FeedbackMaster fm)
        {
            string msg = "";
            try
            {
                fm.Developerid = Session["DevloperId"].ToString();
                fm.MsgDT= DateTime.Now;
                db.FeedbackMasters.Add(fm);
                db.SaveChanges();
                msg = "Feedback uploaded successfully.";
            }
            catch
            {
                msg = "Sorry!Feedback not save.";
            }
            ViewBag.Msg = msg;  
            SetUserPicAndName();
            return View();
        }
        //Feedback section end
        public ActionResult SearchPro()
        {
            SetUserPicAndName();
            List<ProjectMaster> lst= db.ProjectMasters.OrderByDescending(x => x.ProjectId).ToList();
            return View(lst);
        }
        [HttpPost]
        public ActionResult SearchPro( string SearchValue)
        {
            SetUserPicAndName();
            List<ProjectMaster> lst = db.ProjectMasters.Where(x=>x.Title.Contains(SearchValue)).ToList();
            return View(lst);
        }

        public ActionResult RqForProject()
        {
            SetUserPicAndName();
            return View();
        }
        [HttpPost]
        //Uploading project request at database serve start
       
        public ActionResult RqForProject(RequestMaster rm)
        {
            string msg = "";
            string uid = Session["DevloperId"].ToString();
           // ProjectMaster pm = new ProjectMaster();
            try
            {
                rm.RequestDt= DateTime.Now;
                rm.RequestedBy= uid;
               // rm.RequestedFor = pm.ProjectId;
                db.RequestMasters.Add(rm);
                db.SaveChanges();
                msg = "Your request for project send sucessfully.";
            }
            catch
            {
                msg = "Sorry! unable to send your request.";
            }
            TempData["Message"]= msg;
            SetUserPicAndName();
            return RedirectToAction("Searchpro","Developer");
        }
        //Uploading project request at database serve end.

        //Display project  at Myproject view start.
        public ActionResult MyProjects()
        {
            string uid = Session["DevloperId"].ToString() ;
            List<RequestMaster> rm = db.RequestMasters.Where(x=>x.RequestedBy==uid).ToList();
             SetUserPicAndName();
            return View(rm);
        }
        //Display project  at Myproject view end.

        //Download project file from server
         public FileResult DownloadProject(string fname)
        {
            string Pathfile = "/content/ManagerUpload/" + fname;
             SetUserPicAndName();
            return File(Pathfile,"application/force-download",Path.GetFileName(Pathfile));
        }
        //Download uploaded task by admin in todaytask view 
        public FileResult  DownloadTask(string fname)
        {
            string pathfile = "/content/AdminUploadTask/" + fname;
            return File(pathfile,"application-force/download",Path.GetFileName(pathfile));
        }
        public ActionResult TodayTask()
        {
            string uid = Session["DevloperId"].ToString();
            List<TaskMaster> lst = db.TaskMasters.Where(x => x.ForDeveloper == uid).ToList();
             SetUserPicAndName();
            return View(lst);
        }

        public ActionResult UploadCode()
        {
             SetUserPicAndName();
            return View();
        }
        [HttpPost]
        //Upload data in server
        public ActionResult UploadCode(UploadCodeMaster um)
        {
            string msg = string.Empty;
            try
            {
                string fPath = Server.MapPath("/content/CodeFileName");
                HttpPostedFileBase myfile = Request.Files["CodeFileName"];
                if (myfile != null)
                {
                    if (myfile.ContentLength > 0)
                    {
                        string fName = Path.GetRandomFileName() + myfile.FileName;
                        string filetype = fName.Substring(fName.LastIndexOf('.')).ToUpper();
                        if (filetype == ".DOC" || filetype == ".DOCS" || filetype == ".RAR" || filetype == ".PDF" || filetype == ".ZIP" || filetype == ".TXT")
                        {
                            if (!Directory.Exists(fPath))
                            {
                                Directory.CreateDirectory(fPath);
                            }
                            myfile.SaveAs(fPath + "/" + fName);
                            um.UploadedBy = uid;
                            um.UploadedOn = DateTime.Now;
                            um.CodeFileName = fName;
                            db.UploadCodeMasters.Add(um);
                            db.SaveChanges();
                            msg = "File Uploaded Successfully";
                        }
                    }
                    else
                    {
                        msg = "Invalid file type. Please choose a valid file.";
                    }
                }
                else
                {
                    msg = "Please Upload a code.";
                }
            }
            catch
            {
                msg = "Sorry! due to some technical issue; we are unable to upload your post.";
            }
            ViewBag.Message = msg;
            DeveloperMaster d = db.DeveloperMasters.Find(uid);
            BindQualificationAndDesignation(d.Designation, d.Qualification);

            SetUserPicAndName();
            return View(d);
        }

            public ActionResult WorkReport()
        {
            SetUserPicAndName();
            return View();
        }

        // Upload workreport in database server start
        [HttpPost]
        public ActionResult WorkReport(WorkReportMaster wm)
        {
            string msg = "";
            SetUserPicAndName();
            if(wm.IsHelpNeeded!=true)
            {
               wm.IsHelpNeeded = false;
            }
            try
            {
                string div = Session["DevloperId"].ToString();
                wm.SubmittedBy = div;
                wm.SubmittedOn = DateTime.Now;
                db.WorkReportMasters.Add(wm);
                db.SaveChanges();
                msg = "Work Report submitted sucessfully.";


            }
            catch
            {
                msg = "Sorry! unable to upload your workreport";
            }
            ViewBag.Message= msg;
            return View();
        }
        // Upload workreport in database server end
        public ActionResult MyProfile()
        {
            string uid = "";
            uid = Session["DevloperId"].ToString();
            DeveloperMaster dm = db.DeveloperMasters.Find(uid);
            BindQualificationAndDesignation(dm.Designation, dm.Qualification);
            SetUserPicAndName();
            return View(dm);
        }
        [HttpPost]
        public ActionResult MyProfile( DeveloperMaster dm)
        {
            string uid = " ";
            string msg = "";
            uid=Session["DevloperId"].ToString();
            DeveloperMaster dmdb = db.DeveloperMasters.Find(uid);
            //Reading and saving User Picture
            HttpPostedFileBase myfile = Request.Files["ProfilePic"];
            bool IsFileError = false;
            string ProfilePicName = string.Empty;
            if (myfile != null)
            {
                if (myfile.ContentLength > 0)
                {
                    ProfilePicName = Path.GetRandomFileName() + myfile.FileName;
                    string ftype = ProfilePicName.Substring(ProfilePicName.LastIndexOf(".")).ToUpper();
                    if (ftype == ".JPG" || ftype == ".JPEG" || ftype == ".PNG")
                    {
                        string folderPath = Server.MapPath("/content/UserPics");
                        if (!Directory.Exists(folderPath))
                            Directory.CreateDirectory(folderPath);
                        myfile.SaveAs(folderPath + "/" + ProfilePicName);
                        dmdb.ProfilePic = ProfilePicName;
                    }
                    else
                    {
                        msg = "Invalid picture. Please choose correct image file.";
                        IsFileError = true;
                    }
                }
            }
            if (IsFileError == false)
            {
                //Arranging values to save the data of MyProfile into DeveloperMaster
                try
                {
                    dmdb.Name = dm.Name;
                    dmdb.Gender= dm.Gender;
                    dmdb.Mobile_No = dm.Mobile_No;
                    dmdb.Address = dm.Address;
                    dmdb.Qualification = dm.Qualification;
                    dmdb.Designation = dm.Designation;
                    db.Entry(dmdb);
                    db.SaveChanges();
                    msg = "Profile updated sucessfully";
                }
                catch
                {
                    msg = " Sorry! your profile not updated ";
                }
            }
            ViewBag.Message = msg;
                SetUserPicAndName();
            DeveloperMaster ddb = db.DeveloperMasters.Find(uid);
            BindQualificationAndDesignation(ddb.Designation, ddb.Qualification);
            return View(ddb);
        }

        public ActionResult ChangePass()
        {
            SetUserPicAndName();
            return View();
        }
        //password connectivity to database
        [HttpPost]
        public ActionResult ChangePass(string Pass_word, string ConfPass, string NewPass)
        {
            string msg = "";
            if (ConfPass==NewPass)
            {
                string uid = Session["DevloperId"].ToString(); 
                Cryptography cg= new Cryptography();
                Pass_word =cg.EncryptMyPassword(Pass_word);
                NewPass = cg.EncryptMyPassword(NewPass);
                LoginMaster lm=db.LoginMasters.SingleOrDefault(x=>x.Email_Id==uid && x.Pass_word==Pass_word);
                if(lm!=null) 
                {
                 lm.Pass_word = NewPass;
                    db.Entry(lm);
                    db.SaveChanges();
                    msg = "Password change successfully.";
                }
            }
            else
            {
                msg = "Password and confirm must be same.";
            }
            ViewBag.message = msg;
            SetUserPicAndName();
            return View();
        }
        public ActionResult Logout()
        {
            Session.Abandon();
            Session.Clear();
            Session.Remove("DevloperId");
            SetUserPicAndName();
            return View();
        }
    }
}
