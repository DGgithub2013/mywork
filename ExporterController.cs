
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Xml;
using System.Diagnostics;
using System.Threading;
using System.Threading.Tasks;

//custom
using VCalendarConverter;
using rssFeed.Utils;
using RSSReader;
//////////////////////////////////////////////////////////////////////////////////////////////
// Creation date: 2017 
// Developer: Daniela Ganea 
// Description: main controller of the application it runs the reading of the settings file, 
// reads the rss feed and converts to ical, then creates ical file to designated path
//////////////////////////////////////////////////////////////////////////////////////////////
namespace rssFeed.Exporter
{
    public class ExporterController
    {
        // private string xmlPath="C:\\Temp\\eventSetting.xml";
        private string xmlPath { get; set; }
        // private static string strErrorPath {get;set;}
        public ExporterController(string path)
        {

            if (CheckPath.IsValid(path))
                xmlPath = path;
            else
                xmlPath = "";
        }

        public bool ReadExportEvents()
        {
            bool result = false;
            // try
            //{
            var evs = ReadSettings();
            int j = 0;
            foreach (Event ev in evs.EventsList)
            {
                result = WriteToFile(ev, evs.ExportPath, j, ev.ExportFileName);
                j++;
            }
            return result;
            // }
            // catch (Exception ex) {
            //   ErrorLogging.logError(ex);
            //   return false;
            // }
        }

        #region utils
        public Events ReadSettings()
        {
            var webClient = new System.Net.WebClient();
            string result = webClient.DownloadString(xmlPath);
            var document = new System.Xml.XmlDocument();
            var st = new Events();

            document.LoadXml(result);

            st.ExportPath = document.GetElementsByTagName("exportPath")[0].InnerText;
            XmlNodeList TagList = document.GetElementsByTagName("event");

            foreach (XmlNode node in TagList)
            {
                XmlElement TagElement = (XmlElement)node;
                if (TagElement.GetElementsByTagName("url")[0].InnerText != null)
                {
                    var ev = new Event();
                    ev.ExportFileName = TagElement.GetElementsByTagName("exportfilename")[0].InnerText;
                    ev.Url = TagElement.GetElementsByTagName("url")[0].InnerText;
                    ev.Format = TagElement.GetElementsByTagName("format")[0].InnerText;
                    ev.Type = TagElement.GetElementsByTagName("type")[0].InnerText;
                    ev.ComType = TagElement.GetElementsByTagName("comtype")[0].InnerText;
                    st.EventsList.Add(ev);
                }
            }

            return st;
        }
        public VCalendarItems ConvertiCal(string url)
        {
            //Debug.Print(url);
            var s = RssReader.Read(url);
            VCalendarItems vs = new VCalendarItems();

            foreach (RssItem rs in s)
                vs.VCalendarItemList.Add(LoadList(rs));

            return vs;
        }

        public bool WriteToFile(Event ev, string path, int j, string exfn)
        {
            bool result = false;
            if (ev == null) return result;

            var vcis = ConvertiCal(ev.Url);
            var finalPath = path + "\\" + Directory.CreateDirectory(path + "\\site" + j);
            var combined = finalPath + "\\" + exfn;

            WriteCalendarItems(vcis, finalPath, j, exfn);
            var busyfile = new FileInfo(finalPath + "\\" + (vcis.VCalendarItemList.Count - 1) + exfn);
            // Console.Write( DateTime.Now+ " busy file " +busyfile);
            while (FileLock.IsLocked(busyfile))
            {
                //Console.Write("file busy" + DateTime.Now);
            }

            if (CombineFiles.MultipleFilesToSingleFile(finalPath, "*.ical", combined))
            {
                //if (CombineFiles.ReplaceText(combined, "BEGIN:VCALENDAR", ""))
                // if (CombineFiles.ReplaceText(combined, "VERSION 2.0", ""))
                //  if (CombineFiles.ReplaceText(combined, "PRODID -//Craigs Utility Library//EN", ""))
                //  if (CombineFiles.ReplaceText(combined, "END:VCALENDAR", ""))
                result = true;
            }
            return result;
        }

        public void WriteCalendarItems(VCalendarItems vcis, string finalPath, int j, string exfn)
        {

            var icc = new VCalendarControler();
            string icalstr;
            int i = 0;

            foreach (VCalendarItem vical in vcis.VCalendarItemList)
            {
                icalstr = icc.GetICalendar(vical);
                string expath = finalPath + "\\" + i++ + exfn;
                var file = new StreamWriter(new FileStream(expath, FileMode.Create));

                file.Write(icalstr);
                file.Flush();
                file.Close();
            }
        }


        private static VCalendarItem LoadList(RssItem rs)
        {

            VCalendarItem vical = new VCalendarItem();

            vical.StartTime = rs.StartDate;
            vical.EndTime = rs.EndDate;
            vical.Description = rs.Description;
            vical.Location = rs.Location;
            vical.Subject = rs.Subject;
            vical.TimeZoneAdjustment = rs.TimeZoneAdjustment;
            vical.Subject = rs.Title;
            vical.ComType = rs.ComType;
            vical.Type = rs.Type;
            return vical;

        }


        #endregion utils
    }
}
