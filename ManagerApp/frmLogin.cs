using Microsoft.Data.SqlClient;
using System;
using System.Data;
using System.Windows.Forms;

namespace ManagerApp
{
    public partial class frmLogin : Form
    {
        public frmLogin()
        {
            InitializeComponent();
        }

        private void btnCancel_Click(object sender, EventArgs e) => this.Close();


        private void btnLogin_Click(object sender, EventArgs e)
        {
            string ConnectionString = "server=xu; database=Ass2PRN;Integrated Security=True;TrustServerCertificate=True;";
            SqlConnection connection = new SqlConnection(ConnectionString);
            string SQL = "Select * from Member where Email = '" + txtUsername.Text + "' and Password = '" + txtPassword.Text + "' ";
            SqlDataAdapter adapter = new SqlDataAdapter(SQL, connection);
            DataTable dtbl = new DataTable();
            adapter.Fill(dtbl);
            if (dtbl.Rows.Count == 1)
            {
                frmMain frmMain = new frmMain();
                frmMain.Show();
                this.Hide();
            }
            else
            {
                MessageBox.Show("Error");
            }
        }
    }
}
