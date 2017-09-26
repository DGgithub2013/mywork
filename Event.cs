using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace rssFeed.Exporter
{
   public class Event
    {
        public string Url{ get; set; }
        public string ExportFileName { get; set; }
        public string Format { get; set; }
        public string Type { get; set; }
        public string ComType { get; set; }
    }
}

