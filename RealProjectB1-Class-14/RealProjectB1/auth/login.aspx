<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Blank.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="RealProjectB1.auth.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .input-group-text,
        .form-control,
        .btn{
            border-radius:0px !important;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid bg-gradient-primary vh-100">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-4">
                    <div class="site_logo  mt-5 text-center">
                        <img class="img-fluid w-50" src="../assets/img/logo.png" alt="Alternate Text" />
                    </div>
                    <div id="divMsg" runat="server" class="alert alert-danger">
                        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="card mt-1">
                        <div class="card-body ">

                            <div class="input-group flex-nowrap mt-4">
                                <span class="input-group-text" id=""><i class="fas fa-user"></i></span>
                                <asp:TextBox ID="txtUsername"  runat="server" CssClass ="form-control" placeholder="Username"></asp:TextBox>

                            </div>

                            <div class="input-group flex-nowrap mt-4">
                                <span class="input-group-text" id=""><i class="fas fa-lock"></i></span>
                                <asp:TextBox ID="txtPassword"  runat="server" CssClass ="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                            </div>
                            <div class="form-check mt-2">
                              
                              <asp:CheckBox ID="chkRememberMe" runat="server" CssClass="form-check-input"/>

                              <label class="form-check-label" for="flexCheckDefault">
                                Remember
                              </label>
                            </div>
                            <div class="input-group flex-nowrap mt-4 justify-content-end">
                                <span class="input-group-text" id=""><i class="fas fa-paper-plane"></i></span>
                                <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-success form-control" Text="Login" OnClick="btnLogin1_Click" />

                            </div>
                            <div class="login_links mt-3">
                                <a href="#" class="">Forgot Password</a>
                                <a href="#" class="float-right">Register</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
