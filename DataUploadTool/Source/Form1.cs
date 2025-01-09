using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data; 
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.OleDb;
using Oracle.ManagedDataAccess.Client;
using Oracle.ManagedDataAccess.Types;
using System.Configuration;
using System.Collections;
using System.Xml; 
using System.Globalization;
using System.Data.SqlClient;


namespace GenyDataUploadTool
{
    public partial class frm_main : Form
    {
        public frm_main()
        {
            InitializeComponent();
        }

        OracleHelper Och = new OracleHelper();
        MSSqlHelper mssqlh = new MSSqlHelper();  
        EEMbench eembench = new EEMbench();
        SubRSMbench subrsmbench = new SubRSMbench();
        ArrayList TableName = new ArrayList();
        string Detect_task_no;
        //获取Configuration对象
        Configuration config = System.Configuration.ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None);
        private void frm_main_Load(object sender, EventArgs e)
        {

            lstMeter.Columns.Add("Asset code", 195, HorizontalAlignment.Center);
            lstMeter.Columns.Add("factory number", 110, HorizontalAlignment.Center);
            lstMeter.Columns.Add("MeterID", 0, HorizontalAlignment.Center);
            lstMeter.Columns.Add("Inspector", 70, HorizontalAlignment.Center);
            lstMeter.Columns.Add("Hanging watch number", 70, HorizontalAlignment.Center);
            //ConnectAccess.DBPath = Application.StartupPath + @"\database\dbdata.mdb";
            //TableName.Add(ConnectAccess.GetShemaTableName());
            chkBath.Enabled = false;
            chkSelectAll.Checked = true;
            Loadinifile();
            toolStripProgressBar1.Width = statusStrip1.Width - toolStripProgressBar1.Bounds.Left - 100;
            ToolTip ttip = new ToolTip();
            ttip.AutomaticDelay = 500;
            ttip.InitialDelay = 500;
            ttip.ReshowDelay = 500;
            ttip.ShowAlways = true;
            ttip.SetToolTip(this.txtRemark, "输入当前设备的标准表编号！");
        }

        private void btnSearch_Click(object sender, EventArgs e)
        {
            lstMeter.Items.Clear();
            cboBath.Items.Clear();
            chkBath.Enabled = true;
            DataTable dt;
            DataTable DETECT_TASK;
            StringBuilder sb = new StringBuilder();
            if (this.rdTypeTwo.Checked == true)
            {
                ConnectAccess.DBPath = Application.StartupPath + @"\database\dbdata.mdb";
                sb.Append("select * from resultdata where testdate between '" + dtStartDate.Text + "' and '" + dtEndDate.Text + "'");
                if (chkBath.Checked && cboBath.Text != "")
                {
                    sb.Append(" and pno='" + cboBath.Text + "'");
                }
                if (chkResult.Checked)
                {
                    sb.Append("  and Conclusion='合格'");
                }
                if (!chkAgain.Checked)
                {
                    sb.Append(" and net<>'x'");
                }
            }
            else
            {
                ConnectAccess.DBPath = Application.StartupPath + @"\database\dbTestData.mdb";
                TableName.Add(ConnectAccess.GetShemaTableName());  
                sb.Append("select * from tblMeter where TestDate between #" + dtStartDate.Text + "# and #" + dtEndDate.Text+"#");
                if (chkBath.Checked && cboBath.Text != "")
                {
                    sb.Append(" and BatchNumber='" + cboBath.Text + "'");
                }
                if (chkResult.Checked)
                {
                    sb.Append("  and Conclusion=true");
                }
                if (!chkAgain.Checked)
                {
                    sb.Append(" and net<>true");
                }

            }
            sb.Append(" order by MeterID asc ");
            OleDbDataReader dr;
            lblTip.Text = "无人员及任务单信息！";
            cboAPP_NO.Text = "";
            cboTester.Text = "";
            dr = ConnectAccess.dataReader(sb.ToString());
            int i = 0;
            try
            {

                lstMeter.BeginUpdate();
                while (dr.Read())
                {
                    if (this.rdTypeTwo.Checked == true)
                    {
                        ListViewItem listem = new ListViewItem();
                        listem.Text = dr["serialno"].ToString();
                        listem.SubItems.Add(dr["meterno"].ToString());
                        listem.SubItems.Add(dr["MeterID"].ToString());
                        listem.SubItems.Add(dr["tester"].ToString());
                        listem.SubItems.Add(dr["Meterplace"].ToString());
                        lstMeter.Items.Add(listem);
                        if (!cboBath.Items.Contains(dr["pno"]))
                        {

                            cboBath.Items.Add(dr["pno"]);
                        }
                        lstMeter.Items[i].Checked = true;
                        //从mt_detect_out_equip表中，查出第一块表对应的工单号，然后再查出工单号对应的检定员名称

                    }
                    else
                    {
                        ListViewItem listem = new ListViewItem();
                        listem.Text = dr["EquitmentNumber"].ToString();
                        listem.SubItems.Add(dr["MeterNo"].ToString());
                        listem.SubItems.Add(dr["MeterID"].ToString());
                        listem.SubItems.Add(dr["Tester"].ToString());
                        listem.SubItems.Add(dr["BatchNumber"].ToString());
                        lstMeter.Items.Add(listem);
                        if (!cboBath.Items.Contains(dr["BatchNumber"]))
                        {

                            cboBath.Items.Add(dr["BatchNumber"]);
                        }
                        lstMeter.Items[i].Checked = true;
                    }

                    i = i + 1;
                }

                dr.Close();
                lstMeter.EndUpdate();
                if (lstMeter.Items.Count > 0)
                {
                    if (this.rdTypeTwo.Checked == true)
                    {
                        UpdateDatagrid(lstMeter.Items[0].SubItems[2].Text);
                    }
                    else
                    {
                        UpdateDatagrid_EEM(lstMeter.Items[0].SubItems[2].Text);

                    }

                }
                showqfh();
                label3.Text = "Found records of electric energy meters in total" + lstMeter.Items.Count + "strip";

            }
            catch (Exception ex)
            {
                MessageBox.Show("operation failed！\n" + ex.Message, "prompt", MessageBoxButtons.OK, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);

            }
            finally
            {

            }
        }
          
        private void showqfh()
        {
            StringBuilder sb = new StringBuilder();
            if (this.rdTypeTwo.Checked == true)
            {
                ConnectAccess.DBPath = Application.StartupPath + @"\database\dbdata.mdb";
                sb.Append("select MeterID,MeterPlace,SerialNo,MeterNo,ScanCode  from resultdata where testdate between '" + dtStartDate.Text + "' and '" + dtEndDate.Text + "'");
                if (chkBath.Checked && cboBath.Text != "")
                {
                    sb.Append(" and pno='" + cboBath.Text + "'");
                }
                if (chkResult.Checked)
                {
                    sb.Append("  and Conclusion='合格'");
                }
                if (!chkAgain.Checked)
                {
                    sb.Append(" and net<>'x'");
                }
            }
            else
            {
                ConnectAccess.DBPath = Application.StartupPath + @"\database\dbTestData.mdb";
                TableName.Add(ConnectAccess.GetShemaTableName());
                sb.Append("select MeterID,BatchNumber,EquitmentNumber ,MeterNo,AssetNo,MeterType,Class,Voltage from tblMeter where TestDate between #" + dtStartDate.Text + "# and #" + dtEndDate.Text+"#");
                if (chkBath.Checked && cboBath.Text != "")
                {
                    sb.Append(" and BatchNumber='" + cboBath.Text + "'");
                }
                if (chkResult.Checked)
                {
                    sb.Append("  and Conclusion=true");
                }
                if (!chkAgain.Checked)
                {
                    sb.Append(" and net<>true");
                }

            }
            sb.Append(" order by MeterID asc ");
            DataSet ds = ConnectAccess.dataSet(sb.ToString());
            Dgqf.DataSource = ds.Tables[0];
            if (Dgqf.Rows.Count > 0)
            {
                Dgqf.Columns[0].Visible = false;
                Dgqf.Columns[1].ReadOnly = true;
                Dgqf.Columns[2].ReadOnly = true;
                Dgqf.Columns[3].ReadOnly = true;
                for (int i = 0; i < Dgqf.Columns.Count; i++)
                {
                    Dgqf.Columns[i].Width = 200;
                }
                Dgqf.Columns[1].Width = 70;
            }
        }
        private void chkBath_CheckedChanged(object sender, EventArgs e)
        {
            if (chkBath.Checked)
            {
                cboBath.Visible = true;

            }
            else
            {
                cboBath.Visible = false;
            }
        }

        private void chkSelectAll_CheckedChanged(object sender, EventArgs e)
        {
            if (lstMeter.Items.Count > 0)
            {
                if (chkSelectAll.Checked)
                {
                    chkSelectAll.Text = "全选";
                }
                else
                {
                    chkSelectAll.Text = "全不选";
                }
                for (int i = 0; i < lstMeter.Items.Count; i++)
                {
                    lstMeter.Items[i].Checked = chkSelectAll.Checked;
                }
            }
        }

