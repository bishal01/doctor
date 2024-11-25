using System;
using System.Data;
using MySql.Data.MySqlClient; // Use MySqlClient for MySQL databases
using System.Configuration;
using System.Web.UI.WebControls;

namespace doctor_project
{
    public partial class view_patient : System.Web.UI.Page
    {
        // Connection string to the database
        private string connectionString = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindPatientData();
            }
        }

        // Bind data to GridView
        private void BindPatientData()
        {
            try
            {
                using (MySqlConnection con = new MySqlConnection(connectionString))
                {
                    string query = "SELECT * FROM patients";
                    MySqlDataAdapter da = new MySqlDataAdapter(query, con);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    gvPatients.DataSource = dt;
                    gvPatients.DataKeyNames = new string[] { "id" }; // Set primary key column for GridView
                    gvPatients.DataBind();
                }
            }
            catch (Exception ex)
            {
                // Log or display the error for debugging
                Response.Write($"Error: {ex.Message}");
            }
        }

        // Row Editing Event
        protected void gvPatients_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvPatients.EditIndex = e.NewEditIndex;
            BindPatientData();
        }

        // Row Deleting Event
        protected void gvPatients_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int id = Convert.ToInt32(gvPatients.DataKeys[e.RowIndex].Value); // Ensure DataKeyNames is set in GridView

                using (MySqlConnection con = new MySqlConnection(connectionString))
                {
                    string query = "DELETE FROM patients WHERE id = @id";
                    using (MySqlCommand cmd = new MySqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@id", id);
                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                BindPatientData(); // Refresh GridView after deletion
            }
            catch (Exception ex)
            {
                Response.Write($"Error: {ex.Message}");
            }
        }

        // Additional Row Commands (e.g., Edit Button)
        protected void gvPatients_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                // Implement your edit logic here if required
            }
        }
    }
}