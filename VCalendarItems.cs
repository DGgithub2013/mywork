using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace VCalendarConverter
{
   public class VCalendarItems      
    {
        public VCalendarItems() {      

            VCalendarItemList = new List<VCalendarItem>(); 
        }
        public string ExportPath { get; set; }
        public List<VCalendarItem> VCalendarItemList { get; set; }
    }
}
