using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Farmaceutica
{
    public partial class Login : Form
    {
        public Login()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void btnInicioEmpleado_Click(object sender, EventArgs e)
        {
            if(txtCodEmpleado.Text=="2424")
            { new SistemaVentas().ShowDialog(); }
            else { MessageBox.Show("Acceso Denegado, intente nuevamente","Error", MessageBoxButtons.OK);}
            LimpiarPass();
        }

        private void btnInicioGerente_Click(object sender, EventArgs e)
        {
            if (txtCodGerente.Text == "5252")
            { new SistemaVentas().ShowDialog(); }
            else { MessageBox.Show("Acceso Denegado, intente nuevamente", "Error", MessageBoxButtons.OK); }
            LimpiarPass();
        }

        public void LimpiarPass()
        {
            txtCodEmpleado.Text = "";
            txtCodGerente.Text = "";
        }
    }
}