        private void lstMeter_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (lstMeter.Items.Count > 0)
            {
                ListView.SelectedIndexCollection indexes = this.lstMeter.SelectedIndices;
                try
                {
                    if (indexes.Count > 0)
                    {
                        int index = indexes[0];
                        if (rdTypeTwo.Checked == true)
                        {
                            UpdateDatagrid(lstMeter.Items[index].SubItems[2].Text);
                        }
                        else
                        {
                            UpdateDatagrid_EEM(lstMeter.Items[index].SubItems[2].Text);
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("操作失败！\n" + ex.Message, "提示", MessageBoxButtons.OK, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);

                }

            }
        }
        /// <summary>
        /// 刷新数据表
        /// </summary>
        /// <param name="MeterID"></param>
        private void UpdateDatagrid(string MeterID)
        {
            StringBuilder sqlstr = new StringBuilder();
            sqlstr.Append("SELECT   [TestRange.ConnectMode] as ConnectMode, [TestRange.RangeCode] as RangeCode,SortNo, ");
            sqlstr.Append("LoadName,Data1,Data2,Data3,Data4,Data5,AveData, ");
            sqlstr.Append("CIData,SmaxData");
            sqlstr.Append(" FROM ErrData INNER JOIN TestRange ON (ErrData.MeterID = TestRange.MeterID) AND (ErrData.RangeCode = TestRange.RangeCode)");
            sqlstr.Append("WHERE ErrData.MeterID=" + MeterID + " ORDER BY ErrData.RangeCode, ErrData.SortNo;");
            DataSet ds = ConnectAccess.dataSet(sqlstr.ToString());
            dgError.DataSource = ds.Tables[0];
            label14.Text = "This record has a total of " + ds.Tables[0].Rows.Count + " A load point";
        }
        private void UpdateDatagrid_EEM(string MeterID)
        {
            StringBuilder sqlstr = new StringBuilder();
            sqlstr.Append("SELECT   [tblMeter.Connection], tblTestResult00.MeasureDegreeID,tblTestResult00.TestItemID,tblTestResult00.TestPointName, ");
            sqlstr.Append("tblTestResult00.ErrData,tblTestResult00.AveData,tblTestResult00.Error "); 
            sqlstr.Append(" FROM tblMeter INNER JOIN tblTestResult00 ON tblMeter.MeterID = tblTestResult00.MeterID ");
            sqlstr.Append("WHERE tblMeter.MeterID=" + MeterID + " ORDER BY tblTestResult00.MeasureDegreeID, tblTestResult00.TestItemID;");
            DataSet ds = ConnectAccess.dataSet(sqlstr.ToString());
            dgError.DataSource = ds.Tables[0];
            label14.Text = "This record has a total of" + ds.Tables[0].Rows.Count + " A load point";
        }
        /// <summary>
        /// 增加datagridview行号，使用笔刷重绘的方法
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void dgError_RowPostPaint(object sender, DataGridViewRowPostPaintEventArgs e)
        {
            SolidBrush B = new SolidBrush(Color.Black);
            e.Graphics.DrawString(Convert.ToString(e.RowIndex + 1, System.Globalization.CultureInfo.CurrentUICulture), e.InheritedRowStyle.Font, B, e.RowBounds.Location.X + 10, e.RowBounds.Location.Y + 4);

        }
        private void Loadinifile()
        {
            StringBuilder sb = new StringBuilder();
            GetorSaveINIFile gs = new GetorSaveINIFile();

            txtIPaddress.Text = gs.Getiniinfo(Application.StartupPath + @"\inifiles\NetConfig.ini", "ODBC", "IP", "10.185.9.20");
            //txtPort.Text = gs.Getiniinfo(Application.StartupPath + @"\inifiles\NetConfig.ini", "ODBC", "port");
            txtServerName.Text = gs.Getiniinfo(Application.StartupPath + @"\inifiles\NetConfig.ini", "ODBC", "ServerName");
            txtUserName.Text = gs.Getiniinfo(Application.StartupPath + @"\inifiles\NetConfig.ini", "ODBC", "UserName");
            txtPsw.Text = gs.Getiniinfo(Application.StartupPath + @"\inifiles\NetConfig.ini", "ODBC", "password");
            txtDeviceNo.Text = gs.Getiniinfo(Application.StartupPath + @"\inifiles\DeviceSetup.ini", "Taiti", "TaitiCode", "0119001");
            txtRemark.Text = gs.Getiniinfo(Application.StartupPath + @"\inifiles\DeviceSetup.ini", "Taiti", "TaitiCerNo");

       
            if (txtIPaddress.Text != "")
            {
                string IP = System.Net.IPAddress.Parse(txtIPaddress.Text).ToString();
                sb.Append("Database =" + txtServerName.Text + ";Server = " + IP + ";Password = " + txtPsw.Text + "; User ID =" + txtUserName.Text + ";");
                txtConnectstr.Text = sb.ToString();
            }
        }

        private void btnsave_Click(object sender, EventArgs e)
        {
            StringBuilder sb = new StringBuilder();
            try
            {
                GetorSaveINIFile gs = new GetorSaveINIFile();
                gs.SaveIniinfo(Application.StartupPath + @"\inifiles\NetConfig.ini", "ODBC", "IP", txtIPaddress.Text);
                //gs.SaveIniinfo(Application.StartupPath + @"\inifiles\NetConfig.ini", "ODBC", "port", txtPort.Text);
                gs.SaveIniinfo(Application.StartupPath + @"\inifiles\NetConfig.ini", "ODBC", "ServerName", txtServerName.Text);
                gs.SaveIniinfo(Application.StartupPath + @"\inifiles\NetConfig.ini", "ODBC", "UserName", txtUserName.Text);
                gs.SaveIniinfo(Application.StartupPath + @"\inifiles\NetConfig.ini", "ODBC", "password", txtPsw.Text);

                string IP = System.Net.IPAddress.Parse(txtIPaddress.Text).ToString();
                //sb.Append("Data Source=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=" + IP + ") (PORT=" + txtPort.Text + ")))");
                //sb.Append("(CONNECT_DATA=(SERVICE_NAME= " + txtServerName.Text + ")));User Id=" + txtUserName.Text + "; Password=" + txtPsw.Text + ";");
                //txtConnectstr.Text = sb.ToString();

                //sb.Append("Database =" + txtServerName.Text +";Server = " + IP +  ";Port = 3306;Password = " + txtPsw.Text + "; UserID = "+ txtUserName.Text+";SslMode=none;allowPublicKeyRetrieval=true;");
                sb.Append("Database =" + txtServerName.Text + ";Server = " + IP + ";Password = " + txtPsw.Text + "; User ID = " + txtUserName.Text + ";");
                txtConnectstr.Text = sb.ToString();
                gs.SaveIniinfo(Application.StartupPath + @"\inifiles\NetConfig.ini", "ODBC", "ConnectStr", txtConnectstr.Text);
                groupBox2.Enabled = false;

            }
            catch (Exception ex)
            {
                MessageBox.Show("操作失败！\n" + ex.Message, "提示", MessageBoxButtons.OK, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);

            }

        }

        private void txtIPaddress_KeyPress(object sender, KeyPressEventArgs e)
        {
            ///只能输入IP地址格式的字符
            if (((int)e.KeyChar < 48 || (int)e.KeyChar > 57) && (int)e.KeyChar != 8 && (int)e.KeyChar != 46)

                e.Handled = true;
        }

        private void txtPort_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar != 8 && !Char.IsDigit(e.KeyChar))//判断输入值是否是数值，否则不让输入
            {
                e.Handled = true;
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {

            using (SqlConnection conn = new SqlConnection(txtConnectstr.Text))
            {
                try
                {
                    conn.Open();
                    if (conn.State == ConnectionState.Open)
                    {
                        MessageBox.Show("服务器连接成功", "提示");
                    } 

                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString(), "错误提示", MessageBoxButtons.OK);
                }
                finally
                {
                    conn.Close();
                }
            }


        }

