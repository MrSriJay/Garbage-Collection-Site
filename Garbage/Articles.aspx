<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Articles.aspx.cs" Inherits="Garbage.Articles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--================Breadcrumb Area =================-->
<section class="breadcrumb_area br_image">
            <div class="container">
                <div class="page-cover text-center">
                    <h2 class="page-cover-tittle">Articles</h2>
                    <ol class="breadcrumb">
                        <li><a href="Home.aspx">Home</a></li>
                        <li class="active">Articles</li>
                    </ol>
                </div>
            </div>
</section>


  <!-- Display Articles -->
<div class="jumbotron jumbotron-fluid" style="background-color:white">
  <div class="container">
      <div style="float:right">
          <a class="btn btn_hover_two" href="AddNewPost.aspx">Report Garbage Site</a>
      </div>
  </div>
  <br /><br />
  <div class="container">
      <asp:Repeater ID="Repeater1" runat="server" DataSourceID="XmlDataSource1">
          <ItemTemplate>
              <div class="section-top-border">
                  <hr />
						<h3 class="mb-30 title_color"><%#Eval("ArticleTitle")%></h3>
						<div class="row">
							<div class="col-lg-12">
								<blockquote class="generic-blockquote" >
									<%#Eval("ArticleDesc")%>
								</blockquote>
							</div>
						</div>
				</div>
          </ItemTemplate>
      </asp:Repeater>
      <!-- XML Data Source -->
      <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/App_Data/Articles.xml" TransformFile="~/App_Data/ArticlesConvert.xslt"></asp:XmlDataSource>
  </div>
</div>

<br /><br />
</asp:Content>
