<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="StaffLogin.aspx.cs" Inherits="Garbage.StaffLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<section class="breadcrumb_area br_image">
            <div class="container">
                <div class="page-cover text-center">
                    <h2 class="page-cover-tittle">Collecting Staff Login</h2>
                    <ol class="breadcrumb">
                        <li><a href="Home.aspx">Home</a></li>
                        <li class="active">Collecting Staff Login</li>
                    </ol>
                </div>
            </div>
</section>       
    
    <div class="jumbotron jumbotron-fluid" style="background-color:white">
      <div class="container">
          <br />
          <br />
          <table class="table table-striped">
          <tbody>
            <tr>
              <td style="font-weight:bold; height: 14px;" >Username</td>
              <td style="height: 14px">
                  <asp:TextBox ID="username" runat="server" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="username" ErrorMessage="Please enter Username" ForeColor="Red" ValidationGroup="SloginVal"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
              <td style="font-weight:bold; ">Password</td>
              <td>
                  <asp:TextBox ID="password" runat="server" TextMode="Password" Width="200px" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="password" ErrorMessage="Please enter Password" ForeColor="Red" ValidationGroup="SloginVal"></asp:RequiredFieldValidator>
                  <br />
                  <asp:Label ID="wrongPass" runat="server" ForeColor="Red" Text="&amp;nbsp;"></asp:Label>
              </td>
            </tr>
            <tr>
              <td style="height: 32px"></td>
              <td style="height: 32px">
                    <asp:Button ID="Button1" runat="server" Text="Login" Width="200px" CssClass="btn btn_hover mx-auto" OnClick="Button1_Click" ValidationGroup="SloginVal" />  
              </td>
            </tr> 
          </tbody>
        </table>

      </div>
    </div>
</asp:Content>