        private void btnConfig_Click(object sender, EventArgs e)
        {
            groupBox2.Enabled = true;
        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {

            if (chkReadApp_no.Checked)
            {
                cboAPP_NO.Enabled = true;
                cboTestUnit.Enabled = true;
                cboTester.Enabled = true;
                if (rd_tianhu.Checked)
                {

                    //cboTester.DataSource = Och.ExecuteDataTable("select distinct EXEC_RESP_NAME from MT_DETECT_TASK");
                    //cboTester.DisplayMember = "EXEC_RESP_NAME";

                }
                else
                {
                    //cboTestUnit.DataSource = Och.ExecuteDataTable("select distinct  Busi_name from Meter_APP_info");
                    //cboTestUnit.DisplayMember = "Busi_name";
                    //cboTester.DataSource = Och.ExecuteDataTable("select distinct OPERATOR_NAME from Meter_APP_info");
                    //cboTester.DisplayMember = "OPERATOR_NAME";
                }
            }
            else
            {
                cboAPP_NO.Enabled = false;
                cboTestUnit.Enabled = false;
                cboTester.Enabled = false;
            }
        }

        private void cboTestUnit_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cboTestUnit.Text != "")
            {
            }
        }

        private void cboTester_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cboTester.Text != "")
            {
                if (rd_tianhu.Checked)
                {
                    // select * from MM_DETECT_TASK where EXEC_RESP_NAME='" & jdry & "'  and HANDLE_FLAG=0 order by DETECT_TASK_NO DESC
                    //cboAPP_NO.DataSource = Och.ExecuteDataTable("select DETECT_TASK_NO from MT_DETECT_TASK where HANDLE_FLAG=0 and EXEC_RESP_NAME='" + cboTester.Text + "'  order by DETECT_TASK_NO DESC");
                    //cboAPP_NO.DisplayMember = "DETECT_TASK_NO";

                }
                else
                {
                    //cboAPP_NO.DataSource = Och.ExecuteDataTable("select app_no from Meter_APP_info where OVer_flag='N' and operator_name='" + cboTester.Text + "'");
                    //cboAPP_NO.DisplayMember = "app_no";
                }

            }
        }

        private void PostEEMUpLoad()
        {
            //如果工作单为空时则不上传]
            string sqlstr = string.Empty;
            toolStripProgressBar1.Maximum = lstMeter.Items.Count;
            for (int i = 0; i < lstMeter.Items.Count; i++)
            {
                toolStripProgressBar1.Value = i + 1;
                ConnectAccess.DBPath = Application.StartupPath + @"\database\dbTestData.mdb";
                UpdateOracle_EEMMeterID(lstMeter.Items[i].SubItems[2].Text);
                //sqlstr = "update tblMeter set net=true where MeterID=" + lstMeter.Items[i].SubItems[2].Text;
                //ConnectAccess.exctuesql(sqlstr);

            }
            //根据测试时间数据上传的
            UpdateOracle_EEMTestDate();

            //相比较再上传
            UpdateOracle_EEMTest();

            MessageBox.Show("数据上传成功", "温馨提示");
        }

        private void btnUpLoad_Click(object sender, EventArgs e)
        {
            if (this.rdTypeTwo.Checked == true)
            {
                //如果工作单为空时则不上传]
                string sqlstr = string.Empty;
                int j = 0;
                DataTable DTresult = new DataTable();//基本信息
                DataTable DTError = new DataTable();//基本误差
                DataTable DTMulti = new DataTable();//多功能数据
                DataTable Dbrain = new DataTable();//智能表试验
                DataTable DShow = new DataTable();//时钟示值误差
                DataTable DSpecial = new DataTable();//影响量试验
                PreView pv = new PreView();

                toolStripProgressBar1.Maximum = lstMeter.Items.Count+60;
                for (int i = 0; i < lstMeter.Items.Count; i++)
                { 
                    toolStripProgressBar1.Value = i + 1;
                    ConnectAccess.DBPath = Application.StartupPath + @"\database\dbData.mdb";
                    UpdateOracle_SubRSMMeterID(lstMeter.Items[i].SubItems[2].Text);
                    sqlstr = "update resultdata set net='x' where MeterID=" + lstMeter.Items[i].SubItems[2].Text;
                    ConnectAccess.exctuesql(sqlstr);

                }
                //先筛选再新增
                UpdateOracle_SubRSMMeasureDegree();
                toolStripProgressBar1.Value = lstMeter.Items.Count + 20;
                UpdateOracle_SubRSMdbMeterTmp();
                toolStripProgressBar1.Value = lstMeter.Items.Count + 20;
                UpdateOracle_SubRSMInputTemp();
                toolStripProgressBar1.Value = lstMeter.Items.Count + 20; 
            }
            else
            {
                //如果工作单为空时则不上传
                string sqlstr = string.Empty;
                toolStripProgressBar1.Maximum = lstMeter.Items.Count+50;
                for (int i = 0; i < lstMeter.Items.Count; i++)
                {
                    toolStripProgressBar1.Value = i + 1;
                    ConnectAccess.DBPath = Application.StartupPath + @"\database\dbTestData.mdb";
                    UpdateOracle_EEMMeterID(lstMeter.Items[i].SubItems[2].Text);
                    sqlstr = "update tblMeter set net=true where MeterID=" + lstMeter.Items[i].SubItems[2].Text;
                    ConnectAccess.exctuesql(sqlstr);

                }
                //先筛选再新增
                UpdateOracle_EEMSeleWay();
                toolStripProgressBar1.Value = lstMeter.Items.Count + 25;
                UpdateOracle_EEMtmpData();
                toolStripProgressBar1.Value = lstMeter.Items.Count + 50;
            }
            MessageBox.Show("Data upload successful");
        }



        
 
      
  
        private void Showlog(string TestItem, string MeterID)
        {
            Rclog.AppendText(DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + " MeterID：" + MeterID + "ploading-->" + TestItem + "\n");
        }
        private void frm_main_FormClosed(object sender, FormClosedEventArgs e)
        {
            //GetorSaveINIFile gs = new GetorSaveINIFile();

            GetorSaveINIFile gs = new GetorSaveINIFile();
            gs.SaveIniinfo(Application.StartupPath + @"\inifiles\NetConfig.ini", "Device", "TypeD", rdTypeTwo.Checked.ToString());
            gs.SaveIniinfo(Application.StartupPath + @"\inifiles\NetConfig.ini", "Device", "TypeG", rdTypeone.Checked.ToString());
            gs.SaveIniinfo(Application.StartupPath + @"\inifiles\DeviceSetup.ini", "Taiti", "TaitiCode", txtDeviceNo.Text);
            gs.SaveIniinfo(Application.StartupPath + @"\inifiles\DeviceSetup.ini", "Taiti", "TaitiCerNo", txtRemark.Text);
        }

        private void btnPreView_Click(object sender, EventArgs e)
        {
            PreView pv = new PreView();
            pv.app_no = cboAPP_NO.Text;
            pv.haiyi = rd_haiyi.Checked;
            pv.Show();
        }

        private void btnDelAPP_NO_Click(object sender, EventArgs e)
        {
             

        }

        private void btnRy_Click(object sender, EventArgs e)
        {
            //打开ini文件
            System.Diagnostics.Process.Start(Application.StartupPath + @"\inifiles\ry.ini");
        }

        private void btnSaveQf_Click(object sender, EventArgs e)
        {
            StringBuilder sb = new StringBuilder();
            if (rdTypeTwo.Checked)
            {
                for (int i = 0; i < Dgqf.Rows.Count; i++)
                {
                    sb.Append("Update ResultData set qfh1='" + Dgqf.Rows[i].Cells["左耳封"].Value.ToString() + "',qfh2='" + Dgqf.Rows[i].Cells["右耳封"].Value.ToString() + "',qfh3='" + Dgqf.Rows[i].Cells["编程封"].Value.ToString() + "' where meterid=" + Dgqf.Rows[i].Cells["MeterID"].Value.ToString());
                    ConnectAccess.exctuesql(sb.ToString());
                    sb.Clear();
                }
            }
            else
            {
                for (int i = 0; i < Dgqf.Rows.Count; i++)
                {
                    sb.Append("Update Main set other7='" + Dgqf.Rows[i].Cells["左耳封"].Value.ToString() + "',other8='" + Dgqf.Rows[i].Cells["右耳封"].Value.ToString() + "',other9='" + Dgqf.Rows[i].Cells["编程封"].Value.ToString() + "' where meterid=" + Dgqf.Rows[i].Cells["MeterID"].Value.ToString());
                    ConnectAccess.exctuesql(sb.ToString());
                    sb.Clear();
                }
            }
            MessageBox.Show("铅封号已更新！", "温馨提示", MessageBoxButtons.OK, MessageBoxIcon.Information);

        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            int Crow = Dgqf.CurrentRow.Index;
            int Ccol = Dgqf.CurrentCell.ColumnIndex;
            string Tmpstr = Dgqf.CurrentCell.Value.ToString();
            double Gno = Convert.ToDouble(Tmpstr.Substring(3, Tmpstr.Length - 3));
            for (int i = Crow + 1; i < Dgqf.Rows.Count; i++)
            {
                Gno += 1;
                Dgqf.Rows[i].Cells[Ccol].Value = Tmpstr.Substring(1, 3) + Gno.ToString();
            }
        }

        /// <summary>
        /// EEM类型根据MeterID同步数据
        /// </summary>
        /// <param name="MeterID"></param>
        private void UpdateOracle_EEMMeterID(string MeterID)
        {
            ArrayList Sqllist = new ArrayList();
            DataTable PublicDT = new DataTable();//D型台EEM模式数据查询公用表
            string TmpSql = string.Empty;
            string PbStr = string.Empty;
            try
            {
               
                PbStr = "select * from tblMeter where meterID=" + MeterID;
                PublicDT = ConnectAccess.dataTable(PbStr);
                Sqllist = eembench.Upload_dbTDtblMeter(PublicDT);
                if (Sqllist.Count > 0)
                {
                    Showlog("tblMeter", MeterID);
                    mssqlh.ExecuteSqlTran(Sqllist);
                }
                 
                PbStr = "select * from tblHarmonic where meterID=" + MeterID;
                PublicDT = ConnectAccess.dataTable(PbStr);
                Sqllist = eembench.Upload_dbTDtblHarmonic(PublicDT);
                if (Sqllist.Count > 0)
                {
                    Showlog("tblHarmonic", MeterID);
                    mssqlh.ExecuteSqlTran(Sqllist);
                }
                 
                PbStr = "select * from tblMeasureDegree where meterID=" + MeterID;
                PublicDT = ConnectAccess.dataTable(PbStr);
                Sqllist = eembench.Upload_tblMeasureDegree(PublicDT);
                if (Sqllist.Count > 0)
                {
                    Showlog("tblMeasureDegree", MeterID);
                    mssqlh.ExecuteSqlTran(Sqllist);
                }
                 
                PbStr = "select * from tblTestItem where meterID=" + MeterID;
                PublicDT = ConnectAccess.dataTable(PbStr);
                Sqllist = eembench.Upload_tblTestItem(PublicDT);
                if (Sqllist.Count > 0)
                {
                    Showlog("tblTestItem", MeterID);
                    mssqlh.ExecuteSqlTran(Sqllist);
                }
                 
                PbStr = "select * from tblTestResult00 where meterID=" + MeterID;
                PublicDT = ConnectAccess.dataTable(PbStr);
                Sqllist = eembench.Upload_dbTDtblTestResult00(PublicDT);
                if (Sqllist.Count > 0)
                {
                    Showlog("tblTestResult00", MeterID);
                    mssqlh.ExecuteSqlTran(Sqllist);
                }
                 
                PbStr = "select * from tblTestResult01 where meterID=" + MeterID;
                PublicDT = ConnectAccess.dataTable(PbStr);
                Sqllist = eembench.Upload_dbTDtblTestResult01(PublicDT);
                if (Sqllist.Count > 0)
                {
                    Showlog("tblTestResult01", MeterID);
                    mssqlh.ExecuteSqlTran(Sqllist);
                }
                 
                PbStr = "select * from tblTestResult02 where meterID=" + MeterID;
                PublicDT = ConnectAccess.dataTable(PbStr);
                Sqllist = eembench.Upload_dbTDtblTestResult02(PublicDT);
                if (Sqllist.Count > 0)
                {
                    Showlog("tblTestResult02", MeterID);
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                PbStr = "select * from tblTestResult03 where meterID=" + MeterID;
                PublicDT = ConnectAccess.dataTable(PbStr);
                Sqllist = eembench.Upload_dbTDtblTestResult03(PublicDT);
                if (Sqllist.Count > 0)
                {
                    Showlog("tblTestResult03", MeterID);
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                PbStr = "select * from tblTestResult05 where meterID=" + MeterID;
                PublicDT = ConnectAccess.dataTable(PbStr);
                Sqllist = eembench.Upload_dbTDtblTestResult05(PublicDT);
                if (Sqllist.Count > 0)
                {
                    Showlog("tblTestResult05", MeterID);
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                PbStr = "select * from tblTestResult06 where meterID=" + MeterID;
                PublicDT = ConnectAccess.dataTable(PbStr);
                Sqllist = eembench.Upload_dbTDtblTestResult06(PublicDT);
                if (Sqllist.Count > 0)
                {
                    Showlog("tblTestResult06", MeterID);
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                PbStr = "select * from tblTestResult07 where meterID=" + MeterID;
                PublicDT = ConnectAccess.dataTable(PbStr);
                Sqllist = eembench.Upload_dbTDtblTestResult07(PublicDT);
                if (Sqllist.Count > 0)
                {
                    Showlog("tblTestResult07", MeterID);
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                PbStr = "select * from tblTestResult08 where meterID=" + MeterID;
                PublicDT = ConnectAccess.dataTable(PbStr);
                Sqllist = eembench.Upload_dbTDtblTestResult08(PublicDT);
                if (Sqllist.Count > 0)
                {
                    Showlog("tblTestResult08", MeterID);
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                PbStr = "select * from tblTestResult10 where meterID=" + MeterID;
                PublicDT = ConnectAccess.dataTable(PbStr);
                Sqllist = eembench.Upload_dbTDtblTestResult10(PublicDT);
                if (Sqllist.Count > 0)
                {
                    Showlog("tblTestResult10", MeterID);
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                PbStr = "select * from tblTestResult16 where meterID=" + MeterID;
                PublicDT = ConnectAccess.dataTable(PbStr);
                Sqllist = eembench.Upload_dbTDtblTestResult16(PublicDT);
                if (Sqllist.Count > 0)
                {
                    Showlog("tblTestResult16", MeterID);
                    mssqlh.ExecuteSqlTran(Sqllist);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("operation failed！\n" + ex.Message, "prompt", MessageBoxButtons.OK, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);
            }
        }

        private void UpdateOracle_EEMTestDate()
        {
            ArrayList Sqllist = new ArrayList();
            DataTable PublicDT = new DataTable();//D型台EEM模式数据查询公用表 
            DataTable UpdatDT = new DataTable();//服务器数据表的数据
            string TmpSql = string.Empty;
            string PbStr = string.Empty;
            try
            {
                ConnectAccess.DBPath = Application.StartupPath + @"\database\dbTestData.mdb";  
                PbStr = "select * from tblBatch where TestDate between #" + dtStartDate.Text + "# and #" + dtEndDate.Text + "#";
                PublicDT = ConnectAccess.dataTable(PbStr);
                PbStr = "select * from tblBatch where TestDate between '" + dtStartDate.Text + "' and '" + dtEndDate.Text + "'";
                UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                //客户端表和服务器表都存在记录时，而且客户端数据大于服务器端时
                if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count > UpdatDT.Rows.Count)
                {
                    //先筛选再新增
                    PublicDT = PublicDT.AsEnumerable().Where(rowA => !UpdatDT.AsEnumerable().Any(rowB => rowA["BatchNumber"].Equals(rowB["BatchNumber"]))).CopyToDataTable();
                    Sqllist = eembench.Upload_tblBatch(PublicDT);
                }
                else if(PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count == 0 )
                {
                    Sqllist = eembench.Upload_tblBatch(PublicDT);
                } 
                if (Sqllist.Count > 0)
                {
                    mssqlh.ExecuteSqlTran(Sqllist);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("操作失败！\n" + ex.Message, "提示", MessageBoxButtons.OK, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);
            }
        }

        private void UpdateOracle_EEMSeleWay()
        {
            ArrayList Sqllist = new ArrayList();
            DataTable PublicDT = new DataTable();//D型台EEM模式数据查询公用表 
            DataTable UpdatDT = new DataTable();//服务器数据表的数据
            string TmpSql = string.Empty;
            string PbStr = string.Empty;
            try
            {
                ConnectAccess.DBPath = Application.StartupPath + @"\database\SeleWay.mdb";
                PbStr = "select * from MeterInfo ";
                PublicDT = ConnectAccess.dataTable(PbStr); 
                UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                //客户端表和服务器表都存在记录时，而且客户端数据大于服务器端时
                if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count > UpdatDT.Rows.Count)
                {
                    //先筛选再新增
                    PublicDT = PublicDT.AsEnumerable().Where(rowA => !UpdatDT.AsEnumerable().Any(rowB => rowA["cType"].Equals(rowB["cType"])&& rowA["iAddressType"].Equals(rowB["iAddressType"]))).CopyToDataTable();
                    Sqllist = eembench.Upload_MeterInfo(PublicDT);
                }
                else if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count == 0)
                {
                    Sqllist = eembench.Upload_MeterInfo(PublicDT);
                }
                if (Sqllist.Count > 0)
                {
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                PbStr = "select * from RuleAffectData ";
                PublicDT = ConnectAccess.dataTable(PbStr);
                UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                //客户端表和服务器表都存在记录时，而且客户端数据大于服务器端时
                if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count > UpdatDT.Rows.Count)
                {
                    //先筛选再新增
                    PublicDT = PublicDT.AsEnumerable().Where(rowA => !UpdatDT.AsEnumerable().Any(rowB => rowA["cWayName"].Equals(rowB["cWayName"]) && rowA["iAffectNo"].Equals(rowB["iAffectNo"]))).CopyToDataTable();
                    Sqllist = eembench.Upload_RuleAffectData(PublicDT);
                }
                else if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count == 0)
                {
                    Sqllist = eembench.Upload_RuleAffectData(PublicDT);
                }
                if (Sqllist.Count > 0)
                {
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                PbStr = "select * from RuleAffectData ";
                PublicDT = ConnectAccess.dataTable(PbStr);
                UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                //客户端表和服务器表都存在记录时，而且客户端数据大于服务器端时
                if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count > UpdatDT.Rows.Count)
                {
                    //先筛选再新增
                    PublicDT = PublicDT.AsEnumerable().Where(rowA => !UpdatDT.AsEnumerable().Any(rowB => rowA["cWayName"].Equals(rowB["cWayName"]) && rowA["iAffectNo"].Equals(rowB["iAffectNo"]))).CopyToDataTable();
                    Sqllist = eembench.Upload_RuleAffectData(PublicDT);
                }
                else if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count == 0)
                {
                    Sqllist = eembench.Upload_RuleAffectData(PublicDT);
                }
                if (Sqllist.Count > 0)
                {
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                PbStr = "select * from RuleErrorData ";
                PublicDT = ConnectAccess.dataTable(PbStr);
                UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                //客户端表和服务器表都存在记录时，而且客户端数据大于服务器端时
                if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count > UpdatDT.Rows.Count)
                {
                    //先筛选再新增
                    PublicDT = PublicDT.AsEnumerable().Where(rowA => !UpdatDT.AsEnumerable().Any(rowB => rowA["cType"].Equals(rowB["cType"]) && rowA["cPointName"].Equals(rowB["cPointName"]))).CopyToDataTable();
                    Sqllist = eembench.Upload_RuleErrorData(PublicDT);
                }
                else if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count == 0)
                {
                    Sqllist = eembench.Upload_RuleErrorData(PublicDT);
                }
                if (Sqllist.Count > 0)
                {
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                PbStr = "select * from RuleWayData ";
                PublicDT = ConnectAccess.dataTable(PbStr);
                UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                //客户端表和服务器表都存在记录时，而且客户端数据大于服务器端时
                if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count > UpdatDT.Rows.Count)
                {
                    //先筛选再新增
                    PublicDT = PublicDT.AsEnumerable().Where(rowA => !UpdatDT.AsEnumerable().Any(rowB => rowA["cWayName"].Equals(rowB["cWayName"]) && rowA["cWayTest"].Equals(rowB["cWayTest"]))).CopyToDataTable();
                    Sqllist = eembench.Upload_RuleWayData(PublicDT);
                }
                else if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count == 0)
                {
                    Sqllist = eembench.Upload_RuleWayData(PublicDT);
                }
                if (Sqllist.Count > 0)
                {
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                PbStr = "select * from ScanCode ";
                PublicDT = ConnectAccess.dataTable(PbStr);
                UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                //客户端表和服务器表都存在记录时，而且客户端数据大于服务器端时
                if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count > UpdatDT.Rows.Count)
                {
                    //先筛选再新增
                    PublicDT = PublicDT.AsEnumerable().Where(rowA => !UpdatDT.AsEnumerable().Any(rowB => rowA["cType"].Equals(rowB["cType"]) && rowA["cName"].Equals(rowB["cName"]))).CopyToDataTable();
                    Sqllist = eembench.Upload_ScanCode(PublicDT);
                }
                else if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count == 0)
                {
                    Sqllist = eembench.Upload_ScanCode(PublicDT);
                }
                if (Sqllist.Count > 0)
                {
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                PbStr = "select * from TestAffectData ";
                PublicDT = ConnectAccess.dataTable(PbStr);
                UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                //客户端表和服务器表都存在记录时，而且客户端数据大于服务器端时
                if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count > UpdatDT.Rows.Count)
                {
                    //先筛选再新增
                    PublicDT = PublicDT.AsEnumerable().Where(rowA => !UpdatDT.AsEnumerable().Any(rowB => rowA["cWayName"].Equals(rowB["cWayName"]) && rowA["iAffectNo"].Equals(rowB["iAffectNo"]))).CopyToDataTable();
                    Sqllist = eembench.Upload_TestAffectData(PublicDT);
                }
                else if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count == 0)
                {
                    Sqllist = eembench.Upload_TestAffectData(PublicDT);
                }
                if (Sqllist.Count > 0)
                {
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                PbStr = "select * from TestAffectDataStd ";
                PublicDT = ConnectAccess.dataTable(PbStr);
                UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                //客户端表和服务器表都存在记录时，而且客户端数据大于服务器端时
                if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count > UpdatDT.Rows.Count)
                {
                    //先筛选再新增
                    PublicDT = PublicDT.AsEnumerable().Where(rowA => !UpdatDT.AsEnumerable().Any(rowB => rowA["cWayName"].Equals(rowB["cWayName"]) && rowA["iAffectNo"].Equals(rowB["iAffectNo"]))).CopyToDataTable();
                    Sqllist = eembench.Upload_TestAffectDataStd(PublicDT);
                }
                else if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count == 0)
                {
                    Sqllist = eembench.Upload_TestAffectDataStd(PublicDT);
                }
                if (Sqllist.Count > 0)
                {
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                PbStr = "select * from TestErrorData ";
                PublicDT = ConnectAccess.dataTable(PbStr);
                UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                //客户端表和服务器表都存在记录时，而且客户端数据大于服务器端时
                if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count > UpdatDT.Rows.Count)
                {
                    //先筛选再新增
                    PublicDT = PublicDT.AsEnumerable().Where(rowA => !UpdatDT.AsEnumerable().Any(rowB => rowA["cWayName"].Equals(rowB["cWayName"]) && rowA["iPointNo"].Equals(rowB["iPointNo"]))).CopyToDataTable();
                    Sqllist = eembench.Upload_TestErrorData(PublicDT);
                }
                else if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count == 0)
                {
                    Sqllist = eembench.Upload_TestErrorData(PublicDT);
                }
                if (Sqllist.Count > 0)
                {
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                PbStr = "select * from TestErrorDataStd ";
                PublicDT = ConnectAccess.dataTable(PbStr);
                UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                //客户端表和服务器表都存在记录时，而且客户端数据大于服务器端时
                if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count > UpdatDT.Rows.Count)
                {
                    //先筛选再新增
                    PublicDT = PublicDT.AsEnumerable().Where(rowA => !UpdatDT.AsEnumerable().Any(rowB => rowA["cWayName"].Equals(rowB["cWayName"]) && rowA["iPointNo"].Equals(rowB["iPointNo"]))).CopyToDataTable();
                    Sqllist = eembench.Upload_TestErrorDataStd(PublicDT);
                }
                else if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count == 0)
                {
                    Sqllist = eembench.Upload_TestErrorDataStd(PublicDT);
                }
                if (Sqllist.Count > 0)
                {
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                PbStr = "select * from TestWayData ";
                PublicDT = ConnectAccess.dataTable(PbStr);
                UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                //客户端表和服务器表都存在记录时，而且客户端数据大于服务器端时
                if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count > UpdatDT.Rows.Count)
                {
                    //先筛选再新增
                    PublicDT = PublicDT.AsEnumerable().Where(rowA => !UpdatDT.AsEnumerable().Any(rowB => rowA["cWayName"].Equals(rowB["cWayName"]) && rowA["cWayTest"].Equals(rowB["cWayTest"]))).CopyToDataTable();
                    Sqllist = eembench.Upload_TestWayData(PublicDT);
                }
                else if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count == 0)
                {
                    Sqllist = eembench.Upload_TestWayData(PublicDT);
                }
                if (Sqllist.Count > 0)
                {
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                PbStr = "select * from TestWayDataStd ";
                PublicDT = ConnectAccess.dataTable(PbStr);
                UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                //客户端表和服务器表都存在记录时，而且客户端数据大于服务器端时
                if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count > UpdatDT.Rows.Count)
                {
                    //先筛选再新增
                    PublicDT = PublicDT.AsEnumerable().Where(rowA => !UpdatDT.AsEnumerable().Any(rowB => rowA["cWayName"].Equals(rowB["cWayName"]) && rowA["cWayTest"].Equals(rowB["cWayTest"]))).CopyToDataTable();
                    Sqllist = eembench.Upload_TestWayDataStd(PublicDT);
                }
                else if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count == 0)
                {
                    Sqllist = eembench.Upload_TestWayDataStd(PublicDT);
                }
                if (Sqllist.Count > 0)
                {
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                PbStr = "select * from UseData ";
                PublicDT = ConnectAccess.dataTable(PbStr);
                UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                //客户端表和服务器表都存在记录时，而且客户端数据大于服务器端时
                if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count > UpdatDT.Rows.Count)
                {
                    //先筛选再新增
                    PublicDT = PublicDT.AsEnumerable().Where(rowA => !UpdatDT.AsEnumerable().Any(rowB => rowA["cType"].Equals(rowB["cType"]) && rowA["cValue"].Equals(rowB["cValue"]))).CopyToDataTable();
                    Sqllist = eembench.Upload_UseData(PublicDT);
                }
                else if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count == 0)
                {
                    Sqllist = eembench.Upload_UseData(PublicDT);
                }
                if (Sqllist.Count > 0)
                {
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                PbStr = "select * from UserData ";
                PublicDT = ConnectAccess.dataTable(PbStr);
                UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                //客户端表和服务器表都存在记录时，而且客户端数据大于服务器端时
                if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count > UpdatDT.Rows.Count)
                {
                    //先筛选再新增
                    PublicDT = PublicDT.AsEnumerable().Where(rowA => !UpdatDT.AsEnumerable().Any(rowB => rowA["ID"].Equals(rowB["ID"]) && rowA["USER"].Equals(rowB["USER"]))).CopyToDataTable();
                    Sqllist = eembench.Upload_UserData(PublicDT);
                }
                else if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count == 0)
                {
                    Sqllist = eembench.Upload_UserData(PublicDT);
                }
                if (Sqllist.Count > 0)
                {
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                PbStr = "select * from XieBoData ";
                PublicDT = ConnectAccess.dataTable(PbStr);
                UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                //客户端表和服务器表都存在记录时，而且客户端数据大于服务器端时
                if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count > UpdatDT.Rows.Count)
                {
                    //先筛选再新增
                    PublicDT = PublicDT.AsEnumerable().Where(rowA => !UpdatDT.AsEnumerable().Any(rowB => rowA["cName"].Equals(rowB["cName"]) && rowA["cType"].Equals(rowB["cType "]) && rowA["Share"].Equals(rowB["Share"]))).CopyToDataTable();
                    Sqllist = eembench.Upload_XieBoData(PublicDT);
                }
                else if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count == 0)
                {
                    Sqllist = eembench.Upload_XieBoData(PublicDT);
                }
                if (Sqllist.Count > 0)
                {
                    mssqlh.ExecuteSqlTran(Sqllist);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("操作失败！\n" + ex.Message, "提示", MessageBoxButtons.OK, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);
            }
        }

        private void UpdateOracle_EEMtmpData()
        {
            ArrayList Sqllist = new ArrayList();
            DataTable PublicDT = new DataTable();//D型台EEM模式数据查询公用表 
            DataTable UpdatDT = new DataTable();//服务器数据表的数据
            string TmpSql = string.Empty;
            string PbStr = string.Empty;
            try
            {
                ConnectAccess.DBPath = Application.StartupPath + @"\database\tmpData.mdb";
                PbStr = "select * from NumberCode ";
                PublicDT = ConnectAccess.dataTable(PbStr);
                UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                //客户端表和服务器表都存在记录时，而且客户端数据大于服务器端时
                if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count > UpdatDT.Rows.Count)
                {
                    //先筛选再新增
                    PublicDT = PublicDT.AsEnumerable().Where(rowA => !UpdatDT.AsEnumerable().Any(rowB => rowA["IndexID"].Equals(rowB["IndexID"]) && rowA["serialno"].Equals(rowB["serialno"]))).CopyToDataTable();
                    Sqllist = eembench.Upload_NumberCode(PublicDT);
                }
                else if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count == 0)
                {
                    Sqllist = eembench.Upload_NumberCode(PublicDT);
                }
                if (Sqllist.Count > 0)
                {
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                PbStr = "select * from tblRtInfo ";
                PublicDT = ConnectAccess.dataTable(PbStr);
                UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                //客户端表和服务器表都存在记录时，而且客户端数据大于服务器端时
                if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count > UpdatDT.Rows.Count)
                {
                    //先筛选再新增
                    PublicDT = PublicDT.AsEnumerable().Where(rowA => !UpdatDT.AsEnumerable().Any(rowB => rowA["pid"].Equals(rowB["pid"]) && rowA["range"].Equals(rowB["range"]))).CopyToDataTable();
                    Sqllist = eembench.Upload_tblRtInfo(PublicDT);
                }
                else if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count == 0)
                {
                    Sqllist = eembench.Upload_tblRtInfo(PublicDT);
                }
                if (Sqllist.Count > 0)
                {
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                PbStr = "select * from TmpCommResult ";
                PublicDT = ConnectAccess.dataTable(PbStr);
                UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                //客户端表和服务器表都存在记录时，而且客户端数据大于服务器端时
                if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count > UpdatDT.Rows.Count)
                {
                    //先筛选再新增
                    PublicDT = PublicDT.AsEnumerable().Where(rowA => !UpdatDT.AsEnumerable().Any(rowB => rowA["ID"].Equals(rowB["ID"]) && rowA["IndexID"].Equals(rowB["IndexID"]))).CopyToDataTable();
                    Sqllist = eembench.Upload_TmpCommResult(PublicDT);
                }
                else if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count == 0)
                {
                    Sqllist = eembench.Upload_TmpCommResult(PublicDT);
                }
                if (Sqllist.Count > 0)
                {
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                PbStr = "select * from TmpError ";
                PublicDT = ConnectAccess.dataTable(PbStr);
                UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                //客户端表和服务器表都存在记录时，而且客户端数据大于服务器端时
                if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count > UpdatDT.Rows.Count)
                {
                    //先筛选再新增
                    PublicDT = PublicDT.AsEnumerable().Where(rowA => !UpdatDT.AsEnumerable().Any(rowB => rowA["IndexID"].Equals(rowB["IndexID"]) && rowA["iRangeNo"].Equals(rowB["iRangeNo"]))).CopyToDataTable();
                    Sqllist = eembench.Upload_TmpError(PublicDT);
                }
                else if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count == 0)
                {
                    Sqllist = eembench.Upload_TmpError(PublicDT);
                }
                if (Sqllist.Count > 0)
                {
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                PbStr = "select * from TmpMultiResult ";
                PublicDT = ConnectAccess.dataTable(PbStr);
                UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                //客户端表和服务器表都存在记录时，而且客户端数据大于服务器端时
                if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count > UpdatDT.Rows.Count)
                {
                    //先筛选再新增
                    PublicDT = PublicDT.AsEnumerable().Where(rowA => !UpdatDT.AsEnumerable().Any(rowB => rowA["MeterID"].Equals(rowB["MeterID"]))).CopyToDataTable();
                    Sqllist = eembench.Upload_TmpMultiResult(PublicDT);
                }
                else if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count == 0)
                {
                    Sqllist = eembench.Upload_TmpMultiResult(PublicDT);
                }
                if (Sqllist.Count > 0)
                {
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                PbStr = "select * from TmpSpecialError ";
                PublicDT = ConnectAccess.dataTable(PbStr);
                UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                //客户端表和服务器表都存在记录时，而且客户端数据大于服务器端时
                if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count > UpdatDT.Rows.Count)
                {
                    //先筛选再新增
                    PublicDT = PublicDT.AsEnumerable().Where(rowA => !UpdatDT.AsEnumerable().Any(rowB => rowA["cType"].Equals(rowB["cType"]) && rowA["cName"].Equals(rowB["cName"]))).CopyToDataTable();
                    Sqllist = eembench.Upload_TmpSpecialError(PublicDT);
                }
                else if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count == 0)
                {
                    Sqllist = eembench.Upload_TmpSpecialError(PublicDT);
                }
                if (Sqllist.Count > 0)
                {
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                //Access数据库不存在，先注释
                //PbStr = "select * from dbDtmpData ";
                //PublicDT = ConnectAccess.dataTable(PbStr);
                //UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                ////客户端表和服务器表都存在记录时，而且客户端数据大于服务器端时
                //if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count > UpdatDT.Rows.Count)
                //{
                //    //先筛选再新增
                //    PublicDT = PublicDT.AsEnumerable().Where(rowA => !UpdatDT.AsEnumerable().Any(rowB => rowA["IndexID"].Equals(rowB["IndexID"]))).CopyToDataTable();
                //    Sqllist = eembench.Upload_dbDtmpData(PublicDT);
                //}
                //else if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count == 0)
                //{
                //    Sqllist = eembench.Upload_dbDtmpData(PublicDT);
                //}
                //if (Sqllist.Count > 0)
                //{
                //    mssqlh.ExecuteSqlTran(Sqllist);
                //}
            }
            catch (Exception ex)
            {
                MessageBox.Show("操作失败！\n" + ex.Message, "提示", MessageBoxButtons.OK, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);
            }
        }

        private void UpdateOracle_EEMTest()
        {
            ArrayList Sqllist = new ArrayList();
            DataTable PublicDT = new DataTable();//D型台EEM模式数据查询公用表
            DataTable UpdatDT = new DataTable();//服务器数据表的数据
            string TmpSql = string.Empty;
            string PbStr = string.Empty;
            try
            {
                ConnectAccess.DBPath = Application.StartupPath + @"\database\dbTestData.mdb";
                PbStr = "select * from MeterInfo";
                PublicDT = ConnectAccess.dataTable(PbStr);
                UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                //无规则先删除再新增
                if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count != UpdatDT.Rows.Count)
                {
                    string sql = "delete MeterInfo;";
                    int execute =mssqlh.ExecuteSql(sql);
                }
                Sqllist = eembench.Upload_MeterInfo(PublicDT);
                if (Sqllist.Count > 0)
                {
                    mssqlh.ExecuteSqlTran(Sqllist);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("操作失败！\n" + ex.Message, "提示", MessageBoxButtons.OK, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);
            }
        }

        /// <summary>
        /// EEM类型根据MeterID同步数据
        /// </summary>
        /// <param name="MeterID"></param>
        private void UpdateOracle_SubRSMMeterID(string MeterID)
        {
            ArrayList Sqllist = new ArrayList();
            DataTable PublicDT = new DataTable();//D型台Sub_RSM模式数据查询公用表
            string TmpSql = string.Empty;
            string PbStr = string.Empty;
            try
            {
                PbStr = "select * from ErrData where meterID=" + MeterID;
                PublicDT = ConnectAccess.dataTable(PbStr);
                Sqllist = subrsmbench.Upload_ErrData(PublicDT);
                if (Sqllist.Count > 0)
                {
                    Showlog("ErrData", MeterID);
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                PbStr = "select * from ResultData where meterID=" + MeterID;
                PublicDT = ConnectAccess.dataTable(PbStr);
                Sqllist = subrsmbench.Upload_ResultData(PublicDT);
                if (Sqllist.Count > 0)
                {
                    Showlog("ResultData", MeterID);
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                PbStr = "select * from SpecialErrorData where meterID=" + MeterID;
                PublicDT = ConnectAccess.dataTable(PbStr);
                Sqllist = subrsmbench.Upload_SpecialErrorData(PublicDT);
                if (Sqllist.Count > 0)
                {
                    Showlog("SpecialErrorData", MeterID);
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                PbStr = "select * from TestRange where meterID=" + MeterID;
                PublicDT = ConnectAccess.dataTable(PbStr);
                Sqllist = subrsmbench.Upload_TestRange(PublicDT);
                if (Sqllist.Count > 0)
                {
                    Showlog("TestRange", MeterID);
                    mssqlh.ExecuteSqlTran(Sqllist);
                } 
                 
                PbStr = "select * from tmpresult where meterID=" + MeterID;
                PublicDT = ConnectAccess.dataTable(PbStr);
                Sqllist = subrsmbench.Upload_tmpresult(PublicDT);
                if (Sqllist.Count > 0)
                {
                    Showlog("tmpresult", MeterID);
                    mssqlh.ExecuteSqlTran(Sqllist);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("operation failed！\n" + ex.Message, "prompt", MessageBoxButtons.OK, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);
            }
        }


        private void UpdateOracle_SubRSMMeasureDegree()
        {
            ArrayList Sqllist = new ArrayList();
            DataTable PublicDT = new DataTable();//D型台sub_RSMM模式数据查询公用表 
            DataTable UpdatDT = new DataTable();//服务器数据表的数据
            string TmpSql = string.Empty;
            string PbStr = string.Empty;
            try
            {
                ConnectAccess.DBPath = Application.StartupPath + @"\database\dbMeasureDegree.mdb";
                PbStr = "select * from BiaoZhenBiaoData ";
                PublicDT = ConnectAccess.dataTable(PbStr);
                UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                //客户端表和服务器表都存在记录时，而且客户端数据大于服务器端时
                if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count > UpdatDT.Rows.Count)
                {
                    //先筛选再新增
                    PublicDT = PublicDT.AsEnumerable().Where(rowA => !UpdatDT.AsEnumerable().Any(rowB => rowA["ModelTypeId"].Equals(rowB["ModelTypeId"]) && rowA["WhereGrid"].Equals(rowB["WhereGrid"]))).CopyToDataTable();
                    Sqllist = subrsmbench.Upload_BiaoZhenBiaoData(PublicDT);
                }
                else if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count == 0)
                {
                    Sqllist = subrsmbench.Upload_BiaoZhenBiaoData(PublicDT);
                }
                if (Sqllist.Count > 0)
                {
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                PbStr = "select * from DataList ";
                PublicDT = ConnectAccess.dataTable(PbStr);
                UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                //客户端表和服务器表都存在记录时，而且客户端数据大于服务器端时
                if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count > UpdatDT.Rows.Count)
                {
                    //先筛选再新增
                    PublicDT = PublicDT.AsEnumerable().Where(rowA => !UpdatDT.AsEnumerable().Any(rowB => rowA["DataName"].Equals(rowB["DataName"]) && rowA["Content"].Equals(rowB["Content"]))).CopyToDataTable();
                    Sqllist = subrsmbench.Upload_DataList(PublicDT);
                }
                else if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count == 0)
                {
                    Sqllist = subrsmbench.Upload_DataList(PublicDT);
                }
                if (Sqllist.Count > 0)
                {
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                PbStr = "select * from ParamList ";
                PublicDT = ConnectAccess.dataTable(PbStr);
                UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                //客户端表和服务器表都存在记录时，而且客户端数据大于服务器端时
                if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count > UpdatDT.Rows.Count)
                {
                    //先筛选再新增
                    PublicDT = PublicDT.AsEnumerable().Where(rowA => !UpdatDT.AsEnumerable().Any(rowB => rowA["Id"].Equals(rowB["Id"]))).CopyToDataTable();
                    Sqllist = subrsmbench.Upload_ParamList(PublicDT);
                }
                else if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count == 0)
                {
                    Sqllist = subrsmbench.Upload_ParamList(PublicDT);
                }
                if (Sqllist.Count > 0)
                {
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                PbStr = "select * from tblCheckHarmonic ";
                PublicDT = ConnectAccess.dataTable(PbStr);
                UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                //客户端表和服务器表都存在记录时，而且客户端数据大于服务器端时
                if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count > UpdatDT.Rows.Count)
                {
                    //先筛选再新增
                    PublicDT = PublicDT.AsEnumerable().Where(rowA => !UpdatDT.AsEnumerable().Any(rowB => rowA["CheckID"].Equals(rowB["CheckID"]) && rowA["CheckHarmonicName"].Equals(rowB["CheckHarmonicName"]))).CopyToDataTable();
                    Sqllist = subrsmbench.Upload_tblCheckHarmonic(PublicDT);
                }
                else if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count == 0)
                {
                    Sqllist = subrsmbench.Upload_tblCheckHarmonic(PublicDT);
                }
                if (Sqllist.Count > 0)
                {
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                PbStr = "select * from tblCheckWay ";
                PublicDT = ConnectAccess.dataTable(PbStr);
                UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                //客户端表和服务器表都存在记录时，而且客户端数据大于服务器端时
                if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count > UpdatDT.Rows.Count)
                {
                    //先筛选再新增
                    PublicDT = PublicDT.AsEnumerable().Where(rowA => !UpdatDT.AsEnumerable().Any(rowB => rowA["CheckID"].Equals(rowB["CheckID"]))).CopyToDataTable();
                    Sqllist = subrsmbench.Upload_tblCheckWay(PublicDT);
                }
                else if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count == 0)
                {
                    Sqllist = subrsmbench.Upload_tblCheckWay(PublicDT);
                }
                if (Sqllist.Count > 0)
                {
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                PbStr = "select * from tblHarmonic ";
                PublicDT = ConnectAccess.dataTable(PbStr);
                UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                //客户端表和服务器表都存在记录时，而且客户端数据大于服务器端时
                if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count > UpdatDT.Rows.Count)
                {
                    //先筛选再新增
                    PublicDT = PublicDT.AsEnumerable().Where(rowA => !UpdatDT.AsEnumerable().Any(rowB => rowA["CheckID"].Equals(rowB["CheckID"]) && rowA["Frequency"].Equals(rowB["Frequency"]))).CopyToDataTable();
                    Sqllist = subrsmbench.Upload_tblHarmonic(PublicDT);
                }
                else if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count == 0)
                {
                    Sqllist = subrsmbench.Upload_tblHarmonic(PublicDT);
                }
                if (Sqllist.Count > 0)
                {
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                PbStr = "select * from tblMeterModel ";
                PublicDT = ConnectAccess.dataTable(PbStr);
                UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                //客户端表和服务器表都存在记录时，而且客户端数据大于服务器端时
                if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count > UpdatDT.Rows.Count)
                {
                    //先筛选再新增
                    PublicDT = PublicDT.AsEnumerable().Where(rowA => !UpdatDT.AsEnumerable().Any(rowB => rowA["ModelTypeID"].Equals(rowB["ModelTypeID"]))).CopyToDataTable();
                    Sqllist = subrsmbench.Upload_tblMeterModel(PublicDT);
                }
                else if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count == 0)
                {
                    Sqllist = subrsmbench.Upload_tblMeterModel(PublicDT);
                }
                if (Sqllist.Count > 0)
                {
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                PbStr = "select * from tblPrjHarmonic ";
                PublicDT = ConnectAccess.dataTable(PbStr);
                UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                //客户端表和服务器表都存在记录时，而且客户端数据大于服务器端时
                if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count > UpdatDT.Rows.Count)
                {
                    //先筛选再新增
                    PublicDT = PublicDT.AsEnumerable().Where(rowA => !UpdatDT.AsEnumerable().Any(rowB => rowA["ProjectID"].Equals(rowB["ProjectID"]) && rowA["TestItemID"].Equals(rowB["TestItemID"]))).CopyToDataTable();
                    Sqllist = subrsmbench.Upload_tblPrjHarmonic(PublicDT);
                }
                else if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count == 0)
                {
                    Sqllist = subrsmbench.Upload_tblPrjHarmonic(PublicDT);
                }
                if (Sqllist.Count > 0)
                {
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                PbStr = "select * from tblPrjMeasureDegree ";
                PublicDT = ConnectAccess.dataTable(PbStr);
                UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                //客户端表和服务器表都存在记录时，而且客户端数据大于服务器端时
                if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count > UpdatDT.Rows.Count)
                {
                    //先筛选再新增
                    PublicDT = PublicDT.AsEnumerable().Where(rowA => !UpdatDT.AsEnumerable().Any(rowB => rowA["ProjectID"].Equals(rowB["ProjectID"]) && rowA["MeasureDegreeID"].Equals(rowB["MeasureDegreeID"]))).CopyToDataTable();
                    Sqllist = subrsmbench.Upload_tblPrjMeasureDegree(PublicDT);
                }
                else if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count == 0)
                {
                    Sqllist = subrsmbench.Upload_tblPrjMeasureDegree(PublicDT);
                }
                if (Sqllist.Count > 0)
                {
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                PbStr = "select * from tblPrjTestItem ";
                PublicDT = ConnectAccess.dataTable(PbStr);
                UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                //客户端表和服务器表都存在记录时，而且客户端数据大于服务器端时
                if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count > UpdatDT.Rows.Count)
                {
                    //先筛选再新增
                    PublicDT = PublicDT.AsEnumerable().Where(rowA => !UpdatDT.AsEnumerable().Any(rowB => rowA["ProjectID"].Equals(rowB["ProjectID"]) && rowA["MeasureDegreeID"].Equals(rowB["MeasureDegreeID"]) && rowA["TestItemID"].Equals(rowB["TestItemID"]))).CopyToDataTable();
                    Sqllist = subrsmbench.Upload_tblPrjTestItem(PublicDT);
                }
                else if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count == 0)
                {
                    Sqllist = subrsmbench.Upload_tblPrjTestItem(PublicDT);
                }
                if (Sqllist.Count > 0)
                {
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                PbStr = "select * from tblPrjTestPoint ";
                PublicDT = ConnectAccess.dataTable(PbStr);
                UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                //客户端表和服务器表都存在记录时，而且客户端数据大于服务器端时
                if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count > UpdatDT.Rows.Count)
                {
                    //先筛选再新增
                    PublicDT = PublicDT.AsEnumerable().Where(rowA => !UpdatDT.AsEnumerable().Any(rowB => rowA["ProjectID"].Equals(rowB["ProjectID"]) && rowA["TestPointId"].Equals(rowB["TestPointId"]))).CopyToDataTable();
                    Sqllist = subrsmbench.Upload_tblPrjTestPoint(PublicDT);
                }
                else if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count == 0)
                {
                    Sqllist = subrsmbench.Upload_tblPrjTestPoint(PublicDT);
                }
                if (Sqllist.Count > 0)
                {
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                PbStr = "select * from tblProject ";
                PublicDT = ConnectAccess.dataTable(PbStr);
                UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                //客户端表和服务器表都存在记录时，而且客户端数据大于服务器端时
                if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count > UpdatDT.Rows.Count)
                {
                    //先筛选再新增
                    PublicDT = PublicDT.AsEnumerable().Where(rowA => !UpdatDT.AsEnumerable().Any(rowB => rowA["ProjectID"].Equals(rowB["ProjectID"]))).CopyToDataTable();
                    Sqllist = subrsmbench.Upload_tblProject(PublicDT);
                }
                else if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count == 0)
                {
                    Sqllist = subrsmbench.Upload_tblProject(PublicDT);
                }
                if (Sqllist.Count > 0)
                {
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                PbStr = "select * from tblTestPoint ";
                PublicDT = ConnectAccess.dataTable(PbStr);
                UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                //客户端表和服务器表都存在记录时，而且客户端数据大于服务器端时
                if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count > UpdatDT.Rows.Count)
                {
                    //先筛选再新增
                    PublicDT = PublicDT.AsEnumerable().Where(rowA => !UpdatDT.AsEnumerable().Any(rowB => rowA["CheckID"].Equals(rowB["CheckID"]) && rowA["ListNo"].Equals(rowB["ListNo"]))).CopyToDataTable();
                    Sqllist = subrsmbench.Upload_tblTestPoint(PublicDT);
                }
                else if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count == 0)
                {
                    Sqllist = subrsmbench.Upload_tblTestPoint(PublicDT);
                }
                if (Sqllist.Count > 0)
                {
                    mssqlh.ExecuteSqlTran(Sqllist);
                } 
            }
            catch (Exception ex)
            {
                MessageBox.Show("操作失败！\n" + ex.Message, "提示", MessageBoxButtons.OK, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);
            }
        }

        private void UpdateOracle_SubRSMdbMeterTmp()
        {
            ArrayList Sqllist = new ArrayList();
            DataTable PublicDT = new DataTable();//D型台sub_RSMM模式数据查询公用表 
            DataTable UpdatDT = new DataTable();//服务器数据表的数据
            string TmpSql = string.Empty;
            string PbStr = string.Empty;
            try
            {
                ConnectAccess.DBPath = Application.StartupPath + @"\database\dbMeterTmp.mdb";
                PbStr = "select * from BiaoZhenBiaoData ";
                PublicDT = ConnectAccess.dataTable(PbStr);
                PbStr = "select * from dbMTBiaoZhenBiaoData ";
                UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                //客户端表和服务器表都存在记录时，而且客户端数据大于服务器端时
                if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count > UpdatDT.Rows.Count)
                {
                    //先筛选再新增
                    PublicDT = PublicDT.AsEnumerable().Where(rowA => !UpdatDT.AsEnumerable().Any(rowB => rowA["MeterHungID"].Equals(rowB["MeterHungID"]) && rowA["WhereGrid"].Equals(rowB["WhereGrid"]) && rowA["Data"].Equals(rowB["Data"]))).CopyToDataTable();
                    Sqllist = subrsmbench.Upload_dbMTBiaoZhenBiaoData(PublicDT);
                }
                else if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count == 0)
                {
                    Sqllist = subrsmbench.Upload_dbMTBiaoZhenBiaoData(PublicDT);
                }
                if (Sqllist.Count > 0)
                {
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                PbStr = "select * from BiaoZhenBiaoData2 ";
                PublicDT = ConnectAccess.dataTable(PbStr);
                UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                //客户端表和服务器表都存在记录时，而且客户端数据大于服务器端时
                if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count > UpdatDT.Rows.Count)
                {
                    //先筛选再新增
                    PublicDT = PublicDT.AsEnumerable().Where(rowA => !UpdatDT.AsEnumerable().Any(rowB => rowA["MeterHungId"].Equals(rowB["MeterHungId"]) && rowA["TypeId"].Equals(rowB["TypeId"]) && rowA["Data"].Equals(rowB["Data"]))).CopyToDataTable();
                    Sqllist = subrsmbench.Upload_BiaoZhenBiaoData2(PublicDT);
                }
                else if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count == 0)
                {
                    Sqllist = subrsmbench.Upload_BiaoZhenBiaoData2(PublicDT);
                }
                if (Sqllist.Count > 0)
                {
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                PbStr = "select * from tblAutoRunList ";
                PublicDT = ConnectAccess.dataTable(PbStr);
                UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                //客户端表和服务器表都存在记录时，而且客户端数据大于服务器端时
                if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count > UpdatDT.Rows.Count)
                {
                    //先筛选再新增
                    PublicDT = PublicDT.AsEnumerable().Where(rowA => !UpdatDT.AsEnumerable().Any(rowB => rowA["ListNo"].Equals(rowB["ListNo"]))).CopyToDataTable();
                    Sqllist = subrsmbench.Upload_tblAutoRunList(PublicDT);
                }
                else if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count == 0)
                {
                    Sqllist = subrsmbench.Upload_tblAutoRunList(PublicDT);
                }
                if (Sqllist.Count > 0)
                {
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                PbStr = "select * from tblMeter ";
                PublicDT = ConnectAccess.dataTable(PbStr);
                UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                //客户端表和服务器表都存在记录时，而且客户端数据大于服务器端时
                if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count > UpdatDT.Rows.Count)
                {
                    //先筛选再新增
                    PublicDT = PublicDT.AsEnumerable().Where(rowA => !UpdatDT.AsEnumerable().Any(rowB => rowA["MeterHungID"].Equals(rowB["MeterHungID"]) && rowA["ModelTypeId"].Equals(rowB["ModelTypeId"]))).CopyToDataTable();
                    Sqllist = subrsmbench.Upload_tblMeter(PublicDT);
                }
                else if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count == 0)
                {
                    Sqllist = subrsmbench.Upload_tblMeter(PublicDT);
                }
                if (Sqllist.Count > 0)
                {
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                PbStr = "select * from tblMeterModel ";
                PublicDT = ConnectAccess.dataTable(PbStr);
                PbStr = "select * from dbMTtblMeterModel ";
                UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                //客户端表和服务器表都存在记录时，而且客户端数据大于服务器端时
                if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count > UpdatDT.Rows.Count)
                {
                    //先筛选再新增
                    PublicDT = PublicDT.AsEnumerable().Where(rowA => !UpdatDT.AsEnumerable().Any(rowB => rowA["ModelTypeID"].Equals(rowB["ModelTypeID"]))).CopyToDataTable();
                    Sqllist = subrsmbench.Upload_dbMTtblMeterModel(PublicDT);
                }
                else if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count == 0)
                {
                    Sqllist = subrsmbench.Upload_dbMTtblMeterModel(PublicDT);
                }
                if (Sqllist.Count > 0)
                {
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                PbStr = "select * from tblPrjHarmonic ";
                PublicDT = ConnectAccess.dataTable(PbStr);
                PbStr = "select * from dbMTtblPrjHarmonic ";
                UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                //客户端表和服务器表都存在记录时，而且客户端数据大于服务器端时
                if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count > UpdatDT.Rows.Count)
                {
                    //先筛选再新增
                    PublicDT = PublicDT.AsEnumerable().Where(rowA => !UpdatDT.AsEnumerable().Any(rowB => rowA["MeasureDegreeID"].Equals(rowB["MeasureDegreeID"]) && rowA["TestItemID"].Equals(rowB["TestItemID"]))).CopyToDataTable();
                    Sqllist = subrsmbench.Upload_dbMTtblPrjHarmonic(PublicDT);
                }
                else if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count == 0)
                {
                    Sqllist = subrsmbench.Upload_dbMTtblPrjHarmonic(PublicDT);
                }
                if (Sqllist.Count > 0)
                {
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                PbStr = "select * from tblPrjMeasureDegree ";
                PublicDT = ConnectAccess.dataTable(PbStr);
                PbStr = "select * from dbMTtblPrjMeasureDegree ";
                UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                //客户端表和服务器表都存在记录时，而且客户端数据大于服务器端时
                if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count > UpdatDT.Rows.Count)
                {
                    //先筛选再新增
                    PublicDT = PublicDT.AsEnumerable().Where(rowA => !UpdatDT.AsEnumerable().Any(rowB => rowA["ModelTypeID"].Equals(rowB["ModelTypeID"]) && rowA["MeasureName"].Equals(rowB["MeasureName"]))).CopyToDataTable();
                    Sqllist = subrsmbench.Upload_dbMTtblPrjMeasureDegree(PublicDT);
                }
                else if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count == 0)
                {
                    Sqllist = subrsmbench.Upload_dbMTtblPrjMeasureDegree(PublicDT);
                }
                if (Sqllist.Count > 0)
                {
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                PbStr = "select * from tblPrjTestPoint";
                PublicDT = ConnectAccess.dataTable(PbStr);
                PbStr = "select * from dbMTtblPrjTestPoint ";
                UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                //客户端表和服务器表都存在记录时，而且客户端数据大于服务器端时
                if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count > UpdatDT.Rows.Count)
                {
                    //先筛选再新增
                    PublicDT = PublicDT.AsEnumerable().Where(rowA => !UpdatDT.AsEnumerable().Any(rowB => rowA["MeasureDegreeID"].Equals(rowB["MeasureDegreeID"]) && rowA["TestPointName"].Equals(rowB["TestPointName"]))).CopyToDataTable();
                    Sqllist = subrsmbench.Upload_dbMTtblPrjTestPoint(PublicDT);
                }
                else if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count == 0)
                {
                    Sqllist = subrsmbench.Upload_dbMTtblPrjTestPoint(PublicDT);
                }
                if (Sqllist.Count > 0)
                {
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                PbStr = "select * from tblPrjTestPointMeter ";
                PublicDT = ConnectAccess.dataTable(PbStr);
                UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                //客户端表和服务器表都存在记录时，而且客户端数据大于服务器端时
                if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count > UpdatDT.Rows.Count)
                {
                    //先筛选再新增
                    PublicDT = PublicDT.AsEnumerable().Where(rowA => !UpdatDT.AsEnumerable().Any(rowB => rowA["MeterHungID"].Equals(rowB["MeterHungID"]) && rowA["MeasureDegreeID"].Equals(rowB["MeasureDegreeID"]))).CopyToDataTable();
                    Sqllist = subrsmbench.Upload_tblPrjTestPointMeter(PublicDT);
                }
                else if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count == 0)
                {
                    Sqllist = subrsmbench.Upload_tblPrjTestPointMeter(PublicDT);
                }
                if (Sqllist.Count > 0)
                {
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                PbStr = "select * from tblProject ";
                PublicDT = ConnectAccess.dataTable(PbStr);
                PbStr = "select * from dbMTtblProject ";
                UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                //客户端表和服务器表都存在记录时，而且客户端数据大于服务器端时
                if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count > UpdatDT.Rows.Count)
                {
                    //先筛选再新增
                    PublicDT = PublicDT.AsEnumerable().Where(rowA => !UpdatDT.AsEnumerable().Any(rowB => rowA["ProjectID"].Equals(rowB["ProjectID"]) && rowA["ProjectName"].Equals(rowB["ProjectName"]) && rowA["TestItemID"].Equals(rowB["TestItemID"]))).CopyToDataTable();
                    Sqllist = subrsmbench.Upload_dbMTtblProject(PublicDT);
                }
                else if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count == 0)
                {
                    Sqllist = subrsmbench.Upload_dbMTtblProject(PublicDT);
                }
                if (Sqllist.Count > 0)
                {
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                PbStr = "select * from tblTestResult00 ";
                PublicDT = ConnectAccess.dataTable(PbStr);
                UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                //客户端表和服务器表都存在记录时，而且客户端数据大于服务器端时
                if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count > UpdatDT.Rows.Count)
                {
                    //先筛选再新增
                    PublicDT = PublicDT.AsEnumerable().Where(rowA => !UpdatDT.AsEnumerable().Any(rowB => rowA["MeterHungID"].Equals(rowB["MeterHungID"]) && rowA["MeasureDegreeID"].Equals(rowB["MeasureDegreeID"]))).CopyToDataTable();
                    Sqllist = subrsmbench.Upload_tblTestResult00(PublicDT);
                }
                else if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count == 0)
                {
                    Sqllist = subrsmbench.Upload_tblTestResult00(PublicDT);
                }
                if (Sqllist.Count > 0)
                {
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                PbStr = "select * from tblTestResult01 ";
                PublicDT = ConnectAccess.dataTable(PbStr);
                UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                //客户端表和服务器表都存在记录时，而且客户端数据大于服务器端时
                if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count > UpdatDT.Rows.Count)
                {
                    //先筛选再新增
                    PublicDT = PublicDT.AsEnumerable().Where(rowA => !UpdatDT.AsEnumerable().Any(rowB => rowA["MeterHungID"].Equals(rowB["MeterHungID"]) && rowA["MeasureDegreeID"].Equals(rowB["MeasureDegreeID"]))).CopyToDataTable();
                    Sqllist = subrsmbench.Upload_tblTestResult01(PublicDT);
                }
                else if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count == 0)
                {
                    Sqllist = subrsmbench.Upload_tblTestResult01(PublicDT);
                }
                if (Sqllist.Count > 0)
                {
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                PbStr = "select * from tblTestResult02 ";
                PublicDT = ConnectAccess.dataTable(PbStr);
                UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                //客户端表和服务器表都存在记录时，而且客户端数据大于服务器端时
                if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count > UpdatDT.Rows.Count)
                {
                    //先筛选再新增
                    PublicDT = PublicDT.AsEnumerable().Where(rowA => !UpdatDT.AsEnumerable().Any(rowB => rowA["MeterHungID"].Equals(rowB["MeterHungID"]) && rowA["MeasureDegreeID"].Equals(rowB["MeasureDegreeID"]))).CopyToDataTable();
                    Sqllist = subrsmbench.Upload_tblTestResult02(PublicDT);
                }
                else if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count == 0)
                {
                    Sqllist = subrsmbench.Upload_tblTestResult02(PublicDT);
                }
                if (Sqllist.Count > 0)
                {
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                PbStr = "select * from tblTestResult03 ";
                PublicDT = ConnectAccess.dataTable(PbStr);
                UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                //客户端表和服务器表都存在记录时，而且客户端数据大于服务器端时
                if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count > UpdatDT.Rows.Count)
                {
                    //先筛选再新增
                    PublicDT = PublicDT.AsEnumerable().Where(rowA => !UpdatDT.AsEnumerable().Any(rowB => rowA["MeterHungID"].Equals(rowB["MeterHungID"]) && rowA["MeasureDegreeID"].Equals(rowB["MeasureDegreeID"]))).CopyToDataTable();
                    Sqllist = subrsmbench.Upload_tblTestResult03(PublicDT);
                }
                else if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count == 0)
                {
                    Sqllist = subrsmbench.Upload_tblTestResult03(PublicDT);
                }
                if (Sqllist.Count > 0)
                {
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                PbStr = "select * from tblTestResult05 ";
                PublicDT = ConnectAccess.dataTable(PbStr);
                UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                //客户端表和服务器表都存在记录时，而且客户端数据大于服务器端时
                if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count > UpdatDT.Rows.Count)
                {
                    //先筛选再新增
                    PublicDT = PublicDT.AsEnumerable().Where(rowA => !UpdatDT.AsEnumerable().Any(rowB => rowA["MeterHungID"].Equals(rowB["MeterHungID"]) && rowA["MeasureDegreeID"].Equals(rowB["MeasureDegreeID"]))).CopyToDataTable();
                    Sqllist = subrsmbench.Upload_tblTestResult05(PublicDT);
                }
                else if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count == 0)
                {
                    Sqllist = subrsmbench.Upload_tblTestResult05(PublicDT);
                }
                if (Sqllist.Count > 0)
                {
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                PbStr = "select * from tblTestResult06 ";
                PublicDT = ConnectAccess.dataTable(PbStr);
                UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                //客户端表和服务器表都存在记录时，而且客户端数据大于服务器端时
                if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count > UpdatDT.Rows.Count)
                {
                    //先筛选再新增
                    PublicDT = PublicDT.AsEnumerable().Where(rowA => !UpdatDT.AsEnumerable().Any(rowB => rowA["MeterHungID"].Equals(rowB["MeterHungID"]) && rowA["MeasureDegreeID"].Equals(rowB["MeasureDegreeID"]))).CopyToDataTable();
                    Sqllist = subrsmbench.Upload_tblTestResult06(PublicDT);
                }
                else if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count == 0)
                {
                    Sqllist = subrsmbench.Upload_tblTestResult06(PublicDT);
                }
                if (Sqllist.Count > 0)
                {
                    mssqlh.ExecuteSqlTran(Sqllist);
                }
                PbStr = "select * from tblTestResult07 ";
                PublicDT = ConnectAccess.dataTable(PbStr);
                UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                //客户端表和服务器表都存在记录时，而且客户端数据大于服务器端时
                if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count > UpdatDT.Rows.Count)
                {
                    //先筛选再新增
                    PublicDT = PublicDT.AsEnumerable().Where(rowA => !UpdatDT.AsEnumerable().Any(rowB => rowA["MeterHungID"].Equals(rowB["MeterHungID"]) && rowA["MeasureDegreeID"].Equals(rowB["MeasureDegreeID"]))).CopyToDataTable();
                    Sqllist = subrsmbench.Upload_tblTestResult07(PublicDT);
                }
                else if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count == 0)
                {
                    Sqllist = subrsmbench.Upload_tblTestResult07(PublicDT);
                }
                if (Sqllist.Count > 0)
                {
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                PbStr = "select * from tblTestResult08 ";
                PublicDT = ConnectAccess.dataTable(PbStr);
                UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                //客户端表和服务器表都存在记录时，而且客户端数据大于服务器端时
                if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count > UpdatDT.Rows.Count)
                {
                    //先筛选再新增
                    PublicDT = PublicDT.AsEnumerable().Where(rowA => !UpdatDT.AsEnumerable().Any(rowB => rowA["MeterHungID"].Equals(rowB["MeterHungID"]) && rowA["MeasureDegreeID"].Equals(rowB["MeasureDegreeID"]))).CopyToDataTable();
                    Sqllist = subrsmbench.Upload_tblTestResult08(PublicDT);
                }
                else if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count == 0)
                {
                    Sqllist = subrsmbench.Upload_tblTestResult08(PublicDT);
                }
                if (Sqllist.Count > 0)
                {
                    mssqlh.ExecuteSqlTran(Sqllist);
                }
                PbStr = "select * from tblTestResult10 ";
                PublicDT = ConnectAccess.dataTable(PbStr);
                UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                //客户端表和服务器表都存在记录时，而且客户端数据大于服务器端时
                if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count > UpdatDT.Rows.Count)
                {
                    //先筛选再新增
                    PublicDT = PublicDT.AsEnumerable().Where(rowA => !UpdatDT.AsEnumerable().Any(rowB => rowA["MeterHungID"].Equals(rowB["MeterHungID"]) && rowA["MeasureDegreeID"].Equals(rowB["MeasureDegreeID"]))).CopyToDataTable();
                    Sqllist = subrsmbench.Upload_tblTestResult10(PublicDT);
                }
                else if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count == 0)
                {
                    Sqllist = subrsmbench.Upload_tblTestResult10(PublicDT);
                }
                if (Sqllist.Count > 0)
                {
                    mssqlh.ExecuteSqlTran(Sqllist);
                }
                PbStr = "select * from tblTestResult16 ";
                PublicDT = ConnectAccess.dataTable(PbStr);
                UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                //客户端表和服务器表都存在记录时，而且客户端数据大于服务器端时
                if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count > UpdatDT.Rows.Count)
                {
                    //先筛选再新增
                    PublicDT = PublicDT.AsEnumerable().Where(rowA => !UpdatDT.AsEnumerable().Any(rowB => rowA["MeterHungID"].Equals(rowB["MeterHungID"]) && rowA["MeasureDegreeID"].Equals(rowB["MeasureDegreeID"]))).CopyToDataTable();
                    Sqllist = subrsmbench.Upload_tblTestResult00(PublicDT);
                }
                else if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count == 0)
                {
                    Sqllist = subrsmbench.Upload_tblTestResult00(PublicDT);
                }
                if (Sqllist.Count > 0)
                {
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

            }
            catch (Exception ex)
            {
                MessageBox.Show("操作失败！\n" + ex.Message, "提示", MessageBoxButtons.OK, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);
            }
        }

        private void UpdateOracle_SubRSMInputTemp()
        {
            ArrayList Sqllist = new ArrayList();
            DataTable PublicDT = new DataTable();//D型台sub_RSMM模式数据查询公用表 
            DataTable UpdatDT = new DataTable();//服务器数据表的数据
            string TmpSql = string.Empty;
            string PbStr = string.Empty;
            try
            {
                ConnectAccess.DBPath = Application.StartupPath + @"\database\InputTemp.mdb";
                PbStr = "select * from Inputtemp ";
                PublicDT = ConnectAccess.dataTable(PbStr); 
                UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                //客户端表和服务器表都存在记录时，而且客户端数据大于服务器端时
                if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count > UpdatDT.Rows.Count)
                {
                    //先筛选再新增
                    PublicDT = PublicDT.AsEnumerable().Where(rowA => !UpdatDT.AsEnumerable().Any(rowB => rowA["Meterid"].Equals(rowB["Meterid"]) && rowA["Modeltypeid"].Equals(rowB["Modeltypeid"]) && rowA["Serialno"].Equals(rowB["Serialno"]))).CopyToDataTable();
                    Sqllist = subrsmbench.Upload_Inputtemp(PublicDT);
                }
                else if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count == 0)
                {
                    Sqllist = subrsmbench.Upload_Inputtemp(PublicDT);
                }
                if (Sqllist.Count > 0)
                {
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                PbStr = "select * from tempdata ";
                PublicDT = ConnectAccess.dataTable(PbStr);
                UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                //客户端表和服务器表都存在记录时，而且客户端数据大于服务器端时
                if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count > UpdatDT.Rows.Count)
                {
                    //先筛选再新增
                    PublicDT = PublicDT.AsEnumerable().Where(rowA => !UpdatDT.AsEnumerable().Any(rowB => rowA["Serialno"].Equals(rowB["Serialno"]) && rowA["Meterno"].Equals(rowB["Meterno"]) && rowA["Assetno"].Equals(rowB["Assetno"]))).CopyToDataTable();
                    Sqllist = subrsmbench.Upload_tempdata(PublicDT);
                }
                else if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count == 0)
                {
                    Sqllist = subrsmbench.Upload_tempdata(PublicDT);
                }
                if (Sqllist.Count > 0)
                {
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                PbStr = "select * from Txmcode ";
                PublicDT = ConnectAccess.dataTable(PbStr);
                UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                //客户端表和服务器表都存在记录时，而且客户端数据大于服务器端时
                if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count > UpdatDT.Rows.Count)
                {
                    //先筛选再新增
                    PublicDT = PublicDT.AsEnumerable().Where(rowA => !UpdatDT.AsEnumerable().Any(rowB => rowA["Id"].Equals(rowB["Id"]))).CopyToDataTable();
                    Sqllist = subrsmbench.Upload_Txmcode(PublicDT);
                }
                else if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count == 0)
                {
                    Sqllist = subrsmbench.Upload_Txmcode(PublicDT);
                }
                if (Sqllist.Count > 0)
                {
                    mssqlh.ExecuteSqlTran(Sqllist);
                }

                PbStr = "select * from Txmway ";
                PublicDT = ConnectAccess.dataTable(PbStr);
                UpdatDT = mssqlh.GetDataSet(PbStr).Tables[0];
                //客户端表和服务器表都存在记录时，而且客户端数据大于服务器端时
                if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count > 0 && PublicDT.Rows.Count > UpdatDT.Rows.Count)
                {
                    //先筛选再新增
                    PublicDT = PublicDT.AsEnumerable().Where(rowA => !UpdatDT.AsEnumerable().Any(rowB => rowA["MeterHungID"].Equals(rowB["MeterHungID"]) && rowA["ModelTypeId"].Equals(rowB["ModelTypeId"]))).CopyToDataTable();
                    Sqllist = subrsmbench.Upload_Txmway(PublicDT);
                }
                else if (PublicDT.Rows.Count > 0 && UpdatDT.Rows.Count == 0)
                {
                    Sqllist = subrsmbench.Upload_Txmway(PublicDT);
                }
                if (Sqllist.Count > 0)
                {
                    mssqlh.ExecuteSqlTran(Sqllist);
                } 
            }
            catch (Exception ex)
            {
                MessageBox.Show("操作失败！\n" + ex.Message, "提示", MessageBoxButtons.OK, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);
            }
        }

    }
}
