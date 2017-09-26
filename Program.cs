using rssFeed.SubscriberService;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Windows.Forms;

namespace rssFeed
{
    static class Program
    {
        public delegate void EvenDelegate(int number);
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
      {
       //     Application.EnableVisualStyles();
        //    Application.SetCompatibleTextRenderingDefault(false);
       //     Application.Run(new TestForm());

      }

       
        public static void SendEvents()
        {
            var publisher = new Publisher();
           // var subscriberConsole = new Subscriber();
            //var subscriberFile = new SubscriberFile();
           // subscriberConsole.Subscribe(publisher.EvenDelegate);
          //  subscriberFile.Subscribe(publisher.EvenDelegate);
            publisher.SendCalenarEvents();

           
        }

    }

}
