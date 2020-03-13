<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Garbage.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <!--================Breadcrumb Area =================-->
<section class="breadcrumb_area br_image">
            <div class="container">
                <div class="page-cover text-center">
                    <h2 class="page-cover-tittle">Contact</h2>
                    <ol class="breadcrumb">
                        <li><a href="Home.aspx">Home</a></li>
                        <li class="active">Contact</li>
                    </ol>
                </div>
            </div>
</section>
<!--================Contact Area =================-->
        <section class="contact_area section_gap">
            
            <div class="container">
                <div id="googleMap" class="mapBox" ></div>
                <asp:Label ID="textMess" runat="server" Text="&amp;nbsp;" Font-Size="Large" ForeColor="#009933" Font-Bold="True"></asp:Label>
                <br />  <br />
                <div class="row">
                    <div class="col-md-3">
                        <div class="contact_info">
                            <div class="info_item">
                                <i class="lnr lnr-home"></i>
                                <h6>Colombo, Sri Lanka</h6>
                                <p>Town Hall, Colombo 07.</p>
                            </div>
                            <div class="info_item">
                                <i class="lnr lnr-phone-handset"></i>
                                <h6><a href="#">(011) 2684290 </a></h6>
                                <p>Mon to Fri 9am to 6 pm</p>
                            </div>
                            <div class="info_item">
                                <i class="lnr lnr-envelope"></i>
                                <h6><a href="#">gforcemunici@gmail.com</a></h6>
                                <p>Send us your query anytime!</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-9">
                        
                            <div class="col-md-6" style="float:right">
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="message" rows="6" runat="server" placeholder="Enter Message" TextMode="MultiLine" ControlToValidate="message"></asp:TextBox>
                                    
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Message is Required " ValidationGroup="contactval" ControlToValidate="message" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="subject" runat="server" placeholder="Enter Subject"></asp:TextBox>
                                    
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Subject is Required " ValidationGroup="contactval" ControlToValidate="subject" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="name" runat="server" placeholder="Enter your name"></asp:TextBox>
                                     
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Name is Required " ValidationGroup="contactval" ControlToValidate="name" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="email" runat="server" placeholder="Enter email address"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="E-mail is Required " ValidationGroup="contactval" ControlToValidate="email" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Email" ValidationGroup="contactval"  ForeColor="#CC0000" ControlToValidate="email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                   
                                </div>
                                
                            </div>
                            
                            <div class="col-md-12 text-right">
                                <asp:Button ID="submit" class="btn btn_hover btn_hover_two" runat="server" Text="Send Message " ValidationGroup="contactval" OnClick="submit_Click"/>
                            </div>
                       
                    </div>
                </div>
            </div>
        </section>
        <!--================Contact Area =================-->
 <!--gmaps Js-->

<script>
    function myMap() {
        var myCenter = new google.maps.LatLng(6.915804, 79.863728);
        var mapProp= {
          center:new google.maps.LatLng(6.915804,79.863728),
          zoom:15,
        };

        var marker = new google.maps.Marker({position: myCenter});
        var map = new google.maps.Map(document.getElementById("googleMap"), mapProp);
        marker.setMap(map); 
        var infowindow = new google.maps.InfoWindow({
          content:"<h3>Colombo Municipal Council<h3>"
        });

        google.maps.event.addListener(marker, 'click', function() {
          infowindow.open(map,marker);
        }); 
    }
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCsyyCSjCZL6T9cVochyNT44gu-o_OLTB8&callback=myMap"></script> 
</asp:Content>
