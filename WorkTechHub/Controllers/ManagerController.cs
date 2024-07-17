using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations.Sql;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.Mvc;
using WorkTechHub.App_Code;
using WorkTechHub.Models;
using static WorkTechHub.App_Code.EmailSender;

namespace WorkTechHub.Controllers
{
    [AuthorizeManager]
    public class ManagerController : Controller
    {
        WorkTechHubDBEntities1 db = new WorkTechHubDBEntities1();
        // GET: Manager
        public ActionResult Dashboard()
        {
            return View();
        }

        //Add notification data to database
        [HttpPost]
        public ActionResult NotificationMgmt(NotificationMaster nm)
        {
            string msg = "";
            try
            {
                nm.NDT = DateTime.Now.ToString();
                db.NotificationMasters.Add(nm);
                db.SaveChanges();
                msg = "Notification added sucessfully";

            }
            catch
            {
                msg = "Sorry! unable to add notification.";
            }
            ViewBag.Message = msg;
            List<NotificationMaster> lst = db.NotificationMasters.OrderByDescending(x => x.Nid).ToList();
            return View(lst);

        }
        public ActionResult Postproject()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Postproject(ProjectMaster pm)
        {
            string msg = "";
            try
            {
                //to upload file in server
                string fPath = Server.MapPath("/content/ManagerUpload");
                HttpPostedFileBase myfile = Request.Files["ProjectFile"];
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
                           //save data in database
                            pm.PostedOn = DateTime.Now;
                            pm.ProjectFile = fName;
                            db.ProjectMasters.Add(pm);
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
                    msg = "Please Upload a project.";
                }
            }
            catch
            {
                msg = "Sorry! due to some technical issue; we are unable to upload your file.";
            }
            ViewBag.Message = msg;
            return View();
        }
        //To display work request of developer  from database start
        public ActionResult WorkProject()
        {
            List<RequestMaster> rm= db.RequestMasters.OrderByDescending(x=>x.RequestId).ToList();
            return View(rm);
        }
        //To display work request of developer  from database end

        public ActionResult SearchDeveloper()
        {
            return View();
        }
        //To display my project content from database start
        public ActionResult MyProjects()
        {
            List<ProjectMaster> list = db.ProjectMasters.OrderByDescending(x => x.ProjectId).ToList();
           
            return View(list);
           
        }
        //To display my project content from database end
        public ActionResult UploadTask()
        {
            List<DeveloperMaster> dm=db.DeveloperMasters.ToList();
            List<SelectListItem> list = new List<SelectListItem>();
            foreach(DeveloperMaster dev in dm)
            {
                SelectListItem lst=new SelectListItem();
                lst.Text  = dev.Name;
                lst.Value=dev.Email_Id;
                list.Add(lst);
            }
            ViewBag.ForDeveloper = list;
            return View();
        }

        //To display workreport content from database start
        [HttpPost]
        public ActionResult UploadTask(TaskMaster tm)
        {
            string msg = "";
            List<DeveloperMaster> dm = db.DeveloperMasters.ToList();
            List<SelectListItem> list = new List<SelectListItem>();
            foreach (DeveloperMaster dev in dm)
            {
                SelectListItem lst = new SelectListItem();
                lst.Text = dev.Name;
                lst.Value = dev.Email_Id;
                list.Add(lst);
            }
            ViewBag.ForDeveloper = list;
           
            try
            {
                //to upload file in server
                string fPath = Server.MapPath("/content/AdminUploadTask");
                HttpPostedFileBase myfile = Request.Files["ProjectFile"];
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
                            //save data in database
                            tm.UploadedOn= DateTime.Now;
                            tm.TaskFile = fName;
                            db.TaskMasters.Add(tm);
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
                    msg = "Please Upload a project.";
                }
            }
            catch
            {
                msg = "Sorry! due to some technical issue; we are unable to upload your file.";
            }
            ViewBag.Message= msg;

