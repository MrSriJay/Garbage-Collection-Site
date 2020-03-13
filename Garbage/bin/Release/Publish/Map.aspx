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
      <div style="float:right">
          <a class="btn btn_hover_two" href="AddNewPost.aspx">Report Garbage Site</a>
      </div>
  </div>
  <br />
  <div style="margin-top:40px">
      <div id="googleMap" style="width:100%;height:600px;"></div>

        <script>
        function myMap() {
        var mapProp= {
            center:new google.maps.LatLng(51.508742,-0.120850),
            zoom:5,
        };
        var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);
        }
        </script>

        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCsyyCSjCZL6T9cVochyNT44gu-o_OLTB8&callback=myMap"></script>
  </div>
  
</div>
</asp:Content>
