using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration.Install;
using System.Linq;

namespace RunExporter
{
    [RunInstaller(true)]
    public partial class RunExporterInstaller : System.Configuration.Install.Installer
    {
        public RunExporterInstaller()
        {
            InitializeComponent();
        }
    }
}
