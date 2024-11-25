using System;
using System.Web;
using MySql.Data.MySqlClient;

namespace doctor_project
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Optional: Add logic for Page_Load if needed
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (!IsFormValid())
            {
                return; // Stop processing if the form is not valid
            }

            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

            using (MySqlConnection conn = new MySqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    string query = "INSERT INTO users (username, password) VALUES (@username, @password)";

                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        // Use parameterized query to prevent SQL Injection
                        cmd.Parameters.AddWithValue("@username", txtUsername.Text);
                        cmd.Parameters.AddWithValue("@password", HashPassword(txtPassword.Text)); // Hash password for security

                        int rowsAffected = cmd.ExecuteNonQuery();
                        if (rowsAffected > 0)
                        {
                            Response.Write("<script>alert('Registration successful!');</script>");
                            Response.Redirect("login.aspx");
                        }
                        else
                        {
                            Response.Write("<script>alert('Registration failed. Please try again.');</script>");
                        }
                    }
                }
                catch (Exception ex)
                {
                    Response.Write($"<script>alert('Error: {HttpUtility.HtmlEncode(ex.Message)}');</script>");
                }
            }
        }

        private bool IsFormValid()
        {
            // Check if passwords match
            if (txtPassword.Text != txtConfirmPassword.Text)
            {
                Response.Write("<script>alert('Passwords do not match!');</script>");
                return false;
            }

            // Check if username and password are filled
            if (string.IsNullOrWhiteSpace(txtUsername.Text) || string.IsNullOrWhiteSpace(txtPassword.Text))
            {
                Response.Write("<script>alert('All fields are required!');</script>");
                return false;
            }

            return true;
        }

        private string HashPassword(string password)
        {
            // Simple hashing logic (SHA256)
            using (var sha256 = System.Security.Cryptography.SHA256.Create())
            {
                byte[] bytes = sha256.ComputeHash(System.Text.Encoding.UTF8.GetBytes(password));
                return Convert.ToBase64String(bytes);
            }
        }
    }
}
