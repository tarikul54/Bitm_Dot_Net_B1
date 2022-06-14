<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AdminLayout.Master" AutoEventWireup="true" CodeBehind="StudentRegistration.aspx.cs" Inherits="RealProjectB1.Student.StudentRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js">
    
        $(function () {
            $('.datepicker').datepicker({
                format: 'mm-dd-yyyy'
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Student Registration Form</h1>
        <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
            class="fas fa-download fa-sm text-white-50"></i>Generate Report</a>
    </div>
    <div class="card">
        <div class="card-header bg-gradient-primary text-light">
            Personal Details
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-md-6">
                    <label class="form-label">First Name</label>
                    <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Last Name</label>
                    <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <label class="form-label">Date Of Birth</label>
                    <asp:TextBox ID="txtDateOfBirth" runat="server" CssClass="form-control datepicker" TextMode="Date"></asp:TextBox>

                    <%--                   <div class="col-md-6">
                    <input type="text" class="form-control datepicker" placeholder="Select Date"/>
                    </div>--%>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Gender</label>
                    <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                        <asp:ListItem Value="0">Select ---</asp:ListItem>
                        <asp:ListItem Value="1">Male</asp:ListItem>
                        <asp:ListItem Value="2">Female</asp:ListItem>
                        <asp:ListItem Value="3">Others</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <label class="form-label">Contact Number</label>
                    <asp:TextBox ID="txtContactNumber" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-3">
                    <label class="form-label">Alternative Contact Number</label>
                    <asp:TextBox ID="txtAltContactNumber" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control "></asp:TextBox>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <label class="form-label">Address</label>
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                </div>
            </div>
        </div>
    </div>
    <div class="card mt-3">
        <div class="card-header bg-gradient-primary text-light">
            Educational Information
        </div>

        <div class="card-body">
            <div class="row">
                <div class="col-md-3">
                    <label class="form-label">Level/Cirtificate Completed</label>
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass>
                       <asp:ListItem Value="0">Select ---</asp:ListItem>
                        <asp:ListItem Value="1">SSC</asp:ListItem>
                        <asp:ListItem Value="2">HSC</asp:ListItem>
                        <asp:ListItem Value="3">Graduation</asp:ListItem>
                    </asp:DropDownList>

                </div>
                <div class="col-md-4">
                    <label class="form-label">Institute</label>
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-2">
                    <label class="form-label">Passing Year</label>
                    <asp:TextBox ID="txtPassingYear" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                
                <div class="col-md-2">
                    <label class="form-label">Result</label>
                    <asp:TextBox ID="txtResult" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-1">
             
                    <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn btn-primary form-control mt-4" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
