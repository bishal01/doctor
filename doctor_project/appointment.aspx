<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="appointment.aspx.cs" Inherits="doctor_project.appointment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
                <nav class="navbar navbar-expand-sm navbar-toggleable-sm navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" runat="server" href="home.aspx">JKLHealthcare</a>
        <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target=".navbar-collapse" title="Toggle navigation" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse d-sm-inline-flex justify-content-between">
            <ul class="navbar-nav flex-grow-1">
                <li class="nav-item">
                    <a class="nav-link" runat="server" href="home.aspx">Home</a>
                </li>
               
                  <li class="nav-item">
      <a class="nav-link" runat="server" href="appointment.aspx">Schedule Appointments</a>
  </li>

                <!-- Dropdown for Caregivers -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="caregiversDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Caregivers
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="caregiversDropdown">
                        <li><a class="dropdown-item" runat="server" href="caregiver.aspx">Assign Caregivers</a></li>
                        <li><a class="dropdown-item" runat="server" href="viewcaregiver.aspx">View Caregivers</a></li>
                    </ul>
                </li>


            </ul>
        </div>
    </div>
</nav>
      <form id="form1" runat="server">
        <div class="container mt-5">
            <h2>Schedule an Appointment</h2>
            <div class="mb-3">
                <label for="patientDropdown" class="form-label">Select Patient</label>
                <asp:DropDownList ID="ddlPatients" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>
            <div class="mb-3">
                <label for="caregiverDropdown" class="form-label">Select Caregiver</label>
                <asp:DropDownList ID="ddlCaregivers" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>
            <div class="mb-3">
                <label for="appointmentDate" class="form-label">Appointment Date & Time</label>
                <asp:TextBox ID="txtAppointmentDate" runat="server" CssClass="form-control" Placeholder="YYYY-MM-DD HH:MM:SS"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="details" class="form-label">Details</label>
                <asp:TextBox ID="txtDetails" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <asp:Button ID="btnSchedule" runat="server" CssClass="btn btn-primary" Text="Schedule Appointment" OnClick="btnSchedule_Click" />
        </div>
    </form>


      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>


  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
