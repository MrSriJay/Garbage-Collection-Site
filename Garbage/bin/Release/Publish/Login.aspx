<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Garbage.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <section class="breadcrumb_area br_image">
            <div class="container">
                <div class="page-cover text-center">
                    <h2 class="page-cover-tittle">Login</h2>
                    <ol class="breadcrumb">
                        <li><a href="Home.aspx">Home</a></li>
                        <li class="active">Login</li>
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
            <tr class="table-light">
              <td style="font-weight:bold" >Username</td>
              <td style="height: 30px; width: 208px;">
                  <asp:TextBox ID="username" runat="server" Width="200px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="username" ErrorMessage="Please enter Username" ForeColor="Red" ValidationGroup="loginVal"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
              <td style="font-weight:bold; height: 45px;">Password</td>
              <td style="height: 45px; width: 208px;">
                  <asp:TextBox ID="password" runat="server" TextMode="Password" Width="200px" ></asp:TextBox>
              </td>
              <td>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="password" ErrorMessage="Please enter Password" ForeColor="Red" ValidationGroup="loginVal"></asp:RequiredFieldValidator>
                  <br />
                  <asp:Label ID="wrongPass" runat="server" ForeColor="Red" Text="&amp;nbsp;"></asp:Label>
                </td>     
            </tr>
            <tr>
              <td style="height: 32px"></td>
              <td style="height: 32px; width: 208px;">
                  <asp:Button ID="Button1" runat="server" Text="Login" Width="200px" CssClass="btn btn_hover mx-auto" OnClick="Button1_Click" ValidationGroup="loginVal" />  
              </td>
                <td></td>
            </tr>
            <tr>
              <td style="height: 70px"></td>
              <td style="height: 70px; width: 208px;"><asp:HyperLink ID="HyperLink1" runat="server" CssClass="text-success" NavigateUrl="~/Signup.aspx"><span class="fas fa-user-plus "></span> New User Register Here</asp:HyperLink></td>
            <td></td>
            </tr>
              
           <tr>
              <td></td>
              <td style="width: 208px"><span class="fas fa-users-cog"></span> <asp:HyperLink ID="HyperLink3" runat="server" CssClass="text-dark" NavigateUrl="~/StaffLogin.aspx">Staff Login</asp:HyperLink></td>
               <td></td>
            </tr>
              <tr>
              <td></td>
              <td style="width: 208px"><span class="fas fa-user-lock"></span> <asp:HyperLink ID="HyperLink2" runat="server" CssClass="text-dark" NavigateUrl="~/AdminLogin.aspx">Admin Login</asp:HyperLink></td>
               <td></td>
            </tr>
          </tbody>
        </table>

      </div>
    </div>
</asp:Content>
