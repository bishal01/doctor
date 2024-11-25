<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="caregiver.aspx.cs" Inherits="doctor_project.caregiver" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Assign Caregiver</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" 
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
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
    <form id="formCaregiverAssignment" runat="server">
        <div class="container mt-5">
            <h3 class="text-center">Assign Caregiver to Patient</h3>
            <div class="row justify-content-center mt-4">
                <div class="col-md-6">
                    <div class="mb-3">
                        <label for="ddlPatients" class="form-label">Select Patient</label>
                        <asp:DropDownList ID="ddlPatients" runat="server" CssClass="form-control">
                            <asp:ListItem Text="-- Select Patient --" Value="0"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="mb-3">
                        <label for="ddlCaregivers" class="form-label">Select Caregiver</label>
                        <asp:DropDownList ID="ddlCaregivers" runat="server" CssClass="form-control">
                            <asp:ListItem Text="-- Select Caregiver --" Value="0"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="d-grid">
                        <asp:Button ID="btnAssign" runat="server" CssClass="btn btn-primary" Text="Assign" OnClick="btnAssign_Click" />
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
