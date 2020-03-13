<%@ Page Title="" MaintainScrollPositionOnPostback="true" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="AdminProfile.aspx.cs" Inherits="Garbage.AdminProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--================Breadcrumb Area =================-->
<section class="breadcrumb_area br_image">
            <div class="container">
                <div class="page-cover text-center">
                    <h2 class="page-cover-tittle">Admin Control Panel</h2>
                    <ol class="breadcrumb">
                        <li><a href="Home.aspx">Home</a></li>
                        <li class="active">Admin Control Panel</li>
                    </ol>
                </div>
            </div>
</section>
<br /><br />

<div class=" container border-success card card-body" >
      <div style="float:left">
          <a class="btn btn_hover" href="#greenForceMembers">Green Force Members</a>&nbsp;
          <a class="btn btn_hover" href="#createSAcc">Create Staff Account</a>&nbsp;
          <a class="btn btn_hover" href="#article">Post Article</a>&nbsp;
     </div> 
</div>

<!-- Green Force Members -->
<div class="jumbotron jumbotron-fluid" style="background-color:white" id="greenForceMembers">
  <div class="container ">
      <div class="jumbotron">
          <h1 class="display-4"><span class="fas fa-user-cog"></span> Green Force Members</h1>
          <br />
           <asp:GridView ID="GridView1" CssClass="table table-responsive " runat="server" AutoGenerateColumns="False" DataKeyNames="username" DataSourceID="cms" AllowSorting="True" ShowFooter="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
              <Columns>
                  <asp:CommandField ShowSelectButton="True" HeaderText="Select User" />
                  <asp:BoundField DataField="username" HeaderText="username" ReadOnly="True" SortExpression="username" />
                  <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                  <asp:BoundField DataField="district" HeaderText="district" SortExpression="district" />
                  <asp:BoundField DataField="area" HeaderText="area" SortExpression="area" />
                  <asp:BoundField DataField="telephone" HeaderText="telephone" SortExpression="telephone" />
                  <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                  <asp:BoundField DataField="member_type" HeaderText="member_type" SortExpression="member_type" />
              </Columns>
            </asp:GridView>
           <br />
          <table class="table table-striped" style="background-color:white">
          <tbody>
            <tr class="table-light">
              <td style="font-weight:bold; width: 902px;" >name</td>
              <td style="height: 30px; width: 208px;">
                  <asp:Label ID="name" runat="server" Width="200px">&nbsp;</asp:Label>
                </td>
                <td>
                   
                </td>
            </tr>
            <tr class="table-light">
              <td style="font-weight:bold; width: 902px;" >Username</td>
              <td style="height: 30px; width: 208px;">
                  <asp:Label ID="username" runat="server" Width="200px">&nbsp;</asp:Label>
                </td>
                <td>
                   
                </td>
            </tr>
            <tr class="table-light">
              <td style="font-weight:bold; height: 45px; width: 902px;">Email</td>
              <td style="height: 45px; width: 208px;">
                  <asp:Label ID="Email" runat="server" Width="200px">&nbsp;</asp:Label>
              </td>
             <td>
                  
                </td>     
            </tr>
            <tr class="table-light">
              <td style="font-weight:bold; height: 45px; width: 902px;">Member Status</td>
              <td style="height: 45px; width: 208px;">
                  <asp:Label ID="memberstat" runat="server" Width="200px">&nbsp;</asp:Label>
              </td>
              <td>
                  
                </td>     
            </tr>
            <tr>
              <td style="height: 32px; width: 902px;"><asp:Button ID="Button2" runat="server" Text="Assign Captain" Width="200px" CssClass="btn btn_hover mx-auto" OnClick="Button2_Click"  /> <asp:Button ID="remomveCap" runat="server" Text="Remove Captain" Width="200px" style="margin-left:20px" CssClass="btn btn_hover mx-auto" OnClick="remomveCap_Click"  />  </td>
              <td style="height: 32px; width: 208px;">
                  <asp:Button ID="Button1" runat="server" Text="Delete User" Width="200px" CssClass="btn btn_hover mx-auto" OnClick="Button1_Click"  />  
              </td>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="&amp;nbsp;"></asp:Label>
                </td>
            </tr>
            
          </tbody>
        </table>
     </div>
     
     <!-- Create Collecting Staff Accounts -->
     <div class="jumbotron jumbotron-fluid" style="background-color:white" id="createSAcc">
      <div class="container jumbotron">
          <h2 class="display-4"> <span class="fas fa-user-plus"></span>  Create Collecting Staff Accounts</h2>
          <br />
          <asp:Label ID="Label2" runat="server" Font-Size="X-Large" ForeColor="#009933" Text="&amp;nbsp;"></asp:Label>
          <br />
          <table class="table table-striped table-responsive-sm"  >
          <tbody>
            <tr class="table-light">
              <td style="font-weight:bold">Name <span style="font-weight:100"><i> in Full</i></span></td>
              <td style="height: 30px; width: 202px;">
                  <asp:TextBox ID="staffname" runat="server" Width="200px"></asp:TextBox>
                </td>
                <td style="height: 30px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name is requried" ForeColor="Red" ControlToValidate="staffname" ValidationGroup="createStaffAcc"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr class="table-light">
              <td style="font-weight:bold">Username</td>
              <td style="height: 30px; width: 202px;">
                  <asp:TextBox ID="staffusername" runat="server" Width="200px"></asp:TextBox>
                </td>
                <td style="height: 30px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="staffusername" ErrorMessage="Username is requried" ForeColor="Red" ValidationGroup="createStaffAcc"></asp:RequiredFieldValidator>
                    <br />
                    <asp:Label ID="usernametaken" runat="server" ForeColor="#CC0000" Text="&amp;nbsp;"></asp:Label>
                </td>
            </tr>
            <tr class="table-light">
              <td style="font-weight:bold">Passowrd</td>
              <td style="height: 30px; width: 202px;">
                  <asp:TextBox ID="staffpassword" runat="server" Width="200px"></asp:TextBox>
                </td>
                <td style="height: 30px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="staffpassword" ErrorMessage="Password is requried" ForeColor="Red" ValidationGroup="createStaffAcc"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr class="table-light">
              <td style="font-weight:bold"></td>
              <td style="height: 30px; width: 202px;">
                  <asp:Button ID="createStaffAcc" runat="server" CssClass="btn btn_hover mx-auto" style=" width: 100%" Text="Create Account"  ValidationGroup="createStaffAcc" OnClick="createStaffAcc_Click" />
                </td>
                <td style="height: 30px">
                  
                </td>
            </tr>
            </tbody>
            </table>
              <!-- Update or Delete User -->
              <h5 class="text-muted"> <span class="fas fa-user-edit "></span>  Edit / Delete Staff Member</h5>
              <div class="row">
                  
                  <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                      <asp:GridView ID="collectingStaff" runat="server" CssClass="table table-responsive" Width="100%"  AutoGenerateColumns="False" CellPadding="4" DataKeyNames="staffUername" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" AllowPaging="True" OnPageIndexChanged="collectingStaff_PageIndexChanged" OnSelectedIndexChanged="collectingStaff_SelectedIndexChanged" PageSize="5">
                      <AlternatingRowStyle BackColor="White" />
                      <Columns>
                          <asp:CommandField ShowSelectButton="True" />
                          <asp:BoundField DataField="staffUername" HeaderText="staffUername" ReadOnly="True" SortExpression="staffUername" />
                          <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                          <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
                      </Columns>
                      <EditRowStyle BackColor="#7C6F57" />
                      <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                      <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                      <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                      <RowStyle BackColor="#E3EAEB" />
                      <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                      <SortedAscendingCellStyle BackColor="#F8FAFA" />
                      <SortedAscendingHeaderStyle BackColor="#246B61" />
                      <SortedDescendingCellStyle BackColor="#D4DFE1" />
                      <SortedDescendingHeaderStyle BackColor="#15524A" />
                  </asp:GridView>
                  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CmsConnection %>" SelectCommand="SELECT * FROM [Staff] ORDER BY [name]"></asp:SqlDataSource>
                  </div>
                  <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                      <asp:Button ID="Button3" runat="server" CssClass="btn btn_hover mx-auto" style=" width: 100%" Text="Update Account"  ValidationGroup="createStaffAcc" OnClick="Button3_Click" />
                      <asp:Button ID="Button5" runat="server" CssClass="btn btn_hover mx-auto" style=" width: 100%" Text="Delete Account"  ValidationGroup="createStaffAcc" OnClick="Button5_Click" />
                  </div>
              </div>
          </div>
           
         </div>

      <!-- Create Article -->
      <div class="jumbotron-fluid" style="background-color:white" id="article">
      <div class="container jumbotron">
          <h2 class="display-4"> <span class="fas fa-newspaper"></span> Post Article</h2>
          
          <br />
          <asp:Label ID="Label3" runat="server" Font-Size="X-Large" ForeColor="#009933" Text="&amp;nbsp;"></asp:Label>
          <br />
          <table class="table table-striped table-responsive-sm"  >
          <tbody>
              <tr class="table-light">
              <td style="font-weight:bold">Article ID</td>
              <td style="height: 30px; width: 700px;">
                  <asp:Label ID="aID" runat="server" Text="Will be Automatically Generated"></asp:Label>
              </td>
              <td style="height: 30px">
                   
                </td>
            </tr>
            <tr class="table-light">
              <td style="font-weight:bold">Article Title</td>
              <td style="height: 30px; width: 700px;">
                  <asp:TextBox ID="articleTitle" runat="server" Width="700px"></asp:TextBox>
                </td>
                <td style="height: 30px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Article Title is requried" ForeColor="Red" ControlToValidate="articleTitle" ValidationGroup="createArticle"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr class="table-light">
              <td style="font-weight:bold">Article</<</td>
              <td style="height:100px; width: 700px;">
                  <asp:TextBox ID="articleDesc" runat="server" Width="700px" Height="200px" TextMode="MultiLine"></asp:TextBox>
                </td>
                <td style="height:100px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="articleDesc" ErrorMessage="Article Description is requried" ForeColor="Red" ValidationGroup="createArticle"></asp:RequiredFieldValidator>
                    <asp:Button ID="deleteArtcile" runat="server" CssClass="btn btn_hover mx-auto" style=" width: 100%" Text="Delete Artcle"   ValidationGroup="createArticle" OnClick="deleteArtcile_Click"/>
                </td>
            </tr>
            <tr class="table-light">
              <td style="font-weight:bold"></td>
              <td style="height: 30px; width: 700px;">
                  <asp:Button ID="Button4" runat="server" CssClass="btn btn_hover mx-auto" style=" width: 100%" Text="Post Article"  ValidationGroup="createArticle" OnClick="Button4_Click" />
                </td>
                <td style="height: 30px">
                  
                </td>
            </tr>
            </tbody>
            </table>
             <!-- Display Article -->
          <asp:GridView ID="GridView2"  CssClass="table table-responsive" Width="100%"  runat="server" DataSourceID="XmlDataSource1" AllowPaging="True" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" OnRowDeleting="GridView2_RowDeleting" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal">
              <Columns>
                  <asp:CommandField ShowSelectButton="True" />
              </Columns>
              <FooterStyle BackColor="White" ForeColor="#333333" />
              <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
              <RowStyle BackColor="White" ForeColor="#333333" />
              <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
              <SortedAscendingCellStyle BackColor="#F7F7F7" />
              <SortedAscendingHeaderStyle BackColor="#487575" />
              <SortedDescendingCellStyle BackColor="#E5E5E5" />
              <SortedDescendingHeaderStyle BackColor="#275353" />
          </asp:GridView>
          <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/App_Data/Articles.xml" TransformFile="~/App_Data/ArticlesConvert.xslt"></asp:XmlDataSource>
          </div>
         </div>
          
      <asp:SqlDataSource ID="cms" runat="server" ConnectionString="<%$ ConnectionStrings:CmsConnection %>" SelectCommand="SELECT [username], [name], [district], [area], [telephone], [email], [member_type] FROM [Members]"></asp:SqlDataSource>


    
  </div>
</div>

</asp:Content>
