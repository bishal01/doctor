using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
namespace doctor_project
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Optional: Logic to run on page load (e.g., clearing session for logout)
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // Retrieve username and password from input controls
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            // Validate input fields
            if (string.IsNullOrWhiteSpace(username) || string.IsNullOrWhiteSpace(password))
            {
                DisplayAlert("Both username and password are required.");
                return;
            }

            // Retrieve connection string from Web.config
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

            using (MySqlConnection conn = new MySqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    // Query to check if the user exists
                    string query = "SELECT password FROM users WHERE username = @username";

                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        // Use parameterized query to prevent SQL injection
                        cmd.Parameters.AddWithValue("@username", username);

                        object result = cmd.ExecuteScalar();
                        if (result != null)
                        {
                            string hashedPassword = result.ToString();
                            // Verify hashed password with user input
                            if (VerifyPassword(password, hashedPassword))
                            {
                                // Set session variable for the logged-in user
                                Session["username"] = username;

                                // Redirect to home page or dashboard
                                Response.Redirect("home.aspx");
                            }
                            else
                            {
                                DisplayAlert("Invalid password. Please try again.");
                            }
                        }
                        else
                        {
                            DisplayAlert("Invalid username. Please try again.");
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Log error and display a user-friendly message
                    DisplayAlert($"An error occurred: {HttpUtility.HtmlEncode(ex.Message)}");
                }
            }
        }

        /// <summary>
        /// Verifies the input password against the stored hashed password.
        /// </summary>
        private bool VerifyPassword(string password, string hashedPassword)
        {
            using (var sha256 = System.Security.Cryptography.SHA256.Create())
            {
                byte[] bytes = sha256.ComputeHash(System.Text.Encoding.UTF8.GetBytes(password));
                string inputHash = Convert.ToBase64String(bytes);
                return inputHash == hashedPassword;
            }
        }

        /// <summary>
        /// Helper method to display an alert message to the user.
        /// </summary>
        private void DisplayAlert(string message)
        {
            Response.Write($"<script>alert('{HttpUtility.JavaScriptStringEncode(message)}');</script>");
        }
    }
}
