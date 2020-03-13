<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Map.aspx.cs" Inherits="Garbage.Map" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<section class="breadcrumb_area br_image">
            <div class="container">
                <div class="page-cover text-center">
                    <h2 class="page-cover-tittle">Map</h2>
                    <ol class="breadcrumb">
                        <li><a href="Home.aspx">Home</a></li>
                        <li class="active">Map</li>
                    </ol>
                </div>
            </div>
</section>
<div class="jumbotron jumbotron-fluid" style="background-color:white">
  <div class="container">
      <div style="float:left;" >
          <div style="float:left; padding-top:10px">
               <span class="text text-success " style="font-size: 20px; font-weight: 500; "><i class="fas fa-filter"></i> Filter </span>&nbsp;&nbsp;&nbsp;
          </div>
          <div  style="float:left;">
              
              <asp:DropDownList ID="verification"  runat="server" CssClass="dropdown-toggle" ForeColor="Black">
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
  <br />
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CmsConnection %>" SelectCommand="SELECT * FROM [Post]"></asp:SqlDataSource>

<div style="margin-top:40px">
     <div class="container">
        <span class="text-danger"><img src="img/red.png" width="50px"/>Clean immediately&nbsp;</span>
        <span class="text-danger"> <img src="img/yellow.png" width="50px"/>Clean within a week&nbsp;</span>
        <span class="text-primary"> <img src="img/blue.png" width="50px"/>Clean within a month&nbsp;</span>
        <span class="text-success"> <img src="img/nt.png" width="50px"/>Unverified garbage sites&nbsp;</span>
    </div> 
    <br />
      <div id="googleMap" style="width:100%;height:700px;"></div>
<script type="text/javascript">
var markers = [
<asp:Repeater ID="rptMarkers" runat="server" DataSourceID="SqlDataSource1">
<ItemTemplate>
            {
            "title": '<%# Eval("postTitle") %>',
            "lat": '<%# Eval("latitude") %>',
            "lng": '<%# Eval("longitude") %>',
            "imptlevel": '<%# Eval("importance_level") %>',
            "city": '<%# Eval("city") %>',
            "user": '<%# Eval("userid") %>',
            "img": '<%# Eval("img") %>',
            "val": '<%# Eval("validatition") %>',
            "date": '<%# Eval("datePosted") %>',
            "description": '<%# Eval("postDecription") %>'
        }
</ItemTemplate>
<SeparatorTemplate>
    ,
</SeparatorTemplate>
</asp:Repeater>
];
</script>
<script type="text/javascript">
    window.onload = function () {
        var mapOptions = {
            center: new google.maps.LatLng(markers[0].lat, markers[0].lng),
            zoom:10,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        var infoWindow = new google.maps.InfoWindow();
        var map = new google.maps.Map(document.getElementById("googleMap"), mapOptions);
        // InfoWindow content
            
        for (i = 0; i < markers.length; i++) {
            var data = markers[i]
            var myLatlng = new google.maps.LatLng(data.lat, data.lng);
            if (data.imptlevel == 3) {
                var marker = new google.maps.Marker({
                position: myLatlng,
                map: map,
                icon:'img/red.png',
                title: data.title
            });
            }
            else if (data.imptlevel == 2) {
                var marker = new google.maps.Marker({
                position: myLatlng,
                map: map,
                icon:'img/yellow.png',
                title: data.title
            });
            }
            else if (data.imptlevel == 1) {
                var marker = new google.maps.Marker({
                position: myLatlng,
                map: map,
                icon:'img/blue.png',
                title: data.title
            });
            }
             else if (data.imptlevel == 'NOT VERFIED') {
                var marker = new google.maps.Marker({
                position: myLatlng,
                map: map,
                icon:'img/nt.png',
                title: data.title
            });
            }
            
            (function (marker, data) {
                google.maps.event.addListener(marker, "click", function (e) {
                    infoWindow.setContent(
                        '<div>' +
                        '   <h6 class="text-success">' + data.title + '</h6> <br/>' + 
                        '   <div style="width:100%; float:left">' +
                        '       <div style="width:25%; float:left">' +
                        '           <img src="'+data.img.substr(1)+'" class="rounded mx-auto d-block" width="100%">'+
                        '        </div>'+
                        '       <div style="width:75%; float:left">' +
                        '           <p style="margin-left:10px" align="justify">' + data.description + '</p>' +
                        '       </div>' +
                        '   </div>' +
                        '   <hr/>' +
                        '   <div style="width:100%; float:left; margin-top:10px">' +
                        '       <div style="float:left"><p class="text-muted"><i class="lnr lnr-location"></i> ' + data.city + '</p></div>' +
                        '       <div style="float:right"><p class="text-muted"><i class="lnr lnr-user"></i> '+data.user+'</p></div>'+
                        '   </div>' +
                        '   <div style="width:100%; float:left; margin-top:10px">' +
                        '       <div style="float:left"><p class="text-danger"><i class="lnr lnr-star"></i> Validation Status : '+data.val+' </p></div>' +
                        '       <div style="float:left"><p class="text-danger"> &nbsp;&nbsp; | &nbsp;&nbsp;<span class="lnr lnr-eye"></span> Importance Level : '+data.imptlevel+' </p></div>' +
                        '       <div style="float:right"><p class="text-muted"><i class="lnr lnr-calendar-full"></i> '+data.date+'</p></div>'+
                        '   </div>' +
                        ' </div>'
                        );
                    infoWindow.open(map, marker);
                });
            })(marker, data);
        }
    }
</script>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCsyyCSjCZL6T9cVochyNT44gu-o_OLTB8&callback=myMap"></script>
  </div>
</div>
</asp:Content>
