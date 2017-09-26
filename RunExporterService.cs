using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.ServiceProcess;
using System.Text;

namespace RunExporter
{
    public partial class RunExporterService : ServiceBase
    {
        public RunExporterService()
        {
            InitializeComponent();
            EventLog.Log = "RunExporter";
        }

        protected override void OnStart(string[] args)
        {
            EventLog.WriteEntry("RunExporter was started successfully.", EventLogEntryType.Information);
        }

        protected override void OnStop()
        {
            EventLog.WriteEntry("RunExporter was stopped successfully.", EventLogEntryType.Information);
        }

        protected override void OnShutdown()
        {
            EventLog.WriteEntry("RunExporter was shutdown successfully", EventLogEntryType.Information);
        }
    }
}