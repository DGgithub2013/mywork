using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.ServiceProcess;
using System.Text;

namespace RunExporter
{
    [RunInstaller(true)]
    public partial class RunExporterServiceInstaller : ServiceInstaller
    {
        public RunExporterServiceInstaller()
        {
            //Instantiate and configure a ServiceProcessInstaller
            ServiceProcessInstaller RunExporterService = new ServiceProcessInstaller();
            RunExporterService.Account = ServiceAccount.LocalSystem;

            //Instantiate and configure a ServiceInstaller
            ServiceInstaller RunExporterInstaller = new ServiceInstaller();
            RunExporterInstaller.DisplayName = "Rss to Ical Export Service";
            RunExporterInstaller.ServiceName = "Rss to Ical Export Service";
            RunExporterInstaller.StartType = ServiceStartMode.Automatic;

            //Add both the service process installer and the service installer to the
            //Installers collection, which is inherited from the Installer base class.
          Installers.Add(RunExporterInstaller);
            Installers.Add(RunExporterService);
        }
    }
}
