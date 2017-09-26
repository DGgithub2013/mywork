using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net;
using System.Xml.Linq;
using System.Xml;
using System.Globalization;
using System.Windows.Forms;

namespace RSSReader
{
    public class RssReader
    {
        public static List<RssItem> Read(string url)
        {
            var webClient = new System.Net.WebClient();

            string result = webClient.DownloadString(url);

            var document =new  System.Xml.XmlDocument();
            document.LoadXml(result);
            XmlNodeList TagList = document.GetElementsByTagName("item");
            var list = new List<RssItem>();
            foreach (XmlNode node in TagList)
            {
                XmlElement tg = (XmlElement)node;
                var item = new RssItem();
       
                item.Title = GetTag(tg,"title");
                item.StartDate = ConvertToDate(GetTag(tg,"startDate"));
                item.EndDate = ConvertToDate(GetTag(tg,"endDate"));
                item.Link = GetTag(tg,"link");
                item.Description =GetTag(tg,"description");
                item.Location = GetTag(tg,"location");
                item.Type= GetTag(tg, "type");
                item.ComType = GetTag(tg, "comtype");
                // item.Subject = GetTag(tg,"Subject")[0].InnerText;
                // item.PublicationDate = GetTag(tg,"publicationDate")[0].InnerText;
                // item.TimeZoneAdjustment = ConvertToInt(GetTag(tg,"TimeZoneAdjustment")[0].InnerText.ToString());
                item.GUID = ConvertToGUID(GetTag(tg,"guid"));
                if(CheckCurrentDate(item.StartDate))
                    list.Add(item);   
            }
            return list;
       }

       static bool CheckCurrentDate(DateTime dte) {
           if(dte.Date>=DateTime.Now.Date)
               return true;
        
            return false;
       }
       static string GetTag(XmlElement tg, string tname) {
            if (tg.GetElementsByTagName(tname)[0] != null)
                return tg.GetElementsByTagName(tname)[0].InnerText.ToString();
            return String.Empty;
        
        }
        private static DateTime ConvertToDate(string dateTime) {
            if(String.IsNullOrEmpty(dateTime)) return DateTime.Now;

            string[] formats = {"M/d/yyyy h:mm:ss tt", "M/d/yyyy h:mm tt", "yyyy/dd/mm hh:mm:ss TZD",
                               "MM/dd/yyyy hh:mm:ss", "M/d/yyyy h:mm:ss", 
                               "M/d/yyyy hh:mm tt", "M/d/yyyy hh tt", 
                               "M/d/yyyy h:mm", "M/d/yyyy h:mm", 
                               "MM/dd/yyyy hh:mm", "M/dd/yyyy hh:mm"};
            DateTime parsedDateTime;
            if(DateTime.TryParseExact(dateTime, formats, new CultureInfo("en-US"), DateTimeStyles.None, out parsedDateTime))
                return parsedDateTime;
            else
                return DateTime.Now; 
        }
        private static int ConvertToInt(string val) {
          
            int parsedInt;
            if (int.TryParse(CheckForNull(val), out parsedInt))       
                return parsedInt;

            return 9999999;
        }
        private static Guid ConvertToGUID(string val) {
            try
            {
                return new Guid(CheckForNull(val));
            }
            catch 
            {
                return new Guid();
            }         
            
        }
        private static string CheckForNull(string val)
        {
            if (val != null)
                return val;
            else
                return "";
        }
    }

}
