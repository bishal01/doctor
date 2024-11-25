<%@ Page Title="Login" Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" MasterPageFile="~/Site.Master" Inherits="doctor_project.login" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
  <div class="container d-flex justify-content-center align-items-center vh-100">
    <div class="card shadow-lg p-4" style="width: 400px;">
        <h2 class="text-center mb-4">Login</h2>
        <div class="form-group mb-3">
            <label for="username">Username</label>
            <asp:TextBox ID="txtUsername" CssClass="form-control" runat="server" placeholder="Enter your username"></asp:TextBox>
        </div>
        <div class="form-group mb-3">
            <label for="password">Password</label>
            <asp:TextBox ID="txtPassword" CssClass="form-control" runat="server" TextMode="Password" placeholder="Enter your password"></asp:TextBox>
        </div>
        <asp:Button ID="btnLogin" CssClass="btn btn-primary w-100 mt-3" runat="server" Text="Login" OnClick="btnLogin_Click" />
        <div class="text-center mt-3">
            <p>Don't have an account? <a href="default.aspx">Register</a></p>
        </div>
    </div>
</div>
</asp:Content>
