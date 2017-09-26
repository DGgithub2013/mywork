using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace rssFeed.Utils
{
    public static class ErrorLogging
    {
        private static string  strErrorPath= @"C:\Temp\RunExporterErrorLog.txt";
           
   
        public static void logError(Exception ex)
        {
            if (!CheckPath.IsValid(strErrorPath))
                File.Create(strErrorPath);
            using (StreamWriter sw = File.AppendText(strErrorPath))
                sw.WriteLine(DateTime.Now + "__" + ex.Message + "__" + ex.StackTrace);
        }

        public static void ReadError()
        {
            using (StreamReader sr = new StreamReader(strErrorPath))
            {
                string line;
                while ((line = sr.ReadLine()) != null)
                    Console.WriteLine(line);

            }
        }
       
    }
}
