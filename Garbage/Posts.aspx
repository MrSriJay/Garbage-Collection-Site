<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Posts.aspx.cs" Inherits="Garbage.Posts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="breadcrumb_area br_image">
            <div class="container">
                <div class="page-cover text-center">
                    <h2 class="page-cover-tittle">Reported Garbage Sites</h2>
                    <ol class="breadcrumb">
                        <li><a href="Home.aspx">Home</a></li>
                        <li class="active">Reported Garbage Sites</li>
                    </ol>
                </div>
            </div>
</section>
 <br /><br />
<div class="container">
      <div style="float:left;" >
          <div style="float:left; padding-top:10px">
               <span class="text text-success " style="font-size: 20px; font-weight: 500; "><i class="fas fa-filter"></i> Filter </span>&nbsp;&nbsp;&nbsp;
          </div>
          <div  style="float:left;">
              
              <asp:DropDownList ID="verification"  runat="server" CssClass="dropdown-toggle" ForeColor="Red" BackColor="#CC0000" OnSelectedIndexChanged="verification_SelectedIndexChanged" OnTextChanged="verification_TextChanged">
                                <asp:ListItem>All Posts</asp:ListItem>
                                <asp:ListItem>All Verified Posts</asp:ListItem>
                                <asp:ListItem>All Unverified Posts</asp:ListItem>
                                
           </asp:DropDownList>&nbsp;&nbsp;&nbsp;
          </div>
          <div  style="float:left;">
              <asp:Button ID="search" runat="server" Text="Search" Width="129px" CssClass="btn btn_hover mx-auto" OnClick="search_Click"    />  
          </div>
          
          
           
      </div>
      <div style="float:right">
          <a class="btn btn_hover_two" href="AddNewPost.aspx">Report Garbage Site</a>
      </div>
</div>

<div class="jumbotron jumbotron-fluid" style="background-color:white">

  <br /><br />
 
  <div class="container">

      <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="Repeater1_ItemCommand" OnItemDataBound="Repeater1_ItemDataBound" OnLoad="Repeater1_Load">
          <ItemTemplate>
              <div class="card container border-success" >

                  <div class="card-body">

                    <h3 class="card-title font-weight-bold"><%#Eval("postTitle")%></h3>
                    <hr />

                    <div class="card" style="width: 25rem; margin-top:10px;">
                        <br /> 
                      <asp:Image class="card-img-top" ID="Image2" runat="server" Style="margin:auto" ImageUrl='<%# Eval("img") %>' />
                    </div>

                    <br /> <br /> 

                    <p>
                    <a class="btn btn-light" data-toggle="collapse" href='#<%#Eval("postId")%>' role="button" aria-expanded="false" aria-controls="collapseExample">
                    Description
                    </a>
                    <a class="btn btn-light" data-toggle="collapse" href='#<%#Eval("postId")%>2' role="button" aria-expanded="false" aria-controls="collapseExample">
                    View in Map
                    </a>
                    
                    </p>
                    

                    <div class="collapse" id='<%#Eval("postId")%>'>
                        <div class="card card-body">
                        <p class="card-text"><%#Eval("postDecription")%></p>
                        </div>
                    </div>
                    <div class="collapse" id='<%#Eval("postId")%>2'>
            
                        <div class="card card-body">
                            
                            <div id='<%#Eval("postId")%>googleMap' style="width:100%;height:400px;">
                 
                            </div>  
                            <script>

                                function myMap() {
                          
                                var myLatlng = new google.maps.LatLng(<%#Eval("latitude")%>,<%#Eval("longitude")%>);
                                var mapOptions = {
                                    zoom: 15,
                                    center: myLatlng
                                }
                                var map = new google.maps.Map(document.getElementById('<%#Eval("postId")%>googleMap'), mapOptions);

                                var marker = new google.maps.Marker({
                                    position: myLatlng,
                                    title: "Hello World!",
                                    icon:'img/can.png',
                                });

                                // To add the marker to the map, call setMap();
                                marker.setMap(map);

                                }
                            </script>

                           <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCsyyCSjCZL6T9cVochyNT44gu-o_OLTB8&callback=myMap"></script> 

                        </div>
                    </div>
                    
                    <br /> <br /> 

                    <div>                 
                        <div style="float:left"><p class="card-text text-muted"><i class="lnr lnr-location"></i> <%#Eval("city")%></p></div>
                        <div style="float:right"><p class="card-text"><span class="lnr lnr-user"></span> <small class="text-muted"> <%#Eval("userid")%></small></p></div>
                    </div>
                      <br /> <br />
                    <div>
                        <div style="float:left"><p class="card-text text-danger"><span class="lnr lnr-star"></span> Validation Status : <asp:Label ID="Label1" runat="server" Text='<%#Eval("validatition")%>'></asp:Label> </p></div>
                        <div style="float:left"><p class="card-text text-danger">&nbsp;&nbsp; | &nbsp;&nbsp;<span class="lnr lnr-eye"></span> Importance Level : <asp:Label ID="Label2" runat="server" Text='<%#Eval("importance_level")%>'></asp:Label> </p></div>
                        <div style="float:right"><p class="card-text"><span class="lnr lnr-calendar-full"></span> <small class="text-muted"> <%#Eval("datePosted")%></small></p></div>    
                    </div>
                  </div>
              </div>
            <br />
          </ItemTemplate>
      </asp:Repeater>
      
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CmsConnection %>" SelectCommand="SELECT * FROM [Post]"></asp:SqlDataSource>
      
  </div>
</div>
</asp:Content>
