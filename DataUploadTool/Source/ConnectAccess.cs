using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.OleDb;
using System.Data;
using System.Windows.Forms;
using System.Data.Odbc;


namespace GenyDataUploadTool
{
    class ConnectAccess
    {
        protected static OleDbConnection conn = new OleDbConnection();
        protected static OleDbCommand comm = new OleDbCommand();
        protected static OdbcConnection connection = new OdbcConnection();
        protected static OdbcCommand Ocomm = new OdbcCommand();
        public static string Startpath = "";
        public static Boolean isbrain = false;
        public static string DBPath;
        public static string DSN="";
        public static string UID="";
        public static string PassWord="";
        GetorSaveINIFile getiniinfo = new GetorSaveINIFile();
        /// <summary> 
        /// 根据SQL语句查询数据 
        /// </summary> 
        /// <param name="sql">SQL查询语句</param> 
        /// <returns>结果集</returns> 
        public static DataSet getDataSetBySql(String sql)
        {

            try
            {
                DataSet ds = new DataSet();
                OdbcCommand command = new OdbcCommand(sql);  //command  对象 
                String connstring = "dsn=" + DSN + ";uid=" + UID + ";pwd=" + PassWord;  //ODBC连接字符串 
                using (connection = new OdbcConnection(connstring))  //创建connection连接对象 
                {
                    command.Connection = connection;
                    connection.Open();  //打开链接 
                    OdbcDataAdapter adapter = new OdbcDataAdapter(command);  //实例化dataadapter 
                    adapter.Fill(ds);  //填充查询结果 
                    return ds;
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public static void OpenOracle()
        {
            if (conn.State == ConnectionState.Closed)
            {
                String connstring = "dsn=" + DSN + ";uid=" + UID + ";pwd=" + PassWord;  //ODBC连接字符串 
                using (connection = new OdbcConnection(connstring))  //创建connection连接对象 
                {
                    try
                    {
                        connection.Open();  //打开链接 
                        MessageBox.Show("连接成功");
                    }
                    catch (Exception e)
                    {
                        throw new Exception(e.Message);
                    }
                }
            }
        }
        public static void OpenSybase()
        {
            if (conn.State == ConnectionState.Closed)
            {
                String connstring = "Driver={SYBASE ASE ODBC Driver};dsn=" + DSN + ";uid=" + UID + ";pwd=" + PassWord;  //ODBC连接字符串 
                using (connection = new OdbcConnection(connstring))  //创建connection连接对象 
                {
                    try
                    {
                        connection.Open();  //打开链接 
                        MessageBox.Show("Sybase连接成功");
                    }
                    catch (Exception e)
                    {
                        throw new Exception(e.Message);
                    }
                }
            }
        }
        /// <summary>
        /// 打开操作dbf数据库
        /// </summary>
        /// <param name="sqlstr">sql语句</param>
        /// <returns></returns>
        public static DataTable dbfOpenConn(string sqlstr)
        {
            DataTable dt = new DataTable();
            if (conn.State == ConnectionState.Closed)
            {
                String connstring = @"Driver={Microsoft Visual FoxPro Driver};SourceType=DBF;SourceDB=" + DBPath + ";Exclusive=No;NULL=NO;Collate=Machine;BACKGROUNDFETCH=NO;DELETED=NO";
                using (connection = new OdbcConnection(connstring))  //创建connection连接对象 
                {
                    try
                    {
                        connection.Open();  //打开链接 
                        Ocomm.CommandText = sqlstr;
                        Ocomm.CommandType = CommandType.Text;
                        OdbcDataAdapter da = new OdbcDataAdapter(sqlstr, connection);
                        da.Fill(dt);

                    }
                    catch (Exception e)
                    {
                        throw new Exception(e.Message);
                    }
                }
            }
            connection.Close();
            return dt;

        }
        /// <summary>
        /// dbf执行无返回语句
        /// </summary>
        /// <param name="sqlstr"></param>
        public static void dbfExecuteNonQuery(string sqlstr)
        {

            if (conn.State == ConnectionState.Closed)
            {
                String connstring = @"Driver={Microsoft Visual FoxPro Driver};SourceType=DBF;SourceDB=" + DBPath + ";Exclusive=No;NULL=NO;Collate=Machine;BACKGROUNDFETCH=NO;DELETED=NO";
                using (connection = new OdbcConnection(connstring))  //创建connection连接对象 
                {
                    try
                    {
                        connection.Open();  //打开链接 
                        Ocomm.CommandText = sqlstr;
                        Ocomm.CommandType = CommandType.Text;
                        Ocomm = new OdbcCommand(sqlstr, connection);
                        Ocomm.ExecuteNonQuery();

                    }
                    catch (Exception e)
                    {
                        throw new Exception(e.Message);
                    }
                }
                connection.Close();
            }

        }
        /// <summary>
        /// 打开Access数据库
        /// </summary>
        public static void openConnection()
        {
            // DBPath=Startpath+@"\database\DBData.mdb";
            if (conn.State == ConnectionState.Closed)
            {
                conn.ConnectionString = @"Provider=Microsoft.Jet.OleDb.4.0;  
	              Data Source=" + DBPath;
                comm.Connection = conn;
                try
                {
                    conn.Open();
                }
                catch (Exception e)
                {
                    throw new Exception(e.Message);
                }
            }
        }
        /// <summary>
        /// 打开access数据库
        /// </summary>
        /// <param name="StroreDBPath"></param>
        public static void openConnection(string StroreDBPath)
        {
            if (conn.State == ConnectionState.Closed)
            {
                conn.ConnectionString = @"Provider=Microsoft.Jet.OleDb.4.0;  
	              Data Source=" + StroreDBPath + @"\database\DBData.mdb";
                comm.Connection = conn;
                try
                {
                    conn.Open();
                }
                catch (Exception e)
                {
                    throw new Exception(e.Message);
                }
            }
        }
        public static void closeConnection()
        {
            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
                conn.Dispose();
                comm.Dispose();
            }
        }
        public static Boolean IsExits(string sqlstr)
        {
            try
            {
                openConnection();
                comm.CommandType = CommandType.Text;
                comm.CommandText = sqlstr;
                comm.ExecuteNonQuery();
                return true;
            }
            catch
            {
                return false;
            }
            finally
            {
                closeConnection();
            }
        }
        public static void exctuesql(string sqlstr)
        {
            try
            {
                openConnection();
                comm.CommandType = CommandType.Text;
                comm.CommandText = sqlstr;
                comm.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
            finally
            {
                closeConnection();
            }
        }
        public static OleDbDataReader dataReader(string sqlstr)
        {
            OleDbDataReader dr = null;
            try
            {
                openConnection();
                comm.CommandText = sqlstr;
                comm.CommandType = CommandType.Text;
                dr = comm.ExecuteReader(CommandBehavior.CloseConnection);
            }
            catch
            {
                try
                {
                    dr.Close();
                    closeConnection();
                }
                catch { }
            }
            finally
            {
                //dr.Close();
                //closeConnection();
            }
            return dr;
        }
        //IErrorInfo.GetDescription 因 E_FAIL(0x80004005) 而失败。
        //可能引起这个问题是因为sql语句错误，或者是SQL语句中有access的关键字
        public static void dataReader(string sqlstr, ref OleDbDataReader dr)
        {
            try
            {
                openConnection();
                comm.CommandType = CommandType.Text;
                comm.CommandText = sqlstr;
                dr = comm.ExecuteReader(CommandBehavior.CloseConnection);
            }
            catch
            {
                try
                {
                    if (dr != null && dr.IsClosed)
                        dr.Close();
                }
                catch { };
            }
            finally
            {
                closeConnection();
            }
        }

        public static DataSet dataSet(string sqlstr)
        {
            DataSet ds = new DataSet();
            OleDbDataAdapter da = new OleDbDataAdapter();
            try
            {
                openConnection();
                comm.CommandText = sqlstr;
                comm.CommandType = CommandType.Text;
                da.SelectCommand = comm;
                Application.DoEvents();
                da.Fill(ds);

            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
            finally
            {
                closeConnection();
            }
            return ds;
        }

        public static void dataSet(string sqlstr, ref DataSet ds)
        {
            OleDbDataAdapter da = new OleDbDataAdapter();
            try
            {
                openConnection();
                comm.CommandType = CommandType.Text;
                comm.CommandText = sqlstr;
                da.SelectCommand = comm;
                da.Fill(ds);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
            finally
            {
                closeConnection();
            }
        }

        public static DataTable dataTable(string sqlstr)
        {
            DataTable dt = new DataTable();
           
            try
            {
                openConnection();
                OleDbDataAdapter da = new OleDbDataAdapter(sqlstr,conn);
                da.Fill(dt);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
            finally
            {
                closeConnection();
            }
            return dt;
        }

        public static void dataTable(string sqlstr, ref DataTable dt)
        {
            OleDbDataAdapter da = new OleDbDataAdapter();
            try
            {
                openConnection();
                comm.CommandType = CommandType.Text;
                comm.CommandText = sqlstr;
                da.SelectCommand = comm;
                da.Fill(dt);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
            finally
            {
                closeConnection();
            }
        }
        public static DataView dataview(string sqlstr)
        {
            OleDbDataAdapter da = new OleDbDataAdapter();
            DataView dv = new DataView();
            DataSet ds = new DataSet();
            try
            {
                openConnection();
                comm.CommandType = CommandType.Text;
                comm.CommandText = sqlstr;
                da.SelectCommand = comm;
                da.Fill(ds);
                dv = ds.Tables[0].DefaultView;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
            finally
            {
                closeConnection();
            }
            return dv;
        }
        /// <summary>
        /// 获取数据库中所有的表名
        /// </summary>
        /// <returns></returns>
        public static string[] GetShemaTableName()
        {
            try
            {
                //获取数据表
                openConnection();
                DataTable shemaTable = conn.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, new object[] { null, null, null, "TABLE" });
                int n = shemaTable.Rows.Count;
                string[] strTable = new string[n];
                int m = shemaTable.Columns.IndexOf("TABLE_NAME");
                for (int i = 0; i < n; i++)
                {
                    DataRow m_DataRow = shemaTable.Rows[i];
                    strTable[i] = m_DataRow.ItemArray.GetValue(m).ToString();
                }
                return strTable;
            }
            catch (OleDbException ex)
            {
                MessageBox.Show("指定的限制集无效:\n" + ex.Message);
                return null;
            }
            finally
            {
                closeConnection();
            }
        }

        /// <summary>
        /// MDI显示窗体，防止重复打开
        /// </summary>
        /// <param name="Frmname">子窗体</param>
        /// <param name="frmMdiParent">父窗体</param>
        public static void showfrm(Form Frmname, Form frmMdiParent)
        {
            bool blnOpen = false;
            foreach (Form frmOpen in frmMdiParent.MdiChildren)
            {
                if (frmOpen.Name == Frmname.Name)
                {
                    frmOpen.Activate();
                    blnOpen = true;
                    break;
                }
            }
            if (blnOpen == false)
            {
                Frmname.MdiParent = frmMdiParent;
                Frmname.Show();
                Frmname.WindowState = FormWindowState.Normal;

            }
        }

    }
}
