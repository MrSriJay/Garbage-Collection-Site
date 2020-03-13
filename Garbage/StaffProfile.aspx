<%@ Page Title=""  Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="StaffProfile.aspx.cs" Inherits="Garbage.StaffProfile1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<section class="breadcrumb_area br_image">
            <div class="container">
                <div class="page-cover text-center">
                    <h2 class="page-cover-tittle">Collecting Staff</h2>
                    <ol class="breadcrumb">
                        <li><a href="Home.aspx">Home</a></li>
                        <li class="active">Collecting Staff</li>
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
            <span class="fas fa-users-cog"></span> <asp:Label ID="hello" runat="server" Text="Label"></asp:Label>
        </h1>
        <p class="lead">
            <asp:Label ID="desc" runat="server" Text="Label"></asp:Label>
        </p>
    </div>
   <asp:Panel ID="report" runat="server">
    <div>
      
    </div>
    </asp:Panel>
</div>

<!-- Green Force Posts -->
<asp:Panel ID="greenPost" runat="server">
   
    <div class="jumbotron container" >
                <asp:Label ID="Label1" runat="server" Text="&amp;nbsp;" Font-Bold="True" ForeColor="#CC0000" Font-Size="Large"></asp:Label>
                <h1 class="display-4"><span class="fas fa-clipboard-list"></span> Collecting Staff To-Do List</h1>
                <br />
                <!-- Posts Grid -->
                <div class=" container border-success card card-body " >
                      <div style="float:left">
                          <div><span class="fas fa-search-location"></span>Sort by Importance Level</div>
                          <asp:DropDownList ID="Searchimportancelevel"  runat="server" CssClass="dropdown-toggle" ForeColor="Red" BackColor="#CC0000" OnSelectedIndexChanged="Searchimportancelevel_SelectedIndexChanged">
                                <asp:ListItem>Select Importance Level</asp:ListItem>
                                <asp:ListItem>All</asp:ListItem>
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                            </asp:DropDownList>&nbsp;
                          <asp:Button ID="searchbtn" CssClass="btn btn-light" runat="server" Text="Search" OnClick="searchbtn_Click" />&nbsp;
                     </div> 
                </div>
                 <br />
                <asp:GridView ID="GridView1" Width="100%" CssClass="table table-responsive" runat="server" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="postId" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" HeaderText="Details" SelectText="View More" />
                        <asp:BoundField DataField="postId" HeaderText="postId" ReadOnly="True" SortExpression="postId" />
                        <asp:BoundField DataField="postTitle" HeaderText="postTitle" SortExpression="postTitle" />
                        <asp:BoundField DataField="postDecription" HeaderStyle-CssClass="Hide" HeaderText="postDecription" ItemStyle-CssClass="Hide" SortExpression="postDecription">
                        <HeaderStyle CssClass="Hide" />
                        <ItemStyle CssClass="Hide" />
                        </asp:BoundField>
                        <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
                        <asp:BoundField DataField="latitude" HeaderStyle-CssClass="Hide" HeaderText="latitude" ItemStyle-CssClass="Hide" SortExpression="latitude">
                        <HeaderStyle CssClass="Hide" />
                        <ItemStyle CssClass="Hide" />
                        </asp:BoundField>
                        <asp:BoundField DataField="longitude" HeaderStyle-CssClass="Hide" HeaderText="longitude" ItemStyle-CssClass="Hide" SortExpression="longitude">
                        <HeaderStyle CssClass="Hide" />
                        <ItemStyle CssClass="Hide" />
                        </asp:BoundField>
                        <asp:BoundField DataField="datePosted" HeaderText="datePosted" SortExpression="datePosted" />
                        <asp:BoundField DataField="validatition" HeaderText="validatition" SortExpression="validatition" />
                        <asp:BoundField DataField="importance_level" HeaderText="importance_level" SortExpression="importance_level" />
                        <asp:BoundField DataField="userid" HeaderText="userid" SortExpression="userid" />
                        <asp:BoundField DataField="img" HeaderStyle-CssClass="Hide" HeaderText="img" ItemStyle-CssClass="Hide" SortExpression="img">
                        <HeaderStyle CssClass="Hide" />
                        <ItemStyle CssClass="Hide" />
                        </asp:BoundField>
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CmsConnection %>" SelectCommand="SELECT * FROM [Post] WHERE (([validatition] = @validatition) AND ([importance_level] = @importance_level))" OnLoad="SqlDataSource1_Load">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="YES" Name="validatition" Type="String" />
                        <asp:ControlParameter ControlID="Searchimportancelevel" Name="importance_level" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
            <!-- Post Details -->
            <div class="card-body container">
                
                <div class="card" style="width: 25rem; margin-top:10px;">
                <br /> 
                <asp:Image class="card-img-top" ID="Image1" runat="server" Style="margin:auto"   />
                </div>
                <asp:Label ID="Label9" runat="server" Text="&amp;nbsp;"></asp:Label>
                <div class="card card-body">
                     <h4><asp:Label ID="UserImportanceL" runat="server"   Width="100%" heigth="100%"></asp:Label></h4>
                     
                     <h6>Post ID</h6>
                     <p><asp:Label ID="UserPostID" runat="server"   Width="100%" heigth="100%"></asp:Label></p>
                </div>
                <br />
                <div class="card card-body">
                     <h6>Post Title</h6>
                     <p><asp:Label ID="u_title" runat="server"   Width="100%" heigth="100%"></asp:Label></p>
                </div>
                <br />
                <div class="card card-body">
                    <h6>Post Description</h6>
                    <p><asp:Label ID="u_description" runat="server"   Width="100%" heigth="100%"></asp:Label></p>
                </div>
                 <br />
                <div class="card card-body">
                    <h6>City</h6>
                    <p>
                    <asp:Label ID="U_city" runat="server"   Width="100%" heigth="100%"></asp:Label>
                    </p>
                    <h5>Date Posted</h5>
                    <p>
                    <asp:Label ID="U_Date" runat="server"   Width="100%" heigth="100%"></asp:Label>
                    </p>
                    <h5>Posted By</h5>
                    <p>
                    <asp:Label ID="U_User" runat="server"   Width="100%" heigth="100%"></asp:Label>
                    </p>
                </div>
                <br />
                <div class="card card-body">
                    <h6>Location</h6>
                    
                    <div id='googleMap' style="width:100%;height:400px;"></div>
                    <asp:HiddenField ID="hfLat" runat="server" />
                    <asp:HiddenField ID="hfLng" runat="server" />
                    <asp:Label ID="Lat" runat="server" ></asp:Label>
                    <asp:Label ID="Lng" runat="server"></asp:Label>
                </div>
                <br />
            <br />
            <table class="table table-striped" style="background-color:white">
            <tbody>
            <tr>    
                <td style="height: 32px; width: 208px;">
                    <asp:Button ID="cleaned" runat="server" Text="Cleaned" Width="100%" CssClass="btn btn_hover_red mx-auto" OnClick="cleaned_Click" />    
                </td>
            </tr>
            
            </tbody>
        </table>
    </div>
    </div>
    
</asp:Panel>
<!-- Green Force Posts END -->


<script>
    function myMap() {
    var lat = parseFloat(document.getElementById("<%=hfLat.ClientID %>").value);
    var lng = parseFloat(document.getElementById("<%=hfLng.ClientID %>").value);
    var myLatlng = new google.maps.LatLng(lat, lng);
    var mapOptions = {
        zoom: 15,
        center: myLatlng
    }
    var map = new google.maps.Map(document.getElementById('googleMap'), mapOptions);

    var marker = new google.maps.Marker({
        position: myLatlng, 
        icon:'img/can.png',
    });

    // To add the marker to the map, call setMap();
    marker.setMap(map);

    }
</script>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCsyyCSjCZL6T9cVochyNT44gu-o_OLTB8&callback=myMap"></script> 


</asp:Content>
