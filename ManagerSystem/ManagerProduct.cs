using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Data;

namespace ManagerSystem
{
    public record Product
    {
        public int ProductID { get; set; }
        public int CategoryID { get; set; }
        public string ProductName { get; set; }
        public string Weight { get; set; }
        public decimal UnitPrice { get; set; }
        public int UnitInStock { get; set; }


    }
    public class ManagerProduct
    {
        SqlConnection connection;
        SqlCommand command;
        string ConnectionString = "server=xu; database=Ass2PRN;Integrated Security=True;TrustServerCertificate=True;";
        //private static List<Product> products = new List<Product> { };

        public List<Product> GetProducts()
        {
            List<Product> products = new List<Product>();
            connection = new SqlConnection(ConnectionString);
            string SQL = "SELECT ProductID, CategoryID, ProductName, Weight, UnitPrice, UnitInStock FROM Product";
            command = new SqlCommand(SQL, connection);
            try
            {
                connection.Open();
                SqlDataReader reader = command.ExecuteReader(CommandBehavior.CloseConnection);
                if (reader.HasRows == true)
                {
                    while (reader.Read())
                    {
                        products.Add(new Product
                        {
                            ProductID = reader.GetInt32("ProductID"),
                            CategoryID = reader.GetInt32("CategoryID"),
                            Weight = reader.GetString("Weight"),
                            ProductName = reader.GetString("ProductName"),
                            UnitPrice = reader.GetDecimal("UnitPrice"),
                            UnitInStock = reader.GetInt32("UnitInStock"),
                        });
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                connection.Close();
            }
            return products;
        }
        public void InsertProduct(Product product)
        {
            connection = new SqlConnection(ConnectionString);
            command = new SqlCommand("Insert Product values(@CategoryID, @ProductName, @Weight, @UnitPrice, @UnitInStock)", connection);
            command.Parameters.AddWithValue("@CategoryID", product.CategoryID);
            command.Parameters.AddWithValue("@ProductName", product.ProductName);
            command.Parameters.AddWithValue("@Weight", product.Weight);
            command.Parameters.AddWithValue("@UnitPrice", product.UnitPrice);
            command.Parameters.AddWithValue("@UnitInStock", product.UnitInStock);
            try
            {
                connection.Open();
                command.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                connection.Close();
            }
        }

        public void UpdateProduct(Product product)
        {
            connection = new SqlConnection(ConnectionString);
            command = new SqlCommand("Update Product set CategoryID =  @CategoryID ,ProductName =  @ProductName ,Weight =  @Weight ,UnitPrice =  @UnitPrice ,UnitInStock =  @UnitInStock where ProductID = @ProductID", connection);
            command.Parameters.AddWithValue("@CategoryID", product.CategoryID);
            command.Parameters.AddWithValue("@ProductName", product.ProductName);
            command.Parameters.AddWithValue("@Weight", product.Weight);
            command.Parameters.AddWithValue("@UnitPrice", product.UnitPrice);
            command.Parameters.AddWithValue("@UnitInStock", product.UnitInStock);
            command.Parameters.AddWithValue("@ProductID", product.ProductID);
            try
            {
                connection.Open();
                command.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                connection.Close();
            }
        }

        public void DeleteProduct(Product product)
        {
            connection = new SqlConnection(ConnectionString);
            command = new SqlCommand("Delete Product where ProductID = @ProductID", connection);
            command.Parameters.AddWithValue("@ProductID", product.ProductID);
            try
            {
                connection.Open();
                command.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                connection.Close();
            }
        }

    }
}

