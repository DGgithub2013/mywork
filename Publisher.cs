using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;
using System.Xml;

namespace rssFeed.SubscriberService
{
    public delegate void SubscribersDelegate(int number);
    public class Publisher
    {
        public SubscribersDelegate EvenDelegate { get; set; }
        private static string gmailaccount ="vancitydg@gmail.com";
        private static string gmailpwd = "VanCity17";
        private static string icalpath = "C:\\Temp\\Test\\site0\\vct.ical";

        public bool SendCalenarEvents()
        {
            //Get events
            //send emails to the list
            //for (int i = 1; i < 11; i++)            
              //  if (i % 2 == 0)                
        try
            {           //  EvenDelegate(i);
            Console.WriteLine("Welcome");
          //  var client = new SmtpClient("smtp.gmail.com", 587)
          //  {
          //      Credentials = new NetworkCredential(gmailaccount, gmailpwd),
          //      EnableSsl = true,
          //      Timeout = 100000
          //  };
            MailMessage msg = new MailMessage();
            msg.From = new MailAddress(gmailaccount, "Vancouver Events");
            msg.To.Add(new MailAddress(GetToMail(), "Daniela"));
            msg.Subject = "Vancouver Events for today mail with ICS file as an Attachment";
            msg.Body = "Please add these Vancouver Events for today to your calendar";
            SmtpClient client = new SmtpClient();
            client.Port = 587;
            client.Host = "smtp.gmail.com";
            client.Credentials = new System.Net.NetworkCredential(gmailaccount,gmailpwd);
            client.UseDefaultCredentials = true;
            client.EnableSsl = true;
     client.PickupDirectoryLocation = "c:\\temp\\";
            Console.WriteLine("connection success");
            // Now Contruct the ICS file using string builder
          
       
            //System.Net.Mime.ContentType contype = new System.Net.Mime.ContentType("text/calendar");
            //contype.Parameters.Add("method", "REQUEST");
            //contype.Parameters.Add("name", "Meeting.ics");
           // msg.Attachments.Add(new Attachment(icalpath, contype));
           
                client.Send(msg);
                return true;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception: {0},{1}", ex.Message, ex.InnerException);
                return false;
            }              
            
            
        }

       public string GetToMail()
        {
            //find subscriber email
           //return "Daniela.Ganea@vancouver.ca";
           XmlTextReader reader = new XmlTextReader("Test.xml");

           while (reader.Read())

               if ((reader.NodeType == XmlNodeType.Element) && (reader.Name == "email"))
               {
                  reader.Read();
                  string val=reader.Value;
                  return val;
               }
           
            return String.Empty;
        }
    }
}
