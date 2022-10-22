namespace Farmaceutica
{
    partial class PantallaPrincipal
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

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(PantallaPrincipal));
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.aRCHIVOToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.sALIRToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.vENTASToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.cONSULTAToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.oPERATIVASToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.vENTAToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.sTOCKToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.cOMPRASTOCKToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.menuStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // menuStrip1
            // 
            this.menuStrip1.BackColor = System.Drawing.Color.LightSeaGreen;
            this.menuStrip1.Dock = System.Windows.Forms.DockStyle.Left;
            this.menuStrip1.ImageScalingSize = new System.Drawing.Size(25, 25);
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.aRCHIVOToolStripMenuItem,
            this.vENTASToolStripMenuItem,
            this.cONSULTAToolStripMenuItem});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(108, 450);
            this.menuStrip1.TabIndex = 0;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // aRCHIVOToolStripMenuItem
            // 
            this.aRCHIVOToolStripMenuItem.BackColor = System.Drawing.Color.Teal;
            this.aRCHIVOToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.sALIRToolStripMenuItem});
            this.aRCHIVOToolStripMenuItem.Font = new System.Drawing.Font("Rubik", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.aRCHIVOToolStripMenuItem.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.aRCHIVOToolStripMenuItem.Margin = new System.Windows.Forms.Padding(0, 125, 0, 20);
            this.aRCHIVOToolStripMenuItem.Name = "aRCHIVOToolStripMenuItem";
            this.aRCHIVOToolStripMenuItem.Size = new System.Drawing.Size(95, 22);
            this.aRCHIVOToolStripMenuItem.Text = "ARCHIVO";
            // 
            // sALIRToolStripMenuItem
            // 
            this.sALIRToolStripMenuItem.BackColor = System.Drawing.Color.Teal;
            this.sALIRToolStripMenuItem.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.sALIRToolStripMenuItem.Name = "sALIRToolStripMenuItem";
            this.sALIRToolStripMenuItem.Size = new System.Drawing.Size(224, 26);
            this.sALIRToolStripMenuItem.Text = "SALIR";
            this.sALIRToolStripMenuItem.Click += new System.EventHandler(this.sALIRToolStripMenuItem_Click);
            // 
            // vENTASToolStripMenuItem
            // 
            this.vENTASToolStripMenuItem.BackColor = System.Drawing.Color.Teal;
            this.vENTASToolStripMenuItem.Font = new System.Drawing.Font("Rubik", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.vENTASToolStripMenuItem.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.vENTASToolStripMenuItem.Margin = new System.Windows.Forms.Padding(0, 0, 0, 20);
            this.vENTASToolStripMenuItem.Name = "vENTASToolStripMenuItem";
            this.vENTASToolStripMenuItem.Size = new System.Drawing.Size(95, 22);
            this.vENTASToolStripMenuItem.Text = "VENTAS";
            this.vENTASToolStripMenuItem.Click += new System.EventHandler(this.vENTASToolStripMenuItem_Click);
            // 
            // cONSULTAToolStripMenuItem
            // 
            this.cONSULTAToolStripMenuItem.BackColor = System.Drawing.Color.Teal;
            this.cONSULTAToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.oPERATIVASToolStripMenuItem,
            this.cOMPRASTOCKToolStripMenuItem});
            this.cONSULTAToolStripMenuItem.Font = new System.Drawing.Font("Rubik", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cONSULTAToolStripMenuItem.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.cONSULTAToolStripMenuItem.Name = "cONSULTAToolStripMenuItem";
            this.cONSULTAToolStripMenuItem.Size = new System.Drawing.Size(95, 22);
            this.cONSULTAToolStripMenuItem.Text = "CONSULTA";
            // 
            // oPERATIVASToolStripMenuItem
            // 
            this.oPERATIVASToolStripMenuItem.BackColor = System.Drawing.Color.Teal;
            this.oPERATIVASToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.vENTAToolStripMenuItem,
            this.sTOCKToolStripMenuItem});
            this.oPERATIVASToolStripMenuItem.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.oPERATIVASToolStripMenuItem.Name = "oPERATIVASToolStripMenuItem";
            this.oPERATIVASToolStripMenuItem.Size = new System.Drawing.Size(224, 26);
            this.oPERATIVASToolStripMenuItem.Text = "OPERATIVAS";
            // 
            // vENTAToolStripMenuItem
            // 
            this.vENTAToolStripMenuItem.BackColor = System.Drawing.Color.Teal;
            this.vENTAToolStripMenuItem.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.vENTAToolStripMenuItem.Name = "vENTAToolStripMenuItem";
            this.vENTAToolStripMenuItem.Size = new System.Drawing.Size(224, 26);
            this.vENTAToolStripMenuItem.Text = "VENTA";
            // 
            // sTOCKToolStripMenuItem
            // 
            this.sTOCKToolStripMenuItem.BackColor = System.Drawing.Color.Teal;
            this.sTOCKToolStripMenuItem.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.sTOCKToolStripMenuItem.Name = "sTOCKToolStripMenuItem";
            this.sTOCKToolStripMenuItem.Size = new System.Drawing.Size(224, 26);
            this.sTOCKToolStripMenuItem.Text = "STOCK";
            // 
            // cOMPRASTOCKToolStripMenuItem
            // 
            this.cOMPRASTOCKToolStripMenuItem.BackColor = System.Drawing.Color.Teal;
            this.cOMPRASTOCKToolStripMenuItem.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.cOMPRASTOCKToolStripMenuItem.Name = "cOMPRASTOCKToolStripMenuItem";
            this.cOMPRASTOCKToolStripMenuItem.Size = new System.Drawing.Size(224, 26);
            this.cOMPRASTOCKToolStripMenuItem.Text = "GERENCIALES";
            // 
            // PantallaPrincipal
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("$this.BackgroundImage")));
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.menuStrip1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MainMenuStrip = this.menuStrip1;
            this.Name = "PantallaPrincipal";
            this.Text = "Farmaceutica/PantallaPrincipal";
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem aRCHIVOToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem sALIRToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem vENTASToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem cONSULTAToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem oPERATIVASToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem vENTAToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem sTOCKToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem cOMPRASTOCKToolStripMenuItem;
    }
}