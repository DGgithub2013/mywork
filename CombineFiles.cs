using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace rssFeed.Utils
{
   public class CombineFiles
    {
        public static bool MultipleFilesToSingleFile(string dirPath, string filePattern, string destFile)
        {
            bool result = false;
            try{
            string[] fileAry = Directory.GetFiles(dirPath, filePattern);

           // Console.WriteLine("Total File Count : " + fileAry.Length);

            using (TextWriter tw = new StreamWriter(destFile, true))
            {
                tw.WriteLine("BEGIN:VCALENDAR");
                foreach (string filePath in fileAry)
                {
                 
                    using (TextReader tr = new StreamReader(filePath))
                    {
                        tw.WriteLine(tr.ReadToEnd());
                        tw.Flush();
                        tr.Close();
                        tr.Dispose();
                    }
                    // Console.WriteLine("File Processed : " + filePath);
                }
                tw.WriteLine("END:VCALENDAR");
                tw.Close();
                tw.Dispose();
                result = true;
            }
            }catch
            {
                result=false;
            }
                return result;
            }
       
        public static bool ReplaceText(string path, string oldval, string newval)
        {
            try
            {
                File.WriteAllText(path, File.ReadAllText(path).Replace(oldval, newval));
                return true;
            }
            catch { return false; }

        }
   
   }  
}
