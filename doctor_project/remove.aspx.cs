using System;
using MySql.Data.MySqlClient; // Use MySQL client namespace

namespace doctor_project
{
    public partial class remove : System.Web.UI.Page
    {
        // Database connection string from web.config
        private string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            // Retrieve the patient ID from the text box
            string patientId = txtPatientId.Text.Trim();

            // Validate input
            if (string.IsNullOrEmpty(patientId))
            {
                ShowMessage("Please enter a valid Patient ID.");
                return;
            }

            try
            {
                // Establish connection and execute the DELETE query
                using (MySqlConnection con = new MySqlConnection(connectionString))
                {
                    string query = "DELETE FROM patients WHERE id = @id";
                    using (MySqlCommand cmd = new MySqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@id", patientId);
                        con.Open();

                        int rowsAffected = cmd.ExecuteNonQuery(); // Execute the delete command
                        con.Close();

                        // Check if the patient was successfully deleted
                        if (rowsAffected > 0)
                        {
                            ShowMessage("Patient deleted successfully.");
                        }
                        else
                        {
                            ShowMessage("No patient found with the given ID.");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ShowMessage("An error occurred: " + ex.Message.Replace("'", "\\'")); // Escape single quotes
            }
        }

        // Method to show a message to the user using JavaScript alert
        private void ShowMessage(string message)
        {
            string escapedMessage = message.Replace("'", "\\'").Replace("\n", "\\n").Replace("\r", "\\r");
            ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert(\"{escapedMessage}\");", true);
        }
    }
}
