<%@ Page Title="Contribute" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Contribute.aspx.cs" Inherits="Contribute" %>

<script runat="server">


    protected void AddAnimalRecord_Click(object sender, EventArgs e)
    {
        string insert, values, columns;
        Boolean startComma = false;
        values = "";
        columns = "";
        if (Genus_Species.Text != "") { values += "'" + Genus_Species.Text + "'"; columns += "genus_species "; startComma = true; }

        if (Common_Name.Text != "" && startComma) { values += ", '" + Common_Name.Text + "'"; columns += ", common_name"; }
        else if (Common_Name.Text != "" && startComma == false) { values += "'" + Common_Name.Text + "'"; columns += "common_name"; startComma = true; }

        if (Subspecies.Text != "" && startComma) { values += ", '" + Subspecies.Text + "'"; columns += ", subspecies"; }
        else if (Subspecies.Text != "" && startComma == false) { values += "'" + Subspecies.Text + "'"; columns += "subspecies"; startComma = true; }

        if (Order.Text != "" && startComma) { values += ", '" + Order.Text + "'"; columns += ", [order]"; }
        else if (Order.Text != "" && startComma == false) { values += "'" + Order.Text + "'"; columns += "[order]"; startComma = true; }

        if (Population.Text != "" && startComma) { values += ", '" + Population.Text + "'"; columns += ", population"; }
        else if (Population.Text != "" && startComma == false) { values += "'" + Population.Text + "'"; columns += "population"; startComma = true; }

        if (Continent.Text != "" && startComma) { values += ", '" + Continent.Text + "' "; columns += ", continent"; }
        else if (Continent.Text != "" && startComma == false) { values += "'" + Continent.Text + "'"; columns += "continent"; startComma = true; }

        if (GPS_Coordinates.Text != "" && startComma) { values += ", '" + GPS_Coordinates.Text + "' "; columns += ", gps_coordinates"; }
        else if (GPS_Coordinates.Text != "" && startComma == false) { values += "'" + GPS_Coordinates.Text + "'"; columns += "gps_coordinates"; startComma = true; }

        if (Reference.Text != "" && startComma) { values += ", '" + Reference.Text + "' "; columns += ", reference"; }
        else if (Reference.Text != "" && startComma == false) { values += "'" + Reference.Text + "'"; columns += "reference"; startComma = true; }

        if (M.Text != "" && startComma) { values += ", '" + M.Text + "' "; columns += ", m"; }
        else if (M.Text != "" && startComma == false) { values += "'" + M.Text + "'"; columns += "m"; startComma = true; }

        if (F.Text != "" && startComma) { values += ", '" + F.Text + "' "; columns += ", f"; }
        else if (F.Text != "" && startComma == false) { values += "'" + F.Text + "'"; columns += "f"; startComma = true; }

        if (Solitary.Text != "" && startComma) { values += ", '" + Solitary.Text + "' "; columns += ", solitary_both"; }
        else if (Solitary.Text != "" && startComma == false) { values += "'" + Solitary.Text + "'"; columns += "solitary_both"; startComma = true; }

        if (MF.Text != "" && startComma) { values += ", '" + MF.Text + "' "; columns += ", mf"; }
        else if (MF.Text != "" && startComma == false) { values += "'" + MF.Text + "'"; columns += "mf"; startComma = true; }

        if (MF_Off.Text != "" && startComma) { values += ", '" + MF_Off.Text + "' "; columns += ", mf_off"; }
        else if (MF_Off.Text != "" && startComma == false) { values += "'" + MF_Off.Text + "'"; columns += "mf_off"; startComma = true; }

        if (MFF.Text != "" && startComma) { values += ", '" + MFF.Text + "' "; columns += ", mff"; }
        else if (MFF.Text != "" && startComma == false) { values += "'" + MFF.Text + "'"; columns += "mff"; startComma = true; }

        if (FMM.Text != "" && startComma) { values += ", '" + FMM.Text + "' "; columns += ", fmm"; }
        else if (FMM.Text != "" && startComma == false) { values += "'" + FMM.Text + "'"; columns += "fmm"; startComma = true; }

        if (FFMM.Text != "" && startComma) { values += ", '" + FFMM.Text + "' "; columns += ", ffmm"; }
        else if (FFMM.Text != "" && startComma == false) { values += "'" + FFMM.Text + "'"; columns += "ffmm"; startComma = true; }

        if (FF.Text != "" && startComma) { values += ", '" + FF.Text + "' "; columns += ", ff"; }
        else if (FF.Text != "" && startComma == false) { values += "'" + FF.Text + "'"; columns += "ff"; startComma = true; }

        if (MM.Text != "" && startComma) { values += ", '" + MM.Text + "' "; columns += ", mm"; }
        else if (MM.Text != "" && startComma == false) { values += "'" + MM.Text + "'"; columns += "mm"; startComma = true; }

        if (Social_State.Text != "" && startComma) { values += ", '" + Social_State.Text + "' "; columns += ", social_state"; }
        else if (Social_State.Text != "" && startComma == false) { values += "'" + Social_State.Text + "'"; columns += "social_state"; startComma = true; }

        if (Num_Studies.Text != "" && startComma) { values += ", '" + Num_Studies.Text + "' "; columns += ", num_studies"; }
        else if (Num_Studies.Text != "" && startComma == false) { values += "'" + Num_Studies.Text + "'"; columns += "num_studies"; startComma = true; }

        if (Season.Text != "" && startComma) { values += ", '" + Season.Text + "' "; columns += ", season"; }
        else if (Season.Text != "" && startComma == false) { values += "'" + Season.Text + "'"; columns += "season"; startComma = true; }

        if (Morphic.Text != "" && startComma) { values += ", '" + Morphic.Text + "' "; columns += ", dimorphic_monomorphic"; }
        else if (Morphic.Text != "" && startComma == false) { values += "'" + Morphic.Text + "'"; columns += "dimorphic_monomorphic"; startComma = true; }

        if (Male_BM.Text != "" && startComma) { values += ", '" + Male_BM.Text + "' "; columns += ", male_bm"; }
        else if (Male_BM.Text != "" && startComma == false) { values += "'" + Male_BM.Text + "'"; columns += "male_bm"; startComma = true; }

        if (Female_BM.Text != "" && startComma) { values += ", '" + Female_BM.Text + "' "; columns += ", female_bm"; }
        else if (Female_BM.Text != "" && startComma == false) { values += "'" + Female_BM.Text + "'"; columns += "female_bm"; startComma = true; }

        if (MF_BM.Text != "" && startComma) { values += ", '" + MF_BM.Text + "' "; columns += ", mf_bm"; }
        else if (MF_BM.Text != "" && startComma == false) { values += "'" + MF_BM.Text + "'"; columns += "mf_bm"; startComma = true; }

        if (Avg_BM.Text != "" && startComma) { values += ", '" + Avg_BM.Text + "' "; columns += ", avg_bm"; }
        else if (Avg_BM.Text != "" && startComma == false) { values += "'" + Avg_BM.Text + "'"; columns += "avg_bm"; startComma = true; }

        if (Pop_Density.Text != "" && startComma) { values += ", '" + Pop_Density.Text + "' "; columns += ", population_density"; }
        else if (Pop_Density.Text != "" && startComma == false) { values += "'" + Pop_Density.Text + "'"; columns += "population_density"; startComma = true; }

        if (Breeding.Text != "" && startComma) { values += ", '" + Breeding.Text + "' "; columns += ", breeding"; }
        else if (Breeding.Text != "" && startComma == false) { values += "'" + Breeding.Text + "'"; columns += "breeding"; startComma = true; }

        if (IUCN_Habitat.Text != "" && startComma) { values += ", '" + IUCN_Habitat.Text + "' "; columns += ", iucn_habitat"; }
        else if (IUCN_Habitat.Text != "" && startComma == false) { values += "'" + IUCN_Habitat.Text + "'"; columns += "iucn_habitat"; startComma = true;  }

        if (Num_Habitats.Text != "" && startComma) { values += ", '" + Num_Habitats.Text + "' "; columns += ", num_habitats"; }
        else if (Num_Habitats.Text != "" && startComma == false) { values += "'" + Num_Habitats.Text + "'"; columns += "num_habitats"; startComma = true; }

        if (Lat_Range.Text != "" && startComma) { values += ", '" + Lat_Range.Text + "' "; columns += ", lat_range"; }
        else if (Lat_Range.Text != "" && startComma == false) { values += "'" + Lat_Range.Text + "'"; columns += "lat_range"; startComma = true; }

        if (Mean_Precip.Text != "" && startComma) { values += ", '" + Mean_Precip.Text + "' "; columns += ", mean_precip"; }
        else if (Mean_Precip.Text != "" && startComma == false) { values += "'" + Mean_Precip.Text + "'"; columns += "mean_precip"; startComma = true; }

        if (Variance_Precip.Text != "" && startComma) { values += ", '" + Variance_Precip.Text + "' "; columns += ", variance_precip"; }
        else if (Variance_Precip.Text != "" && startComma == false) { values += "'" + Variance_Precip.Text + "'"; columns += "variance_precip"; startComma = true; }

        if (Predict_Precip.Text != "" && startComma) { values += ", '" + Predict_Precip.Text + "' "; columns += ", predict_precip"; }
        else if (Predict_Precip.Text != "" && startComma == false) { values += "'" + Predict_Precip.Text + "'"; columns += "predict_precip"; startComma = true; }

        if (Mean_Temp.Text != "" && startComma) { values += ", '" + Mean_Temp.Text + "' "; columns += ", mean_temp"; }
        else if (Mean_Temp.Text != "" && startComma == false) { values += "'" + Mean_Temp.Text + "'"; columns += "mean_temp"; startComma = true; }

        if (Variance_Temp.Text != "" && startComma) { values += ", '" + Variance_Temp.Text + "' "; columns += ", variance_temp"; }
        else if (Variance_Temp.Text != "" && startComma == false) { values += "'" + Variance_Temp.Text + "'"; columns += "variance_temp"; startComma = true; }

        if (Predict_Temp.Text != "" && startComma) { values += ", '" + Predict_Temp.Text + "' "; columns += ", predict_temp"; }
        else if (Predict_Temp.Text != "" && startComma == false) { values += "'" + Predict_Temp.Text + "'"; columns += "predict_temp"; startComma = true; }

        if (Mountain_Range.Text != "" && startComma) { values += ", '" + Mountain_Range.Text + "' "; columns += ", mountain_range"; }
        else if (Mountain_Range.Text != "" && startComma == false) { values += "'" + Mountain_Range.Text + "'"; columns += "mountain_range"; startComma = true; }

        if (Avg_Lifespan.Text != "" && startComma) { values += ", '" + Avg_Lifespan.Text + "' "; columns += ", avg_lifespan"; }
        else if (Avg_Lifespan.Text != "" && startComma == false) { values += "'" + Avg_Lifespan.Text + "'"; columns += "avg_lifespan"; startComma = true; }

        if (Parous.Text != "" && startComma) { values += ", '" + Parous.Text + "' "; columns += ", parous"; }
        else if (Parous.Text != "" && startComma == false) { values += "'" + Parous.Text + "'"; columns += "parous"; startComma = true; }

        if (First_Reproduction.Text != "" && startComma) { values += ", '" + First_Reproduction.Text + "' "; columns += ", first_reproduction_age"; }
        else if (First_Reproduction.Text != "" && startComma == false) { values += "'" + First_Reproduction.Text + "'"; columns += "first_reproduction_age"; startComma = true; }

        if (Offspring_Production.Text != "" && startComma) { values += ", '" + Offspring_Production.Text + "' "; columns += ", offspring_production"; }
        else if (Offspring_Production.Text != "" && startComma == false) { values += "'" + Offspring_Production.Text + "'"; columns += "offspring_production"; }


        insert = "Insert into master(" + columns + ") values(" + values + ")";

        using (System.Data.SqlClient.SqlConnection connection = new System.Data.SqlClient.SqlConnection (ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
        {
            connection.Open();
            System.Data.SqlClient.SqlCommand command;
            System.Data.SqlClient.SqlDataAdapter adapter = new System.Data.SqlClient.SqlDataAdapter();
            String sql = insert;
            command = new System.Data.SqlClient.SqlCommand(sql, connection);
            adapter.InsertCommand = new System.Data.SqlClient.SqlCommand(sql, connection);
            adapter.InsertCommand.ExecuteNonQuery();
            connection.Close();
            command.Dispose();
        }

    }
</script>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server" >
    <style>

* {
  box-sizing: border-box;
}

input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
  outline:none;
}

input[type=text]:focus{
    border: 3px solid #555;
}

label {
  padding: 12px 12px 12px 0;
  display: inline-block;
}

input[type=submit] {
  background-color: #3474eb;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  float: right;
}

input[type=submit]:hover {
  background-color: #4334eb;
}


.title {
  float: left;
  width: 25%;
  margin-top: 6px;
}

.info {
  float: left;
  width: 75%;
  margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .title, .info, input[type=submit] {
    width: 100%;
    margin-top: 0;
  }
}
    </style>
     <h2><%: Title %>.</h2>
        <div >
            <h4>Please fill out the form below to add a new record to the dataset</h4>
        </div> 

<div class="container">
    <div class="row">
        <div class="title">
            <label for="Genus_Species">Genus and Species</label>
        </div>
        <div class="info">
            <asp:TextBox ID="Genus_Species" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="title">
            <label for="Common_Name">Common_Name</label>
        </div>
        <div class="info">
            <asp:TextBox ID="Common_Name" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="title">
            <label for="Order">Order</label>
        </div>
        <div class="info">
            <asp:TextBox ID="Order" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="title">
            <label for="Subspecies">Subspecies</label>
        </div>
        <div class="info">
            <asp:TextBox ID="Subspecies" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="title">
            <label for="Population">Population</label>
        </div>
        <div class="info">
            <asp:TextBox ID="Population" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="title">
            <label for="Continent">Continent</label>
        </div>
        <div class="info">
           <asp:DropDownList ID="Continent" runat="server">
                <asp:ListItem Value="Africa"></asp:ListItem>
                <asp:ListItem Value="Asia"></asp:ListItem>
                <asp:ListItem Value="North America"></asp:ListItem>
                <asp:ListItem Value="South America"></asp:ListItem>
                <asp:ListItem Value="Europe"></asp:ListItem>
                <asp:ListItem Value="Australia"></asp:ListItem>
                <asp:ListItem Value="Oceania"></asp:ListItem>
           </asp:DropDownList>       
        </div>
    </div>
    <div class="row">
        <div class="title">
            <label for="GPS_Coordinates">GPS_Coordinates</label>
        </div>
        <div class="info">
            <asp:TextBox ID="GPS_Coordinates" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="title">
            <label for="Reference">Reference</label>
        </div>
        <div class="info">
            <asp:TextBox ID="Reference" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="title">
            <label for="M">M</label>
        </div>
        <div class="info">
            <asp:TextBox ID="M" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="title">
            <label for="F">F</label>
        </div>
        <div class="info">
            <asp:TextBox ID="F" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="title">
            <label for="Solitary">Solitary</label>
        </div>
        <div class="info">
            <asp:TextBox ID="Solitary" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="title">
            <label for="MF">MF</label>
        </div>
        <div class="info">
            <asp:TextBox ID="MF" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="title">
            <label for="MF_Off">MF_Off</label>
        </div>
        <div class="info">
            <asp:TextBox ID="MF_Off" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="title">
            <label for="MFF">MFF</label>
        </div>
        <div class="info">
            <asp:TextBox ID="MFF" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="title">
            <label for="FMM">FMM</label>
        </div>
        <div class="info">
            <asp:TextBox ID="FMM" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="title">
            <label for="FFMM">FFMM</label>
        </div>
        <div class="info">
            <asp:TextBox ID="FFMM" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="title">
            <label for="FF">FF</label>
        </div>
        <div class="info">
            <asp:TextBox ID="FF" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="title">
            <label for="MM">MM</label>
        </div>
        <div class="info">
            <asp:TextBox ID="MM" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="title">
            <label for="Social_State">Social_State</label>
        </div>
        <div class="info">
            <asp:TextBox ID="Social_State" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="title">
            <label for="Num_Studies">Num_Studies</label>
        </div>
        <div class="info">
            <asp:TextBox ID="Num_Studies" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="title">
            <label for="Season">Season</label>
        </div>
        <div class="info">
            <asp:TextBox ID="Season" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="title">
            <label for="Breeding">Breeding</label>
        </div>
        <div class="info">
            <asp:TextBox ID="Breeding" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="title">
            <label for="Morphic">Morphic</label>
        </div>
        <div class="info">
            <asp:TextBox ID="Morphic" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="title">
            <label for="Male_BM">Male_BM</label>
        </div>
        <div class="info">
            <asp:TextBox ID="Male_BM" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="title">
            <label for="Female_BM">Female_BM</label>
        </div>
        <div class="info">
            <asp:TextBox ID="Female_BM" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="title">
            <label for="MF_BM">MF_BM</label>
        </div>
        <div class="info">
            <asp:TextBox ID="MF_BM" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="title">
            <label for="Avg_BM">Avg_BM</label>
        </div>
        <div class="info">
            <asp:TextBox ID="Avg_BM" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="title">
            <label for="Pop_Density">Pop_Density</label>
        </div>
        <div class="info">
            <asp:TextBox ID="Pop_Density" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="title">
            <label for="IUCN_Habitat">IUCN_Habitat</label>
        </div>
        <div class="info">
            <asp:DropDownList ID="IUCN_Habitat" runat="server">
                <asp:ListItem Value="Forest/Woodland"></asp:ListItem>
                <asp:ListItem Value="Savanna"></asp:ListItem>
                <asp:ListItem Value="Native Grassland"></asp:ListItem>
                <asp:ListItem Value="Wetland"></asp:ListItem>
                <asp:ListItem Value="Inland Rocky Areas"></asp:ListItem>
                <asp:ListItem Value="Desert"></asp:ListItem>
                <asp:ListItem Value="Artificial(Terrestrial)"></asp:ListItem>
           </asp:DropDownList> 
        </div>
    </div>
    <div class="row">
        <div class="title">
            <label for="Num_Habitats">Num_Habitats</label>
        </div>
        <div class="info">
            <asp:TextBox ID="Num_Habitats" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="title">
            <label for="Lat_Range">Lat_Range</label>
        </div>
        <div class="info">
           <asp:DropDownList ID="Lat_Range" runat="server">
                <asp:ListItem Value="Tropical"></asp:ListItem>
                <asp:ListItem Value="Temperate"></asp:ListItem>
                <asp:ListItem Value="Mixed"></asp:ListItem>
           </asp:DropDownList> 
        </div>
    </div>
    <div class="row">
        <div class="title">
            <label for="Mean_Precip">Mean_Precip</label>
        </div>
        <div class="info">
            <asp:TextBox ID="Mean_Precip" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="title">
            <label for="Variance_Precip">Variance_Precip</label>
        </div>
        <div class="info">
            <asp:TextBox ID="Variance_Precip" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="title">
            <label for="Predict_Precip">Predict_Precip</label>
        </div>
        <div class="info">
            <asp:TextBox ID="Predict_Precip" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="title">
            <label for="Mean_Temp">Mean_Temp</label>
        </div>
        <div class="info">
            <asp:TextBox ID="Mean_Temp" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="title">
            <label for="Variance_Temp">Variance_Temp</label>
        </div>
        <div class="info">
            <asp:TextBox ID="Variance_Temp" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="title">
            <label for="Predict_Temp">Predict_Temp</label>
        </div>
        <div class="info">
            <asp:TextBox ID="Predict_Temp" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="title">
            <label for="Mountain_Range">Mountain_Range</label>
        </div>
        <div class="info">
            <asp:TextBox ID="Mountain_Range" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="title">
            <label for="Avg_Lifespan">Avg_Lifespan</label>
        </div>
        <div class="info">
            <asp:TextBox ID="Avg_Lifespan" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="title">
            <label for="Parous">Parous</label>
        </div>
        <div class="info">
           <asp:DropDownList ID="Parous" runat="server">
                <asp:ListItem Value="Semelparous"></asp:ListItem>
                <asp:ListItem Value="Interoparous"></asp:ListItem>
           </asp:DropDownList> 
        </div>
    </div>
    <div class="row">
        <div class="title">
            <label for="First_Reproduction">First_Reproduction</label>
        </div>
        <div class="info">
            <asp:TextBox ID="First_Reproduction" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="title">
            <label for="Offspring_Production">Offspring_Production</label>
        </div>
        <div class="info">
           <asp:DropDownList ID="Offspring_Production" runat="server">
                <asp:ListItem Value="Monotocous"></asp:ListItem>
                <asp:ListItem Value="Polytocous"></asp:ListItem>
           </asp:DropDownList> 
        </div>
    </div>

    <div class="row">
      <asp:Button  ID="Button1" OnClick="AddAnimalRecord_Click" runat="server" Text="Submit" />
    </div>
</div>

</asp:Content>
   
