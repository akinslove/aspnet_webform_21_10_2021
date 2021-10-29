using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace OluWebsite
{
    public class DbHandler : IDisposable
    {
        private const string CONN_STR = "DefaultConnection";

        private SqlConnection conn;

        public DbHandler()
        {
            conn =
                new SqlConnection(
                    ConfigurationManager.ConnectionStrings[CONN_STR].ConnectionString);
        }

        /// <summary>
        /// Execute query against database on your behalf
        /// A number above 0 means a change to the database
        /// 0 value returned means no change
        /// -1 value returned means error
        /// </summary>
        /// <param name="query"></param>
        /// <returns></returns>
        public int ExecuteQuery(string query)
        {
            int result = -1;
            try
            {
                //open the connection
                conn.Open();

                //create sqlcommand
                SqlCommand cmd = new SqlCommand(query, conn);

                //execute the query
                result = cmd.ExecuteNonQuery();
            }
            catch (SqlException)
            {
                throw;
            }

            return result;
        }


        /// <summary>
        /// Returns a Datatable representing the records queried
        /// </summary>
        /// <param name="query"></param>
        /// <returns></returns>
        public DataTable GetData(string query)
        {
            DataTable dt = new DataTable();

            try
            {
                //open the connection
                conn.Open();

                //create adapter
                SqlDataAdapter adapter = new SqlDataAdapter(query, conn);

                //fill the datatable
                adapter.Fill(dt);
            }
            catch (Exception)
            {
                throw;
            }

            return dt;
        }

        public void Dispose()
        {
            if (conn != null)
            {
                conn.Dispose();
            }
        }

        /// <summary>
        /// Closes all connection
        /// </summary>
        public void Close()
        {
            Dispose();
        }
    }
}