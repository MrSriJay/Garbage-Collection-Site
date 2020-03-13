<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="AddNewPost.aspx.cs" Inherits="Garbage.AddNewPost" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <section class="breadcrumb_area br_image">
            <div class="container">
                <div class="page-cover text-center">
                    <h2 class="page-cover-tittle">Report a garbage site</h2>
                    <ol class="breadcrumb">
                        <li><a href="Home.aspx">Home</a></li>
                        <li class="active">Report a garbage site</li>
                    </ol>
                </div>
            </div>
  </section>
  <div class="jumbotron jumbotron-fluid" style="background-color:white">
  <div class="container">
      <p class="lead">
          <asp:Label ID="Label1" runat="server" Font-Size="X-Large" ForeColor="#009933" Text="&amp;nbsp;"></asp:Label>
      </p>
    <table class="table table-striped lead">
        <tbody>
        <tr class="table-light">
            <td style="font-weight:bold" >Title</td>
            <td style="height: 30px; width: 600px;">
                <asp:TextBox ID="title" runat="server" Width="600px"></asp:TextBox>
            </td>
            <td>
                      
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="title" ErrorMessage="Title must be entered" Font-Size="Small" ForeColor="Red" ValidationGroup="Group1"></asp:RequiredFieldValidator>
                      
            </td>
        </tr>
        <tr class="table-light">
            <td style="font-weight:bold" >Description</td>
            <td style="height: 30px; width: 600px;">
          
                <asp:TextBox ID="decription"  TextMode="MultiLine" style="width: 600px; height: 300px" runat="server" Height="51px" Width="594px"></asp:TextBox>
               
            <td>
                      
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="decription" ErrorMessage="Description must be entered" Font-Size="Small" ForeColor="Red" ValidationGroup="Group1"></asp:RequiredFieldValidator>
                      
            </td>
        </tr>
        <tr class="table-light">
            <td style="font-weight:bold; height: 30px;" >Area</td>
            <td style="height: 30px; width: 600px;">
                
                <asp:DropDownList ID="DistrictDownList" runat="server" style="width: 600px; height: 30px" CssClass="dropdown-toggle">
                    <asp:ListItem Value="Select Distict">Select Area </asp:ListItem>
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
                
            </td>
            <td style="height: 30px">
                      
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DistrictDownList" ErrorMessage="District must be entered" Font-Size="Small" ForeColor="Red" InitialValue="Select Distict" ValidationGroup="Group1"></asp:RequiredFieldValidator>
                      
            </td>
        </tr>
        <tr class="table-light">
            <td style="font-weight:bold" >Location</td>
            <td style="height: 30px; width: 600px;">
               <asp:HiddenField ID="latitude" runat="server" Value="0" />
               <asp:HiddenField ID="longitude" runat="server"  Value="0"/>
                <div id="googleMap" style="width: 600px; height: 500px;">
           
                </div>
                <table width="100%" heigth="15px">
                    <tr>
                        <td width="50%" align="center" style="font-size:12px">Latitude: <asp:Label ID="curLat" runat="server">0</asp:Label></td>
                        <td width="50%" align="center" style="font-size:12px">Longitude: <asp:Label ID="curLong" runat="server" >0</asp:Label></td>
                    </tr>
                   
                </table>
            </td>
            <td>     
                      <asp:Label ID="locError" runat="server" ForeColor="Red" Text="&amp;nbsp;"></asp:Label>   
            </td>
        </tr>
        <tr class="table-light">
            <td style="font-weight:bold; height: 30px;">Upload Image</td>
            <td style="height: 30px; width: 600px;">
                <asp:FileUpload ID="imgUpload"  style="width: 600px; height: 30px;" runat="server" AllowMultiple="False" />
                
            </td>
            <td style="height: 30px">
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="imgUpload" ErrorMessage="Image must be added" Font-Size="Small" ForeColor="Red" InitialValue="Select Distict" ValidationGroup="Group1"></asp:RequiredFieldValidator>
                      <asp:Label ID="imgError" runat="server" ForeColor="Red" Text="&amp;nbsp;" Font-Size="X-Small"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="font-weight:bold"></td>
            <td style="height: 30px; width: 600px;">        
                <asp:Button ID="Button1" CssClass="btn btn_hover" runat="server" Text="Post" Width="600px" OnClick="Button1_Click" ValidationGroup="Group1" OnPreRender="Button1_PreRender" />      
            </td>
            <td>
                     
            </td>
        </tr>
        </tbody>
    </table>
  </div>
</div>

<!-- js selecting the location -->
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false&libraries=places"></script>  
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCsyyCSjCZL6T9cVochyNT44gu-o_OLTB8&callback=myMap"></script>  
<script type="text/javascript">  

        // Geting the Current Location
        if (navigator.geolocation) {  
            navigator.geolocation.getCurrentPosition(success);  
        } else {  
        alert("There is Some Problem on your current browser to get Geo Location!");  
        }  
  
        function success(position) {  
            var lat = position.coords.latitude;  
            var long = position.coords.longitude;  
            var city = position.coords.locality;  
  
            var LatLng = new google.maps.LatLng(lat, long);  
            var mapOptions = {  
                center: LatLng,  
                zoom: 12,  
                mapTypeId: google.maps.MapTypeId.ROADMAP  
            };  
  
            var map = new google.maps.Map(document.getElementById("googleMap"), mapOptions);  
            var marker = new google.maps.Marker({
                position: LatLng,
                draggable: true,
                icon:'img/truckicon.png',
                title: "Garbage Site Here"
                
                
            }); 
            marker.addListener('dragend', function () {
                document.getElementById("<%=curLat.ClientID%>").innerHTML = marker.getPosition().lat();
                document.getElementById("<%=curLong.ClientID%>").innerHTML = marker.getPosition().lng();

                document.getElementById("<%=latitude.ClientID%>").value = marker.getPosition().lat();
                document.getElementById("<%=longitude.ClientID%>").value  = marker.getPosition().lng();
               
            });
            marker.setMap(map);  

           

    }  


</script>  


</asp:Content>
