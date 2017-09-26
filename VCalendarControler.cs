using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using rssFeed.Utils;

namespace VCalendarConverter
{
    public class VCalendarControler
    {
        private static readonly Regex STRIP_HTML_REGEX = new Regex("<[^>]*>", RegexOptions.Compiled);
        public static string StripHTML(string input)
        {

            var stripped = Regex.Replace(input, "[^ -~]", "");
            var notags = Regex.Replace(stripped, "<.*?>", String.Empty);
            var s = Regex.Replace(notags, @"[^a-zA-Z0-9\s]", string.Empty);
            var result = WebUtility.HtmlDecode(s).ToString();
            // var result2 = FoldLinesUtil.FoldLines(result, 75, "\r\n");
            return result;
        }

        private bool ContainsHTML(string Input)
        {
            try
            {

                if (string.IsNullOrEmpty(Input))
                    return false;

                return STRIP_HTML_REGEX.IsMatch(Input);
            }
            catch { throw; }
        }

        public string GetVCalendar(VCalendarItem ical)
        {
            try
            {
                StringBuilder sb = new StringBuilder();
                sb.AppendLine("BEGIN VCALENDAR");
                sb.AppendLine("VERSION 1.0");
                sb.AppendLine("BEGIN VEVENT");
                ical.StartTime = ical.StartTime.AddHours(-ical.TimeZoneAdjustment);
                ical.EndTime = ical.EndTime.AddHours(-ical.TimeZoneAdjustment);

                string Start = ical.StartTime.ToString("yyyyMMdd") + "T" + ical.StartTime.ToString("HHmmss");
                string End = ical.EndTime.ToString("yyyyMMdd") + "T" + ical.EndTime.ToString("HHmmss");
                sb.Append("DTStart ").AppendLine(Start);
                sb.Append("DTEnd ").AppendLine(End);

                sb.Append("Location;ENCODING=QUOTED-PRINTABLE ").AppendLine(ical.Location);
                sb.Append("SUMMARY;ENCODING=QUOTED-PRINTABLE ").AppendLine(ical.Subject);
                sb.Append("DESCRIPTION;ENCODING=QUOTED-PRINTABLE ").AppendLine(ical.Description);
                sb.Append("UID ").Append(Start).Append(End).AppendLine(ical.Subject);
                sb.AppendLine("PRIORITY 3");
                sb.AppendLine("End VEVENT");
                sb.AppendLine("End VCALENDAR");
                return sb.ToString();
            }
            catch { throw; }
        }
        #region notused
        public string GetICalendar(VCalendarItem ical)
        {
            try
            {
                StringBuilder sb = new StringBuilder();
                ical.StartTime = ical.StartTime.AddHours(-ical.TimeZoneAdjustment);
                ical.EndTime = ical.EndTime.AddHours(-ical.TimeZoneAdjustment);
                string Start = ical.StartTime.ToString("yyyyMMdd") + "T" + ical.StartTime.ToString("HHmmss");
                string End = ical.EndTime.ToString("yyyyMMdd") + "T" + ical.EndTime.ToString("HHmmss");
                string description = StripHTML(ical.Description.Replace("<br />", "\\n").Replace("\n", ""));
                //sb.AppendLine("BEGIN:VCALENDAR");
                //sb.AppendLine("VERSION 2.0");
                /// sb.AppendLine("PRODID -//Craigs Utility Library//EN");
                sb.AppendLine("BEGIN:VEVENT");
                sb.Append("UID ").Append(Start).Append(End).AppendLine(ical.Subject);
                sb.Append("TYPE:").AppendLine(ical.Type + " " + ical.ComType);
                sb.Append("DTSTAMP:").AppendLine(DateTime.Now.ToString("yyyyMMddTHHmmss"));
                sb.Append("DTSTART:").AppendLine(End);
                sb.Append("DTEND:").AppendLine(Start);
                sb.Append("SUMMARY:").AppendLine(ical.Subject);
                sb.Append("LOCATION:").AppendLine(ical.Location);
                //if (ContainsHTML(ical.Description))
                // sb.Append("X-ALT-DESC;FMTTYPE=text/html").AppendLine(description.Replace("\n", ""));
                // else
                sb.Append("DESCRIPTION:").AppendLine(description);
                //sb.AppendLine("BEGIN:VALARM");
                // sb.AppendLine("TRIGGER:-PT15M");
                // sb.AppendLine("ACTION:DISPLAY");
                // sb.AppendLine("DESCRIPTION:Reminder");
                // sb.AppendLine("END:VALARM");
                sb.AppendLine("END:VEVENT");
                // sb.AppendLine("END:VCALENDAR");

                return sb.ToString();
            }
            catch { throw; }
        }

        public string GetHCalendar(VCalendarItem ical)
        {
            try
            {
                StringBuilder Output = new StringBuilder();

                Output.Append("<div class=\"vevent\">")
                .Append("<div class=\"summary\">").Append(ical.Subject).Append("</div>")
                .Append("<div>Date <abbr class=\"dtstart\" title=\"")
                .Append(ical.StartTime.ToString("MM-dd-yyyy hh:mm:tt")).Append("\">")
                .Append(ical.StartTime.ToString("MMMM dd, yyyy hh:mm:tt")).Append("</abbr> to ")
                .Append("<abbr class=\"dtend\" title=\"").Append(ical.EndTime.ToString("MM-dd-yyyy hh:mm:tt"))
                .Append("\">");

                if (ical.EndTime.Year != ical.StartTime.Year)
                    Output.Append(ical.EndTime.ToString("MMMM dd, yyyy hh:mm:tt"));
                else if (ical.EndTime.Month != ical.StartTime.Month)
                    Output.Append(ical.EndTime.ToString("MMMM dd hh:mm:tt"));
                else if (ical.EndTime.Day != ical.StartTime.Day)
                    Output.Append(ical.EndTime.ToString("dd hh:mm:tt"));
                else
                    Output.Append(ical.EndTime.ToString(" hh:mm:tt"));

                Output.Append("</abbr></div>");
                Output.Append("<div>Location <span class=\"location\">").Append(ical.Location).Append("</span></div>");
                Output.Append("<div class=\"description\">").Append(ical.Description).Append("</div>");
                Output.Append("</div>");

                return Output.ToString();
            }
            catch { throw; }
        }

        #endregion
    }


}

