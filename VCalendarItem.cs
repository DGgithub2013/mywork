using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Text.RegularExpressions;  
namespace VCalendarConverter
{
    public class VCalendarItem
    {
        public VCalendarItem() { }

        public int TimeZoneAdjustment { get; set; }
        public DateTime StartTime { get; set; }
        public DateTime EndTime { get; set; }
        public string Location { get; set; }
        public string Subject { get; set; }
        public string Description { get; set; }
        public string Type { get; set; }
        public string ComType { get; set; }

    }

}
