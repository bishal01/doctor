using MySql.Data.MySqlClient;
using System;
using System.Web.UI;

namespace doctor_project
{
    public partial class appointment : System.Web.UI.Page
    {
        private string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDropdowns();
            }
        }

        private void LoadDropdowns()
        {
            using (MySqlConnection con = new MySqlConnection(connectionString))
            {
                con.Open();

                // Load patients
                string patientQuery = "SELECT id, name FROM patients";
                using (MySqlCommand cmd = new MySqlCommand(patientQuery, con))
                {
                    using (MySqlDataReader reader = cmd.ExecuteReader())
                    {
                        ddlPatients.DataSource = reader;
                        ddlPatients.DataTextField = "name";
                        ddlPatients.DataValueField = "id";
                        ddlPatients.DataBind();
                    }
                }

                // Load caregivers
                string caregiverQuery = "SELECT id, name FROM caregivers";
                using (MySqlCommand cmd = new MySqlCommand(caregiverQuery, con))
                {
                    using (MySqlDataReader reader = cmd.ExecuteReader())
                    {
                        ddlCaregivers.DataSource = reader;
                        ddlCaregivers.DataTextField = "name";
                        ddlCaregivers.DataValueField = "id";
                        ddlCaregivers.DataBind();
                    }
                }
            }
        }

        protected void btnSchedule_Click(object sender, EventArgs e)
        {
            try
            {
                using (MySqlConnection con = new MySqlConnection(connectionString))
                {
                    string query = @"
                        INSERT INTO appointments (patient_id, caregiver_id, appointment_date, details)
                        VALUES (@PatientId, @CaregiverId, @AppointmentDate, @Details);
                        INSERT INTO notifications (user_id, message, is_read)
                        VALUES (@CaregiverId, 'New appointment scheduled', 0)";

                    using (MySqlCommand cmd = new MySqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@PatientId", ddlPatients.SelectedValue);
                        cmd.Parameters.AddWithValue("@CaregiverId", ddlCaregivers.SelectedValue);
                        cmd.Parameters.AddWithValue("@AppointmentDate", txtAppointmentDate.Text);
                        cmd.Parameters.AddWithValue("@Details", txtDetails.Text);

                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                // Show success message
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Appointment successfully scheduled!');", true);

                // Clear form fields
                txtAppointmentDate.Text = string.Empty;
                txtDetails.Text = string.Empty;
            }
            catch (Exception ex)
            {
                // Handle the error (you can log it or display a message)
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", $"alert('Error: {ex.Message}');", true);
            }
        }
    }
}
