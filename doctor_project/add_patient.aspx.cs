using System;
using System.Configuration; // For accessing connection strings
using System.Data;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient; // MySQL library

namespace doctor_project
{
    public partial class add_patient : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDoctors();
            }
        }

        // Load the list of doctors into the dropdown
        private void LoadDoctors()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

            using (MySqlConnection conn = new MySqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    string query = "SELECT id, CONCAT(first_name, ' ', last_name) AS full_name FROM Doctors";
                    MySqlCommand cmd = new MySqlCommand(query, conn);
                    MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    ddlDoctors.DataSource = dt;
                    ddlDoctors.DataTextField = "full_name";
                    ddlDoctors.DataValueField = "id";
                    ddlDoctors.DataBind();

                    // Add the default "Select Doctor" option
                    ddlDoctors.Items.Insert(0, new ListItem("-- Select Doctor --", ""));
                }
                catch (Exception ex)
                {
                    // Handle any database errors
                    Response.Write("<script>alert('Error loading doctors: " + ex.Message + "');</script>");
                }
            }
        }

        // Handle the submit button click
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string name = txtName.Text.Trim();
                string medicalHistory = txtMedicalHistory.Text.Trim();
                string joinedAt = txtJoinedAt.Text.Trim();
                int? assignDoctor = string.IsNullOrEmpty(ddlDoctors.SelectedValue) ? (int?)null : Convert.ToInt32(ddlDoctors.SelectedValue);

                string connectionString = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

                using (MySqlConnection conn = new MySqlConnection(connectionString))
                {
                    try
                    {
                        conn.Open();
                        string query = "INSERT INTO Patients (name, assign_doctor, medical_history, joined_at) VALUES (@name, @assignDoctor, @medicalHistory, @joinedAt)";
                        MySqlCommand cmd = new MySqlCommand(query, conn);

                        // Add parameters to prevent SQL injection
                        cmd.Parameters.AddWithValue("@name", name);
                        cmd.Parameters.AddWithValue("@assignDoctor", (object)assignDoctor ?? DBNull.Value); // Handle NULL values
                        cmd.Parameters.AddWithValue("@medicalHistory", medicalHistory);
                        cmd.Parameters.AddWithValue("@joinedAt", joinedAt);

                        cmd.ExecuteNonQuery();
                        Response.Write("<script>alert('Patient added successfully!');</script>");

                        // Clear form inputs
                        txtName.Text = "";
                        txtMedicalHistory.Text = "";
                        txtJoinedAt.Text = "";
                        ddlDoctors.SelectedIndex = 0;
                    }
                    catch (Exception ex)
                    {
                        // Handle database errors
                        Response.Write("<script>alert('Error adding patient: " + ex.Message + "');</script>");
                    }
                }
            }
        }
     
    }
}
