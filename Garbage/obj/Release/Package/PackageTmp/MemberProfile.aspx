<%@ Page Title="" MaintainScrollPositionOnPostback="true" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="MemberProfile.aspx.cs" Inherits="Garbage.MemberProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<section class="breadcrumb_area br_image">
            <div class="container">
                <div class="page-cover text-center">
                    <h2 class="page-cover-tittle">Profile</h2>
                    <ol class="breadcrumb">
                        <li><a href="Home.aspx">Home</a></li>
                        <li class="active">Profile</li>
                    </ol>
                </div>
            </div>
</section>
<style>
.Hide { display:none; }
</style>


<div class="jumbotron jumbotron-fluid container" style="background-color:white">
    <div>
        <h1 class="display-4">
            <span class="lnr lnr-user"></span><asp:Label ID="hello" runat="server" Text="Label"></asp:Label>
        </h1>
        <p class="lead">
            <asp:Label ID="desc" runat="server" Text="Label"></asp:Label>
        </p>
    </div>
   <asp:Panel ID="report" runat="server">
    <div>
      <div style="float:right">
          <a class="btn btn_hover_two" href="AddNewPost.aspx">Report Garbage Site</a>
     </div>
    </div>
    </asp:Panel>
</div>
<!-- Green Force Posts -->
<asp:Panel ID="greenPost" runat="server">
    <div class="jumbotron container" >
                <h2 class="text-danger"><span class="lnr lnr-users"></span> Verify Green Task Force Posts</h2>
                <br />
                <!-- Posts Grid -->
                <asp:GridView ID="GridView1" CssClass="table" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="getPosts" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" PageSize="5" DataKeyNames="postId" OnRowDataBound="GridView1_RowDataBound">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="postId" HeaderStyle-CssClass="Hide" HeaderText="postId" ItemStyle-CssClass="Hide" ReadOnly="True" SortExpression="postId">
                        <HeaderStyle CssClass="Hide" />
                        <ItemStyle CssClass="Hide" />
                        </asp:BoundField>
                        <asp:BoundField DataField="postTitle" HeaderText="postTitle" SortExpression="postTitle">
                        </asp:BoundField>
                        <asp:BoundField DataField="postDecription" HeaderText="postDecription" SortExpression="postDecription"  HeaderStyle-CssClass="Hide" ItemStyle-CssClass="Hide">
                        <HeaderStyle CssClass="Hide" />
                        <ItemStyle CssClass="Hide" />
                        </asp:BoundField>
                        <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
                        <asp:BoundField DataField="datePosted" HeaderText="datePosted" SortExpression="datePosted" />
                        <asp:BoundField DataField="validatition" HeaderText="validatition" SortExpression="validatition" />
                        <asp:BoundField DataField="importance_level" HeaderText="importance_level" SortExpression="importance_level"  HeaderStyle-CssClass="Hide" ItemStyle-CssClass="Hide">
                        <HeaderStyle CssClass="Hide" />
                        <ItemStyle CssClass="Hide" />
                        </asp:BoundField>
                        <asp:BoundField DataField="userid" HeaderText="userid" SortExpression="userid" > </asp:BoundField>
                        <asp:BoundField DataField="img" HeaderText="img" SortExpression="img"  HeaderStyle-CssClass="Hide" ItemStyle-CssClass="Hide" >
                        <HeaderStyle CssClass="Hide" />
                        <ItemStyle CssClass="Hide" />
                        </asp:BoundField>
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerSettings PageButtonCount="20" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                    <SortedDescendingHeaderStyle BackColor="#820000" />
                </asp:GridView>
                <asp:SqlDataSource ID="getPosts" runat="server" ConnectionString="<%$ ConnectionStrings:CmsConnection %>" SelectCommand="SELECT [postId], [postTitle], [postDecription], [city], [datePosted], [validatition], [importance_level], [userid], [img] FROM [Post] WHERE ([validatition] = @validatition) ORDER BY [datePosted]">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="NO" Name="validatition" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <div class="card-body container">
                        <h5 class="card-title font-weight-bold"> <asp:Label ID="title" runat="server" Width="100%">&nbsp;</asp:Label></h5>
                        <div class="card" style="width: 25rem; margin-top:10px;">
                        <br /> 
                        <asp:Image class="card-img-top" ID="Image2" runat="server" Style="margin:auto"   />
                        </div>
                        <p>
                        <br />
                        <a class="btn btn-light" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
                        Description
                        </a>
                        </p>
                        <div class="collapse" id="collapseExample">
                        <div class="card card-body">
                            <p> <asp:Label ID="description" runat="server" Width="100%">&nbsp;</asp:Label></p>
                        </div>
                    </div>
                    <br />
                    <br />
                    <table class="table table-striped" style="background-color:white">
                    <tbody>
                    <tr class="table-light">
                        <td style="font-weight:bold; height: 45px; width: 902px;">Post ID</td>
                        <td style="height: 45px; width: 208px;">
                            <asp:Label ID="id" runat="server" Width="200px">&nbsp;</asp:Label>
                        </td>     
                    </tr>
                    <tr class="table-light">
                        <td style="font-weight:bold; height: 45px; width: 902px;">City</td>
                        <td style="height: 45px; width: 208px;">
                            <asp:Label ID="city" runat="server" Width="200px">&nbsp;</asp:Label>
                        </td>     
                    </tr>
                    <tr class="table-light">
                        <td style="font-weight:bold; height: 45px; width: 902px;">Date Posted</td>
                        <td style="height: 45px; width: 208px;">
                            <asp:Label ID="date" runat="server" Width="200px">&nbsp;</asp:Label>
                        </td>     
                    </tr>
                    <tr class="table-light">
                        <td style="font-weight:bold; height: 45px; width: 902px;">Validatition</td>
                        <td style="height: 45px; width: 208px;">
                            <asp:Label ID="validation" runat="server" Width="200px">&nbsp;</asp:Label>
                  
                  
                        </td>     
                    </tr>
                    <tr class="table-light">
                        <td style="font-weight:bold; height: 45px; width: 902px;">Posted By</td>
                        <td style="height: 45px; width: 208px;">
                            <asp:Label ID="user" runat="server" Width="200px">&nbsp;</asp:Label>
                 
                  
                        </td>     
                    </tr>
                    <tr>
                        <td style="height: 32px; width: 902px;">
                            <asp:DropDownList ID="importancelevel"  runat="server" CssClass="dropdown-toggle" ForeColor="Red" BackColor="#CC0000">
                                <asp:ListItem>Select Importance Level</asp:ListItem>
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                            </asp:DropDownList>&nbsp;
                            <asp:Button ID="Button2" runat="server" Text="Approve Report" Width="200px" CssClass="btn btn_hover_red mx-auto" OnClick="Button2_Click"   ValidationGroup="valG" />&nbsp;
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Select Importance Level" InitialValue="Select Importance Level" ValidationGroup="valG" ControlToValidate="importancelevel" CssClass="text-danger"></asp:RequiredFieldValidator>
                        </td>
                        <td style="height: 32px; width: 208px;">
                            <asp:Button ID="Button1" runat="server" Text="Refuse Report" Width="200px" CssClass="btn btn_hover_red mx-auto" OnClick="Button1_Click"   />  
                  
                            <asp:Label ID="Label1" runat="server" Text="&amp;nbsp;"></asp:Label>
                        </td>
                    </tr>
            
                    </tbody>
                </table>
            </div>
    </div>
