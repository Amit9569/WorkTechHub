using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web;

namespace WorkTechHub.App_Code
{
    public class EmailSender
    {
        internal class Emailsender
        {
            string MyemailId, MyEmailPassCode;
            public Emailsender()
            {
                MyemailId = "amit974403727250@gmail.com";
                MyEmailPassCode = "ykeukshynyykmbzt";
            }
            internal bool SendEmail(string SendTo, string subject, string message)
            {
                try
                {
                    //setting protocol
                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = "smtp.gmail.com";
                    smtp.Port = 587;
                    smtp.UseDefaultCredentials = false;
                    NetworkCredential nc = new NetworkCredential(MyemailId, MyEmailPassCode);
                    smtp.Credentials = nc;
                    smtp.EnableSsl = true;

                    // Setting Mailmesage

                    MailMessage msg = new MailMessage();
                    MailAddress maFrom = new MailAddress(MyemailId);
                    MailAddress maTo = new MailAddress(SendTo);
                    msg.Sender = maFrom;
                    msg.To.Add(maTo);
                    msg.Subject = subject;
                    msg.From = maFrom;
                    msg.Body = message;
                    smtp.Send(msg);
                    return true;
                }
                catch
                {
                    return false;
                }
            }
        }
    }
}