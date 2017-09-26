using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Xml.Linq;
using RSSReader;
using VCalendarConverter;
using rssFeed.Exporter;
namespace rssFeed
{
    public partial class TestForm : Form
    {
        public TestForm()
        {
            InitializeComponent();
        }
           private void btnConvert_Click(object sender, EventArgs e)
       
        {
            var ec = new Exporter.ExporterController("C:\\Temp\\eventSetting.xml");
          
            string url = "http://umbraco_cms.vancouver.ca/rss";
          // var readableRss = covertRss(url);
         var icals = ec.ConvertiCal(url);
            var icalcontroller = new VCalendarControler();
            var radeableical = icalcontroller.GetICalendar(icals.VCalendarItemList[0]);
           // txtTitle.Text = readableRss;
           txtTitle.Text = radeableical;
        }
        private string covertRss(string url)
        {
            var s = RssReader.Read(url);
            StringBuilder sb = new StringBuilder();
            foreach (RssItem rs in s)
            {
                sb.AppendLine(rs.Title);
                sb.AppendLine(rs.StartDate.ToString());
                sb.AppendLine(rs.EndDate.ToString());
                sb.AppendLine(rs.Link);
                sb.AppendLine(rs.Description);
                sb.AppendLine(rs.Location);
                sb.AppendLine(rs.Subject);
                sb.AppendLine(rs.PublicationDate);
                sb.AppendLine(rs.TimeZoneAdjustment.ToString());
                sb.AppendLine(rs.GUID.ToString());
            }

            return sb.ToString();
        }

        private void btnGetFeed_Click(object sender, EventArgs e)
        {
            var ec = new Exporter.ExporterController("C:\\Temp\\eventSetting.xml");

            string url = "http://umbraco_cms.vancouver.ca/rss";
             var readableRss = covertRss(url);
          
            txtTitle.Text = readableRss;
          
        }

   

    }






}
