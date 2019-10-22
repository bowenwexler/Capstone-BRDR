﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataClasses;
using DataMethods;
using static DataClasses.DataClasses;
using static DataMethods.DataMethods;

public partial class DatabasePublic : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod(EnableSession = true)]
    public static object AnimalList()
    {
        try
        {
            string select = "SELECT * FROM Animal";
            List<Animal> animals = new List<Animal>();
            animals = ExcuteObject<Animal>(select).ToList();
            return new { Result = "OK", Records = animals };
        }
        catch (Exception ex)
        {
            return new { Result = "ERROR", Message = ex.Message };
        }
    }

    [WebMethod(EnableSession = true)]
    public static object CreateAnimal(Animal record)
    {
        try
        {
            string insert, values, columns;
            Boolean startComma = false;
            values = "";
            columns = "";
            if (record.Genus_Species != "") { values += "'" + record.Genus_Species + "'"; columns += "genus_species "; startComma = true; }

            if (record.Common_Name != "" && startComma) { values += ", '" + record.Common_Name + "'"; columns += ", common_name"; }
            else if (record.Common_Name != "" && startComma == false) { values += "'" + record.Common_Name + "'"; columns += "common_name"; }

            if (record.Subspecies != "" && startComma) { values += ", '" + record.Subspecies + "'"; columns += ", subspecies"; }
            else if (record.Subspecies != "" && startComma == false) { values += "'" + record.Subspecies + "'"; columns += "subspecies"; }

            if (record.Population != "" && startComma) { values += ", " + record.Population; columns += ", population"; }
            else if (record.Population != "" && startComma == false) { values += record.Population; columns += "common_name"; }

            if (record.Continent != "" && startComma) { values += ", '" + record.Continent + "' "; columns += ", continent"; }
            else if (record.Continent != "" && startComma == false) { values += "'" + record.Continent + "'"; columns += "continent"; }

            insert = "Insert into Animal(" + columns + ") values(" + values + ")";
            InsertEdit(insert);
            DataTable animalTable = new DataTable();

            animalTable.Columns.Add("Id");
            animalTable.Columns.Add("genus_species");
            animalTable.Columns.Add("common_name");
            animalTable.Columns.Add("subspecies");
            animalTable.Columns.Add("population");
            animalTable.Columns.Add("continent");

            DataRow animalRow = animalTable.NewRow();

            animalRow["Id"] = record.Animal_Id;
            animalRow["genus_species"] = record.Genus_Species;
            animalRow["common_name"] = record.Common_Name;
            animalRow["subspecies"] = record.Subspecies;
            animalRow["population"] = record.Population;
            animalRow["continent"] = record.Continent;

            Animal addedAnimal = new Animal(animalRow);
            return new { Result = "OK", Record = addedAnimal };
        }
        catch (Exception ex)
        {
            return new { Result = "ERROR", Message = ex.Message };
        }
    }

    [WebMethod(EnableSession = true)]
    public static object EditAnimal(Animal record)
    {
        try
        {
            string values = "";
            if (record.Genus_Species != "") { values += "genus_species = '" + record.Genus_Species + "', "; }
            else { values += "genus_species = NULL, "; }
            if (record.Common_Name != "") { values += "common_name = '" + record.Common_Name + "', "; }
            else { values += "common_name = NULL, "; }
            if (record.Subspecies != "") { values += "subspecies = '" + record.Subspecies + "', "; }
            else { values += "subspecies = NULL, "; }
            if (record.Population != "") { values += " population = " + record.Population + ", "; }
            else { values += " population = NULL, "; }
            if (record.Continent != "") { values += "continent = '" + record.Continent + "' "; }
            else { values += "continent = NULL "; }
            string edit;
            edit = "Update Animal Set " + values + " WHERE Id = " + record.Animal_Id;
            InsertEdit(edit);

            return new { Result = "OK" };
        }
        catch (Exception ex)
        {
            return new { Result = "ERROR", Message = ex.Message };
        }
    }

    public static IEnumerable<T> ExcuteObject<T>(string commandText)
    {
        List<T> items = new List<T>();
        var dataTable = Select(commandText); //this will use the DataTable Select function
        foreach (var row in dataTable.Rows)
        {
            T item = (T)Activator.CreateInstance(typeof(T), row);
            items.Add(item);
        }
        return items;
    }

    public static DataTable Select(string commandText)
    {
        DataTable dataTable = new DataTable();
        using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
        {
            using (SqlCommand command = new SqlCommand())
            {
                command.Connection = connection;
                command.CommandType = CommandType.Text;
                command.CommandText = commandText;
                connection.Open();
                SqlDataAdapter dataAdapter = new SqlDataAdapter(command);
                dataAdapter.Fill(dataTable);
                connection.Close();
                command.Dispose();
                return dataTable;
            }
        }
    }

    public static void InsertEdit(string commandText)
    {
        DataTable dataTable = new DataTable();
        using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
        {
            connection.Open();
            SqlCommand command;
            SqlDataAdapter adapter = new SqlDataAdapter();
            String sql = commandText;
            command = new SqlCommand(sql, connection);
            adapter.InsertCommand = new SqlCommand(sql, connection);
            adapter.InsertCommand.ExecuteNonQuery();
            connection.Close();
            command.Dispose();
        }
    }
}