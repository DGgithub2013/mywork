namespace RunExporter
{
    partial class RunExporterInstaller
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary> 
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Component Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.RunServiceProcessInstaller = new System.ServiceProcess.ServiceProcessInstaller();
            this.RunExportServiceInstaller = new System.ServiceProcess.ServiceInstaller();
            // 
            // RunServiceProcessInstaller
            // 
            this.RunServiceProcessInstaller.Password = null;
            this.RunServiceProcessInstaller.Username = null;
            // 
            // RunExportServiceInstaller
            // 
            this.RunExportServiceInstaller.Installers.AddRange(new System.Configuration.Install.Installer[] {
            this.RunServiceProcessInstaller});
            this.RunExportServiceInstaller.ServiceName = "RunExportService";
            this.RunExportServiceInstaller.StartType = System.ServiceProcess.ServiceStartMode.Automatic;
            // 
            // ProjectInstaller
            // 
            this.Installers.AddRange(new System.Configuration.Install.Installer[] {
            this.RunExportServiceInstaller});

        }

        #endregion

        private System.ServiceProcess.ServiceProcessInstaller RunServiceProcessInstaller;
        private System.ServiceProcess.ServiceInstaller RunExportServiceInstaller;
    }
}