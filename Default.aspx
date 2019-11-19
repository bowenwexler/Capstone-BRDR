<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
<style>
    body{
        background-color: white;
    }
 
        .jumbotron{
            background-color:white !important;
        }
        .column {
            float: left;
            width: 33.3%;
            margin-bottom: 16px;
            padding: 0 20px;
        }
        .column2 {
            float: left;
            width: 33.3%;
            margin-bottom: 16px;
            padding: 0 20px;
        }
        .column3 {
            float: left;
            width: 33.3%;
            margin-bottom: 16px;
            padding: 0 20px;
        }
        .carousel-caption{
            text-align:left
            
        }
        .item h3{
            font-size:2em;  
        }        
        .item iframe {
            width:100%;
        }
        /* Display the columns below each other instead of side by side on small screens */
        @media screen and (max-width: 650px) {
            .column {
                width: 100%;
                display: block;
            }
        }
        /* Add some shadows to create a card effect */
        .card {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            word-wrap:normal;
            overflow:auto;
            margin-top: 50px;
        }
        /* Clear floats */
        .container::after, .row::after {
            content: "";
            clear: both;
            display: table;
            
        }
        /*adds a little grey for a title*/
        .title {
            /*color: grey;*/
            font:bold;
        }
        /*this formatting messed with the menu bar at the top. still needs work*/
        .container button 
        {
            /*display:inline-block;*/
            color: white;
            background-color: #000;
            cursor: pointer;
            width: 150px;
        }
</style>

<script src="Scripts/jquery-3.4.1.js" type="text/javascript"></script>
<script src="Scripts/bootstrap.js" type="text/javascript"></script>
<script src="Scripts/respond.js" type="text/javascript"></script>
<script src="/bundles/WebFormsJs?v=AAyiAYwMfvmwjNSBfIMrBAqfU5exDukMVhrRuZ-PDU01" type="text/javascript"></script>

    <div class="jumbotron" style="overflow:auto;text-align:center;padding-top:0% !important">
        <img src="Content/Images/Logo.png" style="width: 20%">
        <hr style="visibility:visible"/>
        <br />
        <p class="text-right" style="text-align: justify; font-size: medium;">Welcome to Mammalian Social Evolution. Our aim is to create a high quality database on mammalian social organization, taking IVSO into account for the first time.. Our database consists of various measures that affect the social organization of mammals. Mammalian Social Evolution is developed by an enthusiastic team of biologists and CS students. It is a freely available database to the biological community and our aim is to gather as much accurate information on social organization as possible. This information will promote a better understanding of mammalian social evolution.</p>
        <div style="width: 100%; text-align: center;" >
            <div class ="card">
                <a href="About.aspx">
                    <h2>About</h2>
                </a>
                <img src="Content/Images/DSC00170 (1).jpg" alt="Jane" style="width:50%" >
                <div class="container"; style="text-align:left">  
                    <p style="font-size:medium; padding-top:2%">We are a dedicated team of biologists whose area of study mainly includes intra- and inter-specific variation in mammals. Our goal is to collect the most accurate data as possible about different factors that affect mammalian social organization. The lead contributors to this team include Prof. Loren Hayes (University of Tennessee at Chattanooga) and Prof. Carsten Schradin (Director of Research at the Center National de la Recherche scientifique CNRS). Find out more about our team and study here.</p>
                </div>
            </div>
            <div class ="card" >
                <a href="Contact.aspx">
                    <h2>Contribute</h2>
                </a>
                <img src="Content/Images/Picture 077 (1).jpg" alt="Jane" style="width:50%" >
                <div class="container"; style="text-align:left;">  
                    <p style="font-size:medium; padding-top:2%">Here you can see the process that you must undergo to contribute to the database.Contribute valuable data to our database to help us in our quest to better understand social behaviour of mammals and how their evolution is affected by climate change. Sign up here and one of team members will reach out to you very soon. Or login here.</p>
                </div>
            </div>
            <div class ="card">
                <a href="DatabasePublic.aspx">
                <h2>Database</h2>
                </a>
                <img src="Content/Images/Database.jpg" alt="Jane" style="width:90%" >
                <div class="container"; style="text-align:left">  
                    <p style="font-size:medium; padding-top:2%">Our database includes information on the population-specific social organization of mammals as well as life history, demographic, and environmental predictors of inter- and intra-specific variation. Our database aims to give coherent and up to date information to those searching for causality in mammalian social evolution.</p>
                </div>
            </div>
        </div>
    </div>         
</asp:Content>