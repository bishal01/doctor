using System;
using System.Data;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace doctor_project
{
    public partial class caregiver : System.Web.UI.Page
    {
        private string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPatients();
                LoadCaregivers();
            }
        }

        private void LoadPatients()
        {
            using (MySqlConnection con = new MySqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    string query = "SELECT id, name FROM patients";
                    using (MySqlCommand cmd = new MySqlCommand(query, con))
                    {
                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            ddlPatients.DataSource = reader;
                            ddlPatients.DataTextField = "name";
                            ddlPatients.DataValueField = "id";
                            ddlPatients.DataBind();
                        }
                    }
                    ddlPatients.Items.Insert(0, new ListItem("-- Select Patient --", "0"));
                }
                catch (Exception ex)
                {
                    // Handle error
                    Response.Write($"<script>alert('Error loading patients: {ex.Message}');</script>");
                }
            }
        }

        private void LoadCaregivers()
        {
            using (MySqlConnection con = new MySqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    string query = "SELECT id, name FROM caregivers WHERE availability = TRUE";
                    using (MySqlCommand cmd = new MySqlCommand(query, con))
                    {
                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            ddlCaregivers.DataSource = reader;
                            ddlCaregivers.DataTextField = "name";
                            ddlCaregivers.DataValueField = "id";
                            ddlCaregivers.DataBind();
                        }
                    }
                    ddlCaregivers.Items.Insert(0, new ListItem("-- Select Caregiver --", "0"));
                }
                catch (Exception ex)
                {
                    // Handle error
                    Response.Write($"<script>alert('Error loading caregivers: {ex.Message}');</script>");
                }
            }
        }

        protected void btnAssign_Click(object sender, EventArgs e)
        {
            int patientId = int.Parse(ddlPatients.SelectedValue);
            int caregiverId = int.Parse(ddlCaregivers.SelectedValue);

            if (patientId == 0 || caregiverId == 0)
            {
                Response.Write("<script>alert('Please select both a patient and a caregiver.');</script>");
                return;
            }

            using (MySqlConnection con = new MySqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    string query = "INSERT INTO PatientCaregiver (patient_id, caregiver_id, assigned_date) VALUES (@patient_id, @caregiver_id, CURDATE())";
                    using (MySqlCommand cmd = new MySqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@patient_id", patientId);
                        cmd.Parameters.AddWithValue("@caregiver_id", caregiverId);
                        cmd.ExecuteNonQuery();
                    }

                    Response.Write("<script>alert('Caregiver successfully assigned to patient.');</script>");
                }
                catch (Exception ex)
                {
                    Response.Write($"<script>alert('Error assigning caregiver: {ex.Message}');</script>");
                }
            }
        }
      
    }
}
