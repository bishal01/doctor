<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="doctor_project._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
  <div class="container d-flex justify-content-center align-items-center vh-100">
    <div class="card p-4 shadow-lg" style="width: 400px;">
        <h2 class="text-center mb-4">Register</h2>
        <div class="mb-3">
            <label for="username" class="form-label">Username</label>
            <asp:TextBox ID="txtUsername" CssClass="form-control" runat="server" placeholder="Enter your username"></asp:TextBox>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <asp:TextBox ID="txtPassword" CssClass="form-control" runat="server" TextMode="Password" placeholder="Enter your password"></asp:TextBox>
        </div>
        <div class="mb-3">
            <label for="confirmPassword" class="form-label">Confirm Password</label>
            <asp:TextBox ID="txtConfirmPassword" CssClass="form-control" runat="server" TextMode="Password" placeholder="Re-enter your password"></asp:TextBox>
        </div>
        <asp:Button ID="btnRegister" CssClass="btn btn-primary w-100" runat="server" Text="Register" OnClick="btnRegister_Click" />
        <div class="text-center mt-3">
            <p>Already registered? <a href="login.aspx">Login here</a>.</p>
        </div>
    </div>
</div>

    </main>
</asp:Content>
