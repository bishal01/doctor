using System;
using System.Web;

namespace doctor_project
{
    public partial class home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if the user is logged in by verifying the session variable
            if (Session["username"] == null)
            {
                // Redirect to login page if the session does not exist
                Response.Redirect("login.aspx");
            }
        }
        protected void Logout_Click(object sender, EventArgs e)
        {
            // Clear the session and redirect to the login page
            Session.Abandon(); // Clears all session data
            Response.Redirect("login.aspx");

        }
        protected void RedirectToAddPatient(object sender, EventArgs e)
        {
            Response.Redirect("add_patient.aspx");
        }
        protected void btnViewPatient_Click(object sender, EventArgs e)
        {
            Response.Redirect("view_patient.aspx");
        }
        protected void RedirectToRemovePage(object sender, EventArgs e)
        {
            Response.Redirect("remove.aspx");
        }
    }
}
