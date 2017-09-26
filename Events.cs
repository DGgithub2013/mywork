using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace rssFeed.Exporter
{
    public class Events
    {
        public Events() {
       

            EventsList = new List<Event>(); 
        }
        public string ExportPath { get; set; }
        public List<Event> EventsList { get; set; }
    }
}