</asp:Panel>
<!-- Green Force Posts END -->

<br />

<!-- CurrentuserPosts Posts -->
<div class="jumbotron container" >
        <h2><span class="lnr lnr-user"></span> My Posts </h2>
        <br />
        <!-- user posts Grid -->
        <asp:GridView ID="GridView2" CssClass="table" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" PageSize="5" DataKeyNames="postId" OnRowDataBound="GridView1_RowDataBound">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" HeaderText="Select to Edit" />
                <asp:BoundField DataField="postId" HeaderText="postId" ReadOnly="True" SortExpression="postId" />
                <asp:BoundField DataField="postTitle" HeaderText="postTitle" SortExpression="postTitle" />
                <asp:BoundField DataField="postDecription" HeaderText="postDecription" SortExpression="postDecription" HeaderStyle-CssClass="Hide" ItemStyle-CssClass="Hide" >
<HeaderStyle CssClass="Hide"></HeaderStyle>

<ItemStyle CssClass="Hide"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
                <asp:BoundField DataField="latitude" HeaderText="latitude" SortExpression="latitude" />
                <asp:BoundField DataField="longitude" HeaderText="longitude" SortExpression="longitude" />
                <asp:BoundField DataField="datePosted" HeaderText="datePosted" SortExpression="datePosted" />
                <asp:BoundField DataField="validatition" HeaderText="validatition" SortExpression="validatition" HeaderStyle-CssClass="Hide" ItemStyle-CssClass="Hide" >
