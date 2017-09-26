using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace RSSReader
{
    public class RssItem
    {
        public string Title { get; set; }

        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }

        public string Link { get; set; }
        public string Description { get; set; }
        public string Location { get; set; }
        public string Subject { get; set; }
        public string PublicationDate { get; set; }
        public string Type { get; set; }
        public string ComType { get; set; }
        public int TimeZoneAdjustment { get; set; }
        public Guid GUID { get; set; }


    }
}
