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
    public partial class SistemaVentas : Form
    {
        
        public SistemaVentas()
        {
            InitializeComponent();
            
        }

        private void Form2_Load(object sender, EventArgs e)
        {
           
        }

        private void btnSalir_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Seguro que desea salir?", "Confirmación", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                this.Close();
            }
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Seguro que desea cancelar?", "Confirmación", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                Limpiar();
            }
        }

     
        public void Limpiar()
        {
            txtComprobante.Text = "";
            cboFormaPago.SelectedIndex = -1;
            cboProducto.SelectedIndex = -1;
            cboSucursal.SelectedIndex = -1;
            txtCliente.Text = "";
            nudCantidad.Value = 0;
            dtpFecha.Value = DateTime.Now;
        }


    }
}
