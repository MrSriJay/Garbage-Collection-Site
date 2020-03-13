<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Garbage.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--================banner Area =================-->
        <section class="banner_area d-flex text-center">
            <div class="container align-self-center">
                <div class="row">
                    <div class="col-md-12">
                        <div class="banner_content">
                            <h6>Colombo Municipal Council</h6>
                            <h1 class="text-green">Green Task Force</h1>
                            <p>“People will always try to stop you from doing the right thing if it is unconventional.” ~ Warren Buffett<br>Join with us and make the environment a better place.</p>
                            <a href="AddNewPost.aspx" class="btn_hover btn_hover_two">Report Garbage Site</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--================banner Area =================-->

    <!--================Sermons work Area =================-->
        <section class="sermons_work_area section_gap">
            <div class="container">
                <div class="section_title text-center">
                    <h2 class="text-success">Recent Garbage Sites Reported</h2>
                    <p>The most recently spotted and reported garbage locations</p>
                </div>
                <div class="sermons_slider owl-carousel">
                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                        <ItemTemplate>
                        <div class="item row">
                        <div class="col-lg-8">
                            <div class="sermons_image">
                                <asp:Image  ID="Image2" runat="server" ImageUrl='<%# Eval("img") %>' Width="700px"/>
                                <p><%# Eval("postDecription") %></p>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="sermons_content">
                                <h3 class="title_color"><%# Eval("postTitle") %></h3>
                                <ul class="list_style sermons_category">
                                    <li><i class="lnr lnr-user"></i><span>Posted By: </span><a href="#"> <%# Eval("userid") %></a></li>
                                    <li><i class="lnr lnr-database"></i><span>Location: </span> <%#Eval("city")%></li>
                                    <li><i class="lnr lnr-calendar-full"></i><span>Date:</span> <%# Eval("datePosted") %></li>
                                </ul>
                                <a href="Posts.aspx" class="btn_hover">View More Details</a>
                            </div>
                        </div>
                    </div>
                        </ItemTemplate>
                    </asp:Repeater>
                   
                    
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CmsConnection %>" SelectCommand="SELECT TOP 3 * FROM post order by datePosted"></asp:SqlDataSource>
                   
                    
                </div>
            </div>
        </section>
        <!--================Sermons work Area=================-->
</asp:Content>
