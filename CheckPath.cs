using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace rssFeed.Utils
{
   public class CheckPath
    {

       public static bool IsValid(string path)
       {
           if (String.IsNullOrEmpty(path) && !System.IO.Directory.Exists(path))
               return false;
           else
               return true;
       }
    }
}
