<%@ Page Title="Public Database" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="DatabasePublic.aspx.cs" CodeBehind="~/DatabasePublic.aspx.cs" Inherits="DatabasePublic" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        input[type=submit] {
          background-color: #3474eb !important;
          color: white !important;
          padding: 12px 20px;
          border: none;
          border-radius: 4px;
          cursor: pointer;
        }

        input[type=submit]:hover {
          background-color: #4334eb !important;
        }
    </style>

    <link href="Content/themes/metroblue/jquery-ui.css" rel="stylesheet" type="text/css" />
    <!-- Include one of jTable styles. -->
    <link href="Scripts/jtable/themes/metro/blue/jtable.css" rel="stylesheet" type="text/css" />

    <script src="Scripts/jquery-1.9.0.js" type="text/javascript"></script>
    <!-- Include jquery-ui script file. -->
    <script src="Scripts/jquery-ui-1.9.2.min.js" type="text/javascript"></script>

    <!-- A helper library for JSON serialization -->
    <script src="Scripts/jtable/external/json2.js"></script>
 
    <!-- Core jTable script file -->
    <script src="Scripts/jtable/jquery.jtable.js"></script>

    <!-- ASP.NET Web Forms extension for jTable -->
    <script src="Scripts/jtable/extensions/jquery.jtable.aspnetpagemethods.js"></script>

    <!-- This script runs the Excel Export method utlizing the CLosedXML Library -->
    <script runat="server">
        protected void ExcelExport_Click(object sender, EventArgs e)
        {
            using (System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
            {
                using (System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("SELECT * FROM [master]"))
                {
                    using (System.Data.SqlClient.SqlDataAdapter sda = new System.Data.SqlClient.SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (System.Data.DataTable dt = new System.Data.DataTable())
                        {
                            sda.Fill(dt);
                            using (ClosedXML.Excel.XLWorkbook wb = new ClosedXML.Excel.XLWorkbook())
                            {
                                wb.Worksheets.Add(dt, "Social Evolution");
 
                                Response.Clear();
                                Response.Buffer = true;
                                Response.Charset = "";
                                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                                String date = "" + DateTime.Now;
                                Response.AddHeader("content-disposition", "attachment;filename=SocialEvolutionData" + date + ".xlsx");
                                using (System.IO.MemoryStream MyMemoryStream = new System.IO.MemoryStream())
                                {
                                    wb.SaveAs(MyMemoryStream);
                                    MyMemoryStream.WriteTo(Response.OutputStream);
                                    Response.Flush();
                                    Response.End();
                                }
                            }
                        }
                    }
                }
            }
        }
    </script>

    <h2 class="text-center">Database</h2>

    <br />
    <!-- The button for Excel Exportation -->
    <div style="align-content: center; text-align: center">
        <asp:Button  ID="export" OnClick="ExcelExport_Click" runat="server" Text="Export to Excel" CssClass="btn-default" Style="width: 100%" />
    </div>
    <br />

    <!-- Our first JTable for Species and Population columns! Its HTML only involves one div, since most of it's functionality lies in the below Javascript -->
    <div id="SpeciesAndPopulationTable"></div>
    <script type="text/javascript">
 
        $(document).ready(function () {
 
            //Prepare jtable plugin
            $('#SpeciesAndPopulationTable').jtable({
                title: 'Species and Population',
                paging: true, //Enable paging
                pageSize: 10, //Set page size (default: 10)
                sorting: true, //Enable sorting
                defaultSorting: 'ID ASC', //Set default sorting
                actions: {
                    //These link to C# methods on the backend that pass back json objects to update the tables with ajax
                    listAction: 'DatabasePublic.aspx/AnimalList',
                    createAction: 'DatabasePublic.aspx/CreateAnimal',
                    updateAction: 'DatabasePublic.aspx/EditAnimal',
                    deleteAction: 'DatabasePublic.aspx/DeleteAnimal'
                },
                //Our defined columns in the table. Note that editing these values will require you to also edit the defined data class for the table
                //Small changes like visual title and width don't require you to do that though
                fields: {
                    ID: {
                        key: true,
                        title: 'ID',
                        width: '5%'
                    },
                    Genus_Species: {
                        title: 'Genus_Species',
                        width: '15%'
                    },
                    Order: {
                        title: 'Order',
                        width: '10%'
                    },
                    Common_Name: {
                        title: 'Common_Name',
                        width: '12%'
                    },
                    Subspecies: {
                        title: 'Subspecies',
                        width: '10%'
                    },
                    Population: {
                        title: 'Population',
                        width: '18%',
                    },
                    Continent: {
                        title: 'Continent',
                        width: '10%'
                    },
                    GPS_Coordinates: {
                        title: 'GPS_Coords',
                        width: '10%'
                    },
                    Reference: {
                        title: 'Reference',
                        width: '10%'
                    }
                }
            });
 
            //Load animal list from server
            $('#SpeciesAndPopulationTable').jtable('load');
        });
    </script>

    <!-- The next 4 tables are more or less the same but utilize different data classes and methods -->

    <br /><br /><br />

    <div id="SocialOrganizationTable"></div>
    <script type="text/javascript">
 
        $(document).ready(function () {
 
            //Prepare jtable plugin
            $('#SocialOrganizationTable').jtable({
                title: 'Social Organization',
                paging: true, //Enable paging
                pageSize: 10, //Set page size (default: 10)
                sorting: true, //Enable sorting
                defaultSorting: 'ID ASC', //Set default sorting
                actions: {
                    listAction: 'DatabasePublic.aspx/AnimalSocialList',
                    updateAction: 'DatabasePublic.aspx/EditAnimalSocial',
                    deleteAction: 'DatabasePublic.aspx/DeleteAnimalSocial'
                },
                fields: {
                    ID: {
                        key: true,
                        title: 'ID',
                        width: '5%'
                    },
                    M: {
                        title: 'M',
                        width: '5%'
                    },
                    F: {
                        title: 'F',
                        width: '5%'
                    },
                    Solitary: {
                        title: 'Solitary',
                        width: '8%'
                    },
                    MF: {
                        title: 'MF',
                        width: '5%'
                    },
                    MF_Off: {
                        title: 'MF_Off',
                        width: '8%'
                    },
                    MFF: {
                        title: 'MFF',
                        width: '5%'
                    },
                    FMM: {
                        title: 'FMM',
                        width: '6%'
                    },
                    FFMM: {
                        title: 'FFMM',
                        width: '7%'
                    },
                    FF: {
                        title: 'FF',
                        width: '5%'
                    },
                    MM: {
                        title: 'MM',
                        width: '5%'
                    },
                    Social_State: {
                        title: 'Social_State',
                        width: '10%'
                    },
                    Num_Studies: {
                        title: 'Num_Studies',
                        width: '10%'
                    },
                    Season: {
                        title: 'Season',
                        width: '8%'
                    },
                    Breeding: {
                        title: 'Breeding',
                        width: '8%'
                    }
                }
            });
 
            //Load animal list from server
            $('#SocialOrganizationTable').jtable('load');
        });
    </script>

    <br /><br /><br />

    <div id="DemographicsTable"></div>
    <script type="text/javascript">
 
        $(document).ready(function () {
 
            //Prepare jtable plugin
            $('#DemographicsTable').jtable({
                title: 'Demographics',
                paging: true, //Enable paging
                pageSize: 10, //Set page size (default: 10)
                sorting: true, //Enable sorting
                defaultSorting: 'ID ASC', //Set default sorting
                actions: {
                    listAction: 'DatabasePublic.aspx/AnimalListDemographics',
                    updateAction: 'DatabasePublic.aspx/EditAnimalDemographics',
                    deleteAction: 'DatabasePublic.aspx/DeleteAnimalDemographics'
                },
                fields: {
                    ID: {
                        key: true,
                        title: 'ID',
                        width: '5%'
                    },
                    Morphic: {
                        title: 'Morphic',
                        width: '20%'
                    },
                    Male_BM: {
                        title: 'Male_BM',
                        width: '15%'
                    },
                    Female_BM: {
                        title: 'Female_BM',
                        width: '15%'
                    },
                    MF_BM: {
                        title: 'M:F_BM',
                        width: '10%'
                    },
                    Avg_BM: {
                        title: 'Avg_BM',
                        width: '15%'
                    },
                    Pop_Density: {
                        title: 'Pop_density',
                        width: '20%'
                    }
                }
            });
 
            //Load animal list from server
            $('#DemographicsTable').jtable('load');
        });
    </script>

    <br /><br /><br />

    <div id="EnvironmentTable"></div>
    <script type="text/javascript">
 
        $(document).ready(function () {
 
            //Prepare jtable plugin
            $('#EnvironmentTable').jtable({
                title: 'Environment',
                paging: true, //Enable paging
                pageSize: 10, //Set page size (default: 10)
                sorting: true, //Enable sorting
                defaultSorting: 'ID ASC', //Set default sorting
                actions: {
                    listAction: 'DatabasePublic.aspx/AnimalListEnvironment',
                    updateAction: 'DatabasePublic.aspx/EditAnimalEnvironment',
                    deleteAction: 'DatabasePublic.aspx/DeleteAnimalEnvironment'
                },
                fields: {
                    ID: {
                        key: true,
                        title: 'ID',
                        width: '5%'
                    },
                    IUCN_Habitat: {
                        title: 'IUCN',
                        width: '8%'
                    },
                    Num_Habitats: {
                        title: 'Num_Habitats',
                        width: '10%'
                    },
                    Lat_Range: {
                        title: 'Lat_Range',
                        width: '9%'
                    },
                    Mean_Precip: {
                        title: 'Mean_Precip',
                        width: '10%'
                    },
                    Variance_Precip: {
                        title: 'Vari_Precip',
                        width: '10%'
                    },
                    Predict_Precip: {
                        title: 'Predict_Precip',
                        width: '11%'
                    },
                    Mean_Temp: {
                        title: 'Mean_Temp',
                        width: '10%'
                    },
                    Variance_Temp: {
                        title: 'Vari_Temp',
                        width: '8%'
                    },
                    Predict_Temp: {
                        title: 'Predict_Temp',
                        width: '11%'
                    },
                    Mountain_Range: {
                        title: 'Mountains',
                        width: '10%'
                    }
                }
            });
 
            //Load animal list from server
            $('#EnvironmentTable').jtable('load');
        });
    </script>

    <br /><br /><br />

     <div id="LifeTable"></div>
    <script type="text/javascript">
 
        $(document).ready(function () {
 
            //Prepare jtable plugin
            $('#LifeTable').jtable({
                title: 'Life History',
                paging: true, //Enable paging
                pageSize: 10, //Set page size (default: 10)
                sorting: true, //Enable sorting
                defaultSorting: 'ID ASC', //Set default sorting
                actions: {
                    listAction: 'DatabasePublic.aspx/AnimalListLife',
                    updateAction: 'DatabasePublic.aspx/EditAnimalLife',
                    deleteAction: 'DatabasePublic.aspx/DeleteAnimalLife'
                },
                fields: {
                    ID: {
                        key: true,
                        title: 'ID',
                        width: '5%'
                    },
                    Avg_Lifespan: {
                        title: 'Avg_Lifespan',
                        width: '20%'
                    },
                    Parous: {
                        title: 'Parous',
                        width: '25%'
                    },
                    First_Reproduction: {
                        title: 'First_Reproduction',
                        width: '25%'
                    },
                    Offspring_Production: {
                        title: 'Offspring_Production',
                        width: '25%'
                    }
                }
            });
 
            //Load animal list from server
            $('#LifeTable').jtable('load');
        });
    </script>

    <br /><br /><br />

</asp:Content>