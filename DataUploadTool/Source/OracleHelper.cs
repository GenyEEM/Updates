using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Oracle.ManagedDataAccess.Client;
using System.Data.OleDb;
using System.Data.Odbc;
using System.Data;
using System.Collections;
using System.Configuration;
using System.Windows.Forms;
namespace GenyDataUploadTool
{

    class OracleHelper
    {
        /// <summary>
        /// IP
        /// </summary>
        private string IPaddress;
        public string ipaddress
        {
            get { return IPaddress; }
            set { IPaddress = value; }
        }
        /// <summary>
        /// 端口
        /// </summary>
        private string Port;
        public string port
        {
            get { return Port; }
            set { Port = value; }
        }
        /// <summary>
        /// 服务名
        /// </summary>
        private string ServerName;
        public string servername
        {
            get { return ServerName; }
            set { ServerName = value; }
        }
        /// <summary>
        /// 用户名
        /// </summary>
        private string UserName;
        public string username
        {
            get { return UserName; }
            set { UserName = value; }
        }
        /// <summary>
        ///密码
        /// </summary>
        private string PassWord;
        public string password
        {
            get { return PassWord; }
            set { PassWord = value; }
        }

        private string ConnStr;
        //public string connStr
        //{
        //    get { return ConnStr; }
        //    set { ConnStr = value; }
        //}
        public OracleHelper()
        {
             GetorSaveINIFile gs = new GetorSaveINIFile();
             ConnStr=  gs.Getiniinfo(Application.StartupPath + @"\inifiles\NetConfig.ini", "ODBC", "ConnectStr");
        }
        #region 执行SQL语句,返回受影响行数


        public void ExecuteNonQuery(string sql, params OracleParameter[] parameters)
        {
            using (OracleConnection conn = new OracleConnection(ConnStr))
            {
                conn.Open();
                using (OracleCommand cmd = conn.CreateCommand())
                {
                    cmd.CommandText = sql;
                    cmd.Parameters.AddRange(parameters);
                    cmd.ExecuteNonQuery();
                }
                conn.Close();
            }
        }
        public void ExecuteNonQuery(string sql )
        {
            if (sql.Length > 0)
            {
                using (OracleConnection conn = new OracleConnection(ConnStr))
                {
                    conn.Open();
                    using (OracleCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandText = sql;
                        cmd.ExecuteNonQuery();                     
                    }
                  //  conn.Close();
                }
            }
 

        }
        #endregion
        #region 执行SQL语句,返回DataTable;只用来执行查询结果比较少的情况
        public DataTable ExecuteDataTable(string sql, params OracleParameter[] parameters)
        {
            using (OracleConnection conn = new OracleConnection(ConnStr))
            {
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                using (OracleCommand cmd = conn.CreateCommand())
                {
                    cmd.CommandText = sql;
                    cmd.Parameters.AddRange(parameters);
                     
                    OracleDataAdapter adapter = new OracleDataAdapter(cmd);
                    DataTable datatable = new DataTable();
                    adapter.Fill(datatable);
                    return datatable;
                }
            }
        }
        public DataTable ExecuteDataTable(string sql )
        {
            try
            {
                using (OracleConnection conn = new OracleConnection(ConnStr))
                {
                    conn.Open();
                    using (OracleCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandText = sql;
                        OracleDataAdapter adapter = new OracleDataAdapter(cmd);
                        DataTable datatable = new DataTable();
                        adapter.Fill(datatable);
                        return datatable;
                    }
                }
            }
            catch (Exception ex)
            {
                throw new  FormatException(ex.Message.ToString());
            }

        }
        #endregion
        public DataSet getDataSetBySql(string sql, params OracleParameter[] parameters)
        {
            try
            {
                DataSet ds = new DataSet();
                using (OracleConnection conn = new OracleConnection(ConnStr))  //创建connection连接对象 
                {
                    conn.Open();
                    using (OracleCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandText = sql;
                        cmd.Parameters.AddRange(parameters);
                        OracleDataAdapter adapter = new OracleDataAdapter(cmd);
                        adapter.Fill(ds);
                        DataTable datatable = new DataTable();
                        adapter.Fill(datatable);
                        return ds;
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        public DataSet getDataSetBySql(string sql )
        {
            try
            {
                DataSet ds = new DataSet();
                using (OracleConnection conn = new OracleConnection(ConnStr))  //创建connection连接对象 
                {
                    conn.Open();
                    using (OracleCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandText = sql;
                        OracleDataAdapter adapter = new OracleDataAdapter(cmd);
                        adapter.Fill(ds);
                        DataTable datatable = new DataTable();
                        adapter.Fill(datatable);
                        return ds;
                    }
                    
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message.ToString());
            }
        }
        static void CloseConn(OracleConnection conn)
        {
            if (conn == null) { return; }
            try
            {
                if (conn.State != ConnectionState.Closed)
                {
                    conn.Close();
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
            finally
            {
                conn.Dispose();
            }
        }
        /// <summary>
        /// 执行多条SQL语句，实现数据库事务。
        /// </summary>
        /// <param name="SQLStringList">多条SQL语句</param>		
        public   void ExecuteSqlTran(ArrayList SQLStringList)
        {
            using (OracleConnection conn = new OracleConnection(ConnStr))
            {
                conn.Open();
                OracleCommand cmd = new OracleCommand();
                cmd.Connection = conn;
                OracleTransaction tx = conn.BeginTransaction();
                cmd.Transaction = tx;
                try
                {
                    for (int n = 0; n < SQLStringList.Count; n++)
                    {
                        string strsql = SQLStringList[n].ToString();
                        if (strsql.Trim().Length > 1)
                        {
                            cmd.CommandText = strsql;
                            cmd.ExecuteNonQuery();
                        }
                    }
                    tx.Commit();
                }
                catch (OracleException E)
                {
                    tx.Rollback();
                    throw new Exception(E.Message);
                }
            }
        }

    }
}
