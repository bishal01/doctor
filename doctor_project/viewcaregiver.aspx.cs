using System;
using System.Data;
using MySql.Data.MySqlClient;
using System.Web.UI;

namespace doctor_project
{
    public partial class viewcaregiver : Page
    {
        private string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
            }
        }

        private void BindGridView()
        {
            using (MySqlConnection con = new MySqlConnection(connectionString))
            {
                string query = @"
                    SELECT 
                        pc.patient_id AS PatientId,
                        pc.caregiver_id AS CaregiverId,
                        p.name AS PatientName,
                        c.name AS CaregiverName,
                        pc.assigned_date AS AssignedDate
                    FROM 
                        patientcaregiver pc
                    INNER JOIN 
                        patients p ON pc.patient_id = p.id
                    INNER JOIN 
                        caregivers c ON pc.caregiver_id = c.id";

                using (MySqlCommand cmd = new MySqlCommand(query, con))
                {
                    con.Open();
                    using (MySqlDataAdapter sda = new MySqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                }
            }
        }

        protected void GridView1_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            int patientId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values["PatientId"]);
            int caregiverId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values["CaregiverId"]);

            using (MySqlConnection con = new MySqlConnection(connectionString))
            {
                string query = "DELETE FROM patientcaregiver WHERE patient_id = @PatientId AND caregiver_id = @CaregiverId";

                using (MySqlCommand cmd = new MySqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@PatientId", patientId);
                    cmd.Parameters.AddWithValue("@CaregiverId", caregiverId);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            // Rebind the GridView to reflect changes
            BindGridView();
        }
    }
}