<HeaderStyle CssClass="Hide"></HeaderStyle>

<ItemStyle CssClass="Hide"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="userid" HeaderText="userid" SortExpression="userid" HeaderStyle-CssClass="Hide" ItemStyle-CssClass="Hide">
<HeaderStyle CssClass="Hide"></HeaderStyle>

<ItemStyle CssClass="Hide"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="img" HeaderText="img" SortExpression="img" HeaderStyle-CssClass="Hide" ItemStyle-CssClass="Hide">
<HeaderStyle CssClass="Hide"></HeaderStyle>

<ItemStyle CssClass="Hide"></ItemStyle>
                </asp:BoundField>
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerSettings PageButtonCount="20" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CmsConnection %>" SelectCommand="SELECT * FROM [Post] WHERE ([userid] = @userid)">
            <SelectParameters>
                <asp:SessionParameter Name="userid" SessionField="member" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server">
            <SelectParameters>
                <asp:Parameter DefaultValue="NO" Name="validatition" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <div class="card-body container">
                
                <div class="card" style="width: 25rem; margin-top:10px;">
                <br /> 
                <asp:Image class="card-img-top" ID="Image1" runat="server" Style="margin:auto"   />
                </div>
                <asp:Label ID="Label9" runat="server" Text="&amp;nbsp;"></asp:Label>
                <div class="card card-body">
                     <h6>Post ID</h6>
                     <p><asp:Label ID="UserPostID" runat="server"   Width="100%" heigth="100%"></asp:Label></p>
                </div>
                <br />
                <div class="card card-body">
                     <h6>Post Title</h6>
                     <p><asp:TextBox ID="u_title" runat="server"  CssClass="form-control" Width="100%" heigth="100%"></asp:TextBox></p>
                </div>
                <br />
                <div class="card card-body">
                    <h6>Post Description</h6>
                    <p><asp:TextBox ID="u_description" runat="server"  CssClass="form-control" Width="100%" heigth="100%" TextMode="MultiLine"></asp:TextBox></p>
                </div>
                 <br />
                <div class="card card-body">
                    <h6>City</h6>
                    <p>
                    <asp:DropDownList ID="U_city" runat="server" style="width: 100%; height: 100%" CssClass="dropdown-toggle">
                        <asp:ListItem>Colombo</asp:ListItem>
                        <asp:ListItem>Dehiwala-Mount Lavinia</asp:ListItem>
                        <asp:ListItem>Homagama</asp:ListItem>
                        <asp:ListItem>Kaduwela</asp:ListItem>
                        <asp:ListItem>Kesbewa</asp:ListItem>
                        <asp:ListItem>Kolonnawa</asp:ListItem>
                        <asp:ListItem>Maharagama</asp:ListItem>
                        <asp:ListItem>Moratuwa</asp:ListItem>
                        <asp:ListItem>Padukka</asp:ListItem>
                        <asp:ListItem>Dehiwala-Mount Lavinia</asp:ListItem>
                        <asp:ListItem>Avissawella </asp:ListItem>
                        <asp:ListItem>Sri Jayawardenepura Kotte</asp:ListItem>
                    </asp:DropDownList>
                    </p>
                </div>
                <br />
            <br />
            <table class="table table-striped" style="background-color:white">
            <tbody>
            <tr>
                <td style="height: 32px; width: 902px;"> 
                    <asp:Button ID="Button3" runat="server" Text="Update" Width="200px" CssClass="btn btn_hover mx-auto" OnClick="Button3_Click1"  />  </td>
                <td style="height: 32px; width: 208px;">
                    <asp:Button ID="Button4" runat="server" Text="Delete" Width="200px" CssClass="btn btn_hover mx-auto" OnClick="Button4_Click"/>    
                </td>
            </tr>
            
            </tbody>
        </table>
    </div>
</div>
<!-- userPosts Posts -->
<script>
    function UserDeleteConfirmation() {
    return confirm("Are you sure you want to delete this user?");
}
</script>
</asp:Content>
