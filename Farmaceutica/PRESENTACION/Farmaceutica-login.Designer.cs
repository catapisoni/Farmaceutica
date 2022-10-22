namespace Farmaceutica
{
    partial class Login
    {
        /// <summary>
        /// Variable del diseñador necesaria.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Limpiar los recursos que se estén usando.
        /// </summary>
        /// <param name="disposing">true si los recursos administrados se deben desechar; false en caso contrario.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Código generado por el Diseñador de Windows Forms

        /// <summary>
        /// Método necesario para admitir el Diseñador. No se puede modificar
        /// el contenido de este método con el editor de código.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Login));
            this.lblCodEmpleado = new System.Windows.Forms.Label();
            this.lblCodGerente = new System.Windows.Forms.Label();
            this.txtCodEmpleado = new System.Windows.Forms.TextBox();
            this.txtCodGerente = new System.Windows.Forms.TextBox();
            this.btnInicioEmpleado = new System.Windows.Forms.Button();
            this.btnInicioGerente = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // lblCodEmpleado
            // 
            this.lblCodEmpleado.AutoSize = true;
            this.lblCodEmpleado.BackColor = System.Drawing.Color.Transparent;
            this.lblCodEmpleado.Font = new System.Drawing.Font("Rubik", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblCodEmpleado.ForeColor = System.Drawing.SystemColors.ControlText;
            this.lblCodEmpleado.Location = new System.Drawing.Point(24, 70);
            this.lblCodEmpleado.Name = "lblCodEmpleado";
            this.lblCodEmpleado.Size = new System.Drawing.Size(303, 20);
            this.lblCodEmpleado.TabIndex = 0;
            this.lblCodEmpleado.Text = "INGRESE CÓDIGO PARA EMPLEADO";
            // 
            // lblCodGerente
            // 
            this.lblCodGerente.AutoSize = true;
            this.lblCodGerente.BackColor = System.Drawing.Color.Transparent;
            this.lblCodGerente.Font = new System.Drawing.Font("Rubik", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblCodGerente.ForeColor = System.Drawing.SystemColors.ControlText;
            this.lblCodGerente.Location = new System.Drawing.Point(24, 209);
            this.lblCodGerente.Name = "lblCodGerente";
            this.lblCodGerente.Size = new System.Drawing.Size(289, 20);
            this.lblCodGerente.TabIndex = 1;
            this.lblCodGerente.Text = "INGRESE CÓDIGO PARA GERENTE";
            // 
            // txtCodEmpleado
            // 
            this.txtCodEmpleado.Location = new System.Drawing.Point(347, 70);
            this.txtCodEmpleado.Name = "txtCodEmpleado";
            this.txtCodEmpleado.Size = new System.Drawing.Size(367, 22);
            this.txtCodEmpleado.TabIndex = 2;
            // 
            // txtCodGerente
            // 
            this.txtCodGerente.Location = new System.Drawing.Point(347, 207);
            this.txtCodGerente.Name = "txtCodGerente";
            this.txtCodGerente.Size = new System.Drawing.Size(367, 22);
            this.txtCodGerente.TabIndex = 3;
            // 
            // btnInicioEmpleado
            // 
            this.btnInicioEmpleado.BackColor = System.Drawing.Color.Teal;
            this.btnInicioEmpleado.Font = new System.Drawing.Font("Rubik", 7.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnInicioEmpleado.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.btnInicioEmpleado.Location = new System.Drawing.Point(582, 111);
            this.btnInicioEmpleado.Name = "btnInicioEmpleado";
            this.btnInicioEmpleado.Size = new System.Drawing.Size(132, 32);
            this.btnInicioEmpleado.TabIndex = 4;
            this.btnInicioEmpleado.Text = "Iniciar Sesion";
            this.btnInicioEmpleado.UseVisualStyleBackColor = false;
            this.btnInicioEmpleado.Click += new System.EventHandler(this.btnInicioEmpleado_Click);
            // 
            // btnInicioGerente
            // 
            this.btnInicioGerente.BackColor = System.Drawing.Color.Teal;
            this.btnInicioGerente.Font = new System.Drawing.Font("Rubik", 7.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnInicioGerente.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.btnInicioGerente.Location = new System.Drawing.Point(582, 250);
            this.btnInicioGerente.Name = "btnInicioGerente";
            this.btnInicioGerente.Size = new System.Drawing.Size(132, 32);
            this.btnInicioGerente.TabIndex = 5;
            this.btnInicioGerente.Text = "Iniciar Sesion";
            this.btnInicioGerente.UseVisualStyleBackColor = false;
            this.btnInicioGerente.Click += new System.EventHandler(this.btnInicioGerente_Click);
            // 
            // Login
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(120F, 120F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Dpi;
            this.BackColor = System.Drawing.Color.MidnightBlue;
            this.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("$this.BackgroundImage")));
            this.ClientSize = new System.Drawing.Size(766, 331);
            this.Controls.Add(this.btnInicioGerente);
            this.Controls.Add(this.btnInicioEmpleado);
            this.Controls.Add(this.txtCodGerente);
            this.Controls.Add(this.txtCodEmpleado);
            this.Controls.Add(this.lblCodGerente);
            this.Controls.Add(this.lblCodEmpleado);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "Login";
            this.Text = "Farmaceutica/Inicio";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblCodEmpleado;
        private System.Windows.Forms.Label lblCodGerente;
        private System.Windows.Forms.TextBox txtCodEmpleado;
        private System.Windows.Forms.TextBox txtCodGerente;
        private System.Windows.Forms.Button btnInicioEmpleado;
        private System.Windows.Forms.Button btnInicioGerente;
    }
}

