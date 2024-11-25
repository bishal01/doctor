
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="add_patient.aspx.cs" Inherits="doctor_project.add_patient" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Patient</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
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

    <br>
    
       <form id="mainForm" runat="server">
        <!-- Centered Form Section -->
        <div class="d-flex align-items-center justify-content-center vh-100">
            <div class="card shadow-lg" style="width: 30rem; padding: 20px; border-radius: 10px;">
                <div class="card-body">
                    <h3 class="card-title text-center mb-4">Add Patient</h3>
                    
                    <!-- Patient Name -->
                    <div class="mb-3">
                        <label for="txtName" class="form-label">Patient Name</label>
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" Width="100%"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="Name is required." ForeColor="Red" CssClass="form-text text-danger"></asp:RequiredFieldValidator>
                    </div>
                    
                    <!-- Assign Doctor -->
                    <div class="mb-3">
                        <label for="ddlDoctors" class="form-label">Assign Doctor</label>
                        <asp:DropDownList ID="ddlDoctors" runat="server" CssClass="form-select">
                            <asp:ListItem Text="-- Select Doctor --" Value=""></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlDoctors" InitialValue="" ErrorMessage="Please select a doctor." ForeColor="Red" CssClass="form-text text-danger"></asp:RequiredFieldValidator>
                    </div>
                    
                    <!-- Medical History -->
                    <div class="mb-3">
                        <label for="txtMedicalHistory" class="form-label">Medical History</label>
                        <asp:TextBox ID="txtMedicalHistory" runat="server" TextMode="MultiLine" CssClass="form-control" Rows="4"></asp:TextBox>
                    </div>
                    
                    <!-- Joined Date -->
                    <div class="mb-3">
                        <label for="txtJoinedAt" class="form-label">Joined Date</label>
                        <asp:TextBox ID="txtJoinedAt" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtJoinedAt" ErrorMessage="Joined date is required." ForeColor="Red" CssClass="form-text text-danger"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegexValidatorDate" runat="server" ControlToValidate="txtJoinedAt" ValidationExpression="\d{4}-\d{2}-\d{2}" ErrorMessage="Date must be in YYYY-MM-DD format." ForeColor="Red" CssClass="form-text text-danger"></asp:RegularExpressionValidator>
                    </div>
                    
                    <!-- Submit Button -->
                    <div class="d-grid">
                        <asp:Button ID="btnSubmit" runat="server" Text="Add Patient" OnClick="btnSubmit_Click" CssClass="btn btn-primary btn-lg" />
                    </div>
                </div>
            </div>
        </div>
    </form>

    
    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>
</html>
