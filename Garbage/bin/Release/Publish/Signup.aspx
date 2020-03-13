<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="Garbage.Signup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <section class="breadcrumb_area br_image">
                    <div class="container">
                        <div class="page-cover text-center">
                            <h2 class="page-cover-tittle">Sign Up</h2>
                            <ol class="breadcrumb">
                                <li><a href="Home.aspx">Sign Up</a></li>
                                <li class="active">Reported Garbage Sites</li>
                            </ol>
                        </div>
                    </div>
      </section>
     <div class="jumbotron jumbotron-fluid" style="background-color:white">
      <div class="container">
        
          <asp:Label ID="Label2" runat="server" Font-Size="X-Large" ForeColor="#009933" Text="&amp;nbsp;"></asp:Label>
          <br />
          <br />
          <table class="table table-striped table-responsive-sm"  >
          <tbody>
            <tr class="table-success">
              <td colspan="3" style="font-weight:bold; height: 64px;" class="text-dark"><span style="font-weight:100"><i>Personal Information</i></span></td>
            </tr>

            <tr class="table-light">
              <td style="font-weight:bold">Name <span style="font-weight:100"><i> in Full</i></span></td>
              <td style="height: 30px; width: 202px;">
                  <asp:TextBox ID="name" runat="server" Width="200px"></asp:TextBox>
                </td>
                <td style="height: 30px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="name" ErrorMessage="Name is requried" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr class="table-light">
              <td style="font-weight:bold">District</td>
              <td style="height: 30px; width: 202px;">
                  <asp:TextBox ID="district" runat="server" Width="200px"></asp:TextBox>
                </td>
              <td style="height: 30px">
                  
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="district" ErrorMessage="District is required" ForeColor="Red"></asp:RequiredFieldValidator>
                  
              </td>
            </tr>
            <tr class="table-light">
              <td style="font-weight:bold">Area</td>
              <td style="height: 30px; width: 202px;">
                  <asp:TextBox ID="area" runat="server" Width="200px"></asp:TextBox>
                </td>
                <td style="height: 30px">
                  
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="area" ErrorMessage="Area is required" ForeColor="Red"></asp:RequiredFieldValidator>
                  
              </td>
            </tr>
            <tr class="table-light">
              <td style="font-weight:bold; height: 30px;">Telephone</td>
              <td style="height: 30px; width: 202px;">
                  <asp:TextBox ID="telephone" runat="server" Width="200px"></asp:TextBox>
                </td>
                <td style="height: 30px">
                  
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="telephone" ErrorMessage="Telephone is required" ForeColor="Red"></asp:RequiredFieldValidator>
                  
              </td>
            </tr>
            <tr class="table-light">
              <td style="font-weight:bold">E-mail</td>
              <td style="height: 30px; width: 202px;">
                  <asp:TextBox ID="email" runat="server" Width="200px"></asp:TextBox>
                </td>
                <td style="height: 30px">
                  
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="email" ErrorMessage="Email is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                  
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email" ErrorMessage="Enter a valid email address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red"></asp:RegularExpressionValidator>
                  
              </td>
            </tr>
            <tr class="table-success">
              <td colspan="3" style="font-weight:bold; height: 66px;" class="text-dark"><span style="font-weight:100"><i>User Account Details</i></span></td>
            </tr>
            <tr>
              <td style="font-weight:bold">Username</td>
              <td style="height: 30px; width: 202px;">
                  <asp:TextBox ID="username" runat="server" Width="200px" OnTextChanged="username_TextChanged"></asp:TextBox>
                </td>
                <td style="height: 30px">
                  
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="username" ErrorMessage="Username is required" ForeColor="Red"></asp:RequiredFieldValidator>
                  
                    <br />
                    <asp:Label ID="usernameError" runat="server" ForeColor="Red" Text="&amp;nbsp;"></asp:Label>
                  
              </td>
            </tr>
            <tr class="table-light">
              <td style="font-weight:bold">Password</td>
              <td style="height: 30px; width: 202px;">
                  <asp:TextBox ID="pass" runat="server" Width="200px" TextMode="Password"></asp:TextBox>
                </td>
                <td style="height: 30px">
                  
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="pass" ErrorMessage="Password is required" ForeColor="Red"></asp:RequiredFieldValidator>
                  
              </td>
            </tr>
            <tr class="table-light">
              <td style="font-weight:bold">Confirm Password</td>
              <td style="height: 30px; width: 202px;">
                  <asp:TextBox ID="conpass" runat="server" Width="200px" TextMode="Password"></asp:TextBox>
                </td>
                <td style="height: 30px">
                  
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="conpass" ErrorMessage="Confirm password  is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="pass" ControlToValidate="conpass" ErrorMessage="Passwords are not matching" ForeColor="Red"></asp:CompareValidator>
                  
              </td>
            </tr>

            <tr class="table-success">
              <td></td>
              <td style="width: 202px" >
                  <asp:Button ID="Button1" runat="server" Text="Sign Up" Width="200px" CssClass="btn btn_hover mx-auto" OnClick="Button1_Click1" />  
              </td>
                <td style="height: 30px">
                  
                    &nbsp;</td>
            </tr>
            
          </tbody>
        </table>

      </div>
    </div>

</asp:Content>
