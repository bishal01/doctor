<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="doctor_project.home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
    <form id="form1" runat="server">
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

                <li class="nav-item">
                    <asp:LinkButton ID="btnLogout" runat="server" CssClass="nav-link" OnClick="Logout_Click">Logout</asp:LinkButton>
                </li>
            </ul>
        </div>
    </div>
</nav>

     <div class="container mt-5">
    <div class="row gy-4">
        <!-- View Patient -->
        <div class="col-md-4">
            <div class="card shadow-lg h-100">
                <img src="view.JPEG" class="card-img-top fixed-image" alt="View Patient">
                <div class="card-body text-center">
                    <h5 class="card-title text-primary">View Patient</h5>
                    <p class="card-text">See details of registered patients.</p>
                    <asp:Button ID="btnViewPatient" runat="server" CssClass="btn btn-primary" Text="View Patients" OnClick="btnViewPatient_Click" />
                </div>
            </div>
        </div>

        <!-- Add Patient -->
        <div class="col-md-4">
            <div class="card shadow-lg h-100">
                <img src="add.PNG" class="card-img-top fixed-image" alt="Add Patient">
                <div class="card-body text-center">
                    <h5 class="card-title text-success">Add Patient</h5>
                    <p class="card-text">Register a new patient in the system.</p>
                    <asp:Button ID="btnAddPatient" runat="server" CssClass="btn btn-success" Text="Add Patient" OnClick="RedirectToAddPatient" />
                </div>
            </div>
        </div>

        <!-- Remove Patient -->
        <div class="col-md-4">
            <div class="card shadow-lg h-100">
                <img src="remove.PNG"  class="card-img-top fixed-image" alt="Remove Patient">
                <div class="card-body text-center">
                    <h5 class="card-title text-danger">Remove Patient</h5>
                    <p class="card-text">Delete a patient's record from the system.</p>
                    <asp:Button ID="btnRemovePatient" runat="server" Text="Remove Patient" CssClass="btn btn-danger" OnClick="RedirectToRemovePage" />
                </div>
            </div>
        </div>
    </div>
</div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>


    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