            return View();
        }
        public ActionResult ViewReport()
        {
            List<WorkReportMaster> wm=db.WorkReportMasters.OrderByDescending(x=>x.ReportId).ToList();
            return View(wm);
        }
        //To display workreport content from database end

        [HttpGet]
        public ActionResult ViewDeveloper()
        {
            List<DeveloperMaster> lst=db.DeveloperMasters.OrderBy(x=>x.Registered_on.ToString()).ToList();
            return View(lst);
        }
        [HttpPost]
        public ActionResult ViewDeveloper(string SearchValue)
        {
            List<DeveloperMaster> lst=db.DeveloperMasters.Where(x=>x.Name.Contains(SearchValue) || x.Email_Id.Contains(SearchValue) || x.Designation.Contains(SearchValue)).ToList();
           
            return View(lst);
        }

        public ActionResult RemoveUser(string uid)
        {
            string msg = "";
            try
            {
                DeveloperMaster dm = db.DeveloperMasters.Find(uid); 
                db.DeveloperMasters.Remove(dm);
                db.SaveChanges();
                msg = "User Account Deleted Sucessfully.";
            }
            catch
            {
                msg = "Sorry! unable to delete account.";
            }
            TempData["Message"] = msg;
            return RedirectToAction("ViewDeveloper", "Manager");
        }

        public FileResult DownloadCode1(string fname)
        {
            string Pathfile = "/content/CodeFileName/" + fname;
            return File(Pathfile,"application/force-download",Path.GetFileName(Pathfile));
        }
        public ActionResult DownloadCode()
        {
            List<UploadCodeMaster> um=db.UploadCodeMasters.OrderByDescending(x=>x.UploadId).ToList();
            return View(um);
        }

        //Ajax to delete notification and hide notification from database
     
        public JsonResult DeleteNoti(int NID)
        {
            string msg = "";
            try
            {
                NotificationMaster nm = db.NotificationMasters.Find(NID);
                db.NotificationMasters.Remove(nm);
                db.SaveChanges();
                msg = "SUCCESS";
            }
            catch
            {
                msg = "FAIL";
            }
            return Json(msg, JsonRequestBehavior.AllowGet);
        }
        public ActionResult  EnquiryMgmt()
        {
            List<EnquiryMaster>em=db.EnquiryMasters.OrderByDescending(x=>x.Enq_Id.ToString()).ToList();
            return View(em);
        }
        public ActionResult ManageFeedback()
        {
            List<FeedbackMaster> list = db.FeedbackMasters.OrderByDescending(x=>x.Fid.ToString()).ToList();
            return View(list);
        }


        public ActionResult NotificationMgmt()
        {
            List<NotificationMaster> lst=db.NotificationMasters.OrderByDescending(x=>x.Nid).ToList();
            return View(lst);
        }

        public ActionResult ChangePass()
        {
          
            return View();
        }
        [HttpPost]
        public ActionResult ChangePass(string Pass_word, string ConfPass, string NewPass)
        {
            string msg = "";
            if (ConfPass == NewPass)
            {
                string uid = Session["AdminId"].ToString();
                Cryptography cg = new Cryptography();
                Pass_word = cg.EncryptMyPassword(Pass_word);
                NewPass = cg.EncryptMyPassword(NewPass);
                LoginMaster lm = db.LoginMasters.SingleOrDefault(x => x.Email_Id == uid && x.Pass_word == Pass_word);
                if (lm != null)
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
            
            return View();
        }
        public ActionResult SendEmail()
        {

            return View();
        }
        [HttpPost]
        public ActionResult SendEmail(string SendTo, string subject, string message)
        {
            string msg = "";
         
            try
            {
                Emailsender em = new Emailsender();
                 bool res=em.SendEmail(SendTo, subject, message);   
                if(res==true) 
                {
                    msg = "Email Send Sucessfully.";
                }
                else
                {
                    msg = "Sorry ! unable to send email.";
                }
            }
            catch
            {
                msg = "Sorry!we can't process it";
            }
            ViewBag.Message = msg;
            return View();
        }
        public ActionResult Logout() 
        {
            Session.Abandon();
            Session.Clear();
            Session.Remove("AdminId");
            
            return View();
         
        }

    }
}