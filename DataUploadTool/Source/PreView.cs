using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace GenyDataUploadTool
{
    public partial class PreView : Form
    {
        public PreView()
        {
            InitializeComponent();
        }
        OracleHelper och = new OracleHelper();
        MySqlHelper mysqlh = new MySqlHelper();
        private string APP_NO;
        public string app_no
        {
            set { APP_NO = value; }
        }
        private bool HaiYi = false;
        public bool haiyi
        {
            set { HaiYi = value; }
        }
        private bool NanR = false;
        public bool nanr
        {
            set { NanR = value; }
        }
        private void btnSearch_Click(object sender, EventArgs e)
        {
            string Tmpstr = string.Empty;
            DataSet ds;
            if (txtApp_No.Text != "")
            {
                switch (cbochioce.Text)
                {
                    case "工作单编号":
                        Tmpstr = "select * from geny_main where MeterID=" + txtApp_No.Text;
                        break;
                    case "资产编号":
                        Tmpstr = "select * from geny_main where SerialNo='" + txtApp_No.Text + "'";
                        break;
                    case "检定日期":
                        Tmpstr = "select * from geny_main where Testdate='" + txtApp_No.Text + "'";
                        break;
                    case "检定员":
                        Tmpstr = "select * from geny_main where Tester='" + txtApp_No.Text + "'";
                        break;
                    case "送检单位":
                        Tmpstr = "select * from geny_main where TestUnit='" + txtApp_No.Text + "'";
                        break;
                }

                ds = mysqlh.GetDataSet(Tmpstr);
                dgRSLT.DataSource = ds.Tables[0];
                if (ds.Tables[0].Rows.Count > 0)
                {
                    if (dgRSLT.Rows.Count > 0)
                    {
                        show_Forebay(dgRSLT["MeterID", 0].Value.ToString());
                    }
                }
                else
                {
                    MessageBox.Show("可显示的数据为0", "温馨提示", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
            }
            else
            {
                MessageBox.Show("工单号不能为空，请重新选择好工单后再查询！", "错误提示", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void dgRSLT_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dgRSLT.Rows.Count > 0 && e.RowIndex > 0)
            {
                show_Forebay(dgRSLT["MeterID", e.RowIndex].Value.ToString());
            }
        }

        private void showDetail(string barcode)
        {
            string Tmpstr = string.Empty;

            if (HaiYi == false)
            {
                //表C.1　外观检查结论 MM_INTUIT_MET_CONC
                Tmpstr = "select * from MM_INTUIT_MET_CONC  where   ASSET_NO='" + barcode + "'";
                dataGridView1.DataSource = och.getDataSetBySql(Tmpstr).Tables[0];
                //表C.2　基本误差 MM_BASICERR_MET_CONC
                Tmpstr = "select * from MM_BASICERR_MET_CONC  where    ASSET_NO='" + barcode + "'";
                dataGridView2.DataSource = och.getDataSetBySql(Tmpstr).Tables[0];
                //表C.3　电能表常数试验 MM_CONST_MET_CONC
                Tmpstr = "select * from MM_CONST_MET_CONC   where    ASSET_NO='" + barcode + "'";
                dataGridView3.DataSource = och.getDataSetBySql(Tmpstr).Tables[0];
                //表C.4　起动试验 MM_STARTING_MET_CONC
                Tmpstr = "select * from MM_STARTING_MET_CONC    where   ASSET_NO='" + barcode + "'";
                dataGridView4.DataSource = och.getDataSetBySql(Tmpstr).Tables[0];
                //表C.5　潜动试验 MM_CREEPING_MET_CONC
                Tmpstr = "select * from MM_CREEPING_MET_CONC     where    ASSET_NO='" + barcode + "'";
                dataGridView5.DataSource = och.getDataSetBySql(Tmpstr).Tables[0];
                //表C.6　计度器总电能示值组合误差MM_HUTCHISON_COMBINA_MET_CONC
                Tmpstr = "select * from MM_HUTCHISON_COMBINA_MET_CONC      where    ASSET_NO='" + barcode + "'";
                dataGridView6.DataSource = och.getDataSetBySql(Tmpstr).Tables[0];
                //表C.7　日计时误差 MM_DAYERR_MET_CONC
                Tmpstr = "select * from MM_DAYERR_MET_CONC       where    ASSET_NO='" + barcode + "'";
                dataGridView7.DataSource = och.getDataSetBySql(Tmpstr).Tables[0];
                //表C.10　载波通信性能试验 MM_WAVE_MET_CONC
                Tmpstr = "select * from MM_WAVE_MET_CONC        where    ASSET_NO='" + barcode + "'";
                dataGridView8.DataSource = och.getDataSetBySql(Tmpstr).Tables[0];
                //表C.11　误差变差试验 MM_ERROR_MET_CONC
                Tmpstr = "select * from MM_ERROR_MET_CONC         where    ASSET_NO='" + barcode + "'";
                dataGridView9.DataSource = och.getDataSetBySql(Tmpstr).Tables[0];
                //表C.12　误差一致性试验 MM_CONSIST_MET_CONC
                Tmpstr = "select * from MM_CONSIST_MET_CONC          where    ASSET_NO='" + barcode + "'";
                dataGridView10.DataSource = och.getDataSetBySql(Tmpstr).Tables[0];
                //表C.13　负载电流升降变差试验 MM_VARIATION_MET_CONC
                Tmpstr = "select * from MM_VARIATION_MET_CONC           where    ASSET_NO='" + barcode + "'";
                dataGridView11.DataSource = och.getDataSetBySql(Tmpstr).Tables[0];
                //表C.15　时段投切误差 MM_TS_MET_CONC
                Tmpstr = "select * from MM_TS_MET_CONC            where    ASSET_NO='" + barcode + "'";
                dataGridView12.DataSource = och.getDataSetBySql(Tmpstr).Tables[0];
                //表C.14　密钥更新试验MM_ESAM_MET_CONC
                Tmpstr = "select * from MM_ESAM_MET_CONC            where    ASSET_NO='" + barcode + "'";
                dataGridView13.DataSource = och.getDataSetBySql(Tmpstr).Tables[0];
                //表C.19　剩余电量递减试验 MM_EQ_MET_CONC
                Tmpstr = "select * from MM_EQ_MET_CONC              where    ASSET_NO='" + barcode + "'";
                dataGridView14.DataSource = och.getDataSetBySql(Tmpstr).Tables[0];
                //表C.20　通讯测试 MM_COMMINICATE_MET_CONC
                Tmpstr = "select * from MM_COMMINICATE_MET_CONC               where    ASSET_NO='" + barcode + "'";
                dataGridView15.DataSource = och.getDataSetBySql(Tmpstr).Tables[0];
                //表C.23　交流耐压压试验 MM_VOLT_MET_CONC
                Tmpstr = "select * from MM_VOLT_MET_CONC                where    ASSET_NO='" + barcode + "'";
                dataGridView16.DataSource = och.getDataSetBySql(Tmpstr).Tables[0];

                Tmpstr = "select * from MT_POWER_FLAG_RECD                where    ASSET_NO='" + barcode + "'";
                dataGridView17.DataSource = och.getDataSetBySql(Tmpstr).Tables[0];
                //表C.27 费率和时段功能 MM_FEE_MET_CONC 
                Tmpstr = "select * from MM_FEE_MET_CONC                  where    ASSET_NO='" + barcode + "'";
                dataGridView18.DataSource = och.getDataSetBySql(Tmpstr).Tables[0];

                //表C.32　需量示值误差MM_DEMANDVALUE_MET_CONC
                Tmpstr = "select * from MM_MAX_DEMAND_ERR_MET_CONC                   where    ASSET_NO='" + barcode + "'";
                dataGridView20.DataSource = och.getDataSetBySql(Tmpstr).Tables[0];

                //表C.28　费控试验 MM_ESAM_READ_MET_CONC
                Tmpstr = "select * from MM_ESAM_READ_MET_CONC                    where    ASSET_NO='" + barcode + "'";
                dataGridView22.DataSource = och.getDataSetBySql(Tmpstr).Tables[0];
            }
            else
            {
                Tmpstr = "select * from meter_det_ero  where    ASSETS_NO='" + barcode + "' order by DIRECT,GROUP1 ";
                dataGridView1.DataSource = och.getDataSetBySql(Tmpstr).Tables[0];

                Tmpstr = "select * from meter_det_multifunc    where    ASSETS_NO='" + barcode + "'";
                dataGridView2.DataSource = och.getDataSetBySql(Tmpstr).Tables[0];

                Tmpstr = "select * from meter_det_tq   where   ASSETS_NO='" + barcode + "'";
                dataGridView3.DataSource = och.getDataSetBySql(Tmpstr).Tables[0];

                Tmpstr = "select * from meter_det_xl     where    ASSETS_NO='" + barcode + "'";
                dataGridView4.DataSource = och.getDataSetBySql(Tmpstr).Tables[0];

                Tmpstr = "select * from meter_walk_rec  where    ASSETS_NO='" + barcode + "'";
                dataGridView5.DataSource = och.getDataSetBySql(Tmpstr).Tables[0];

                Tmpstr = "select * from METER_DET_NUM  where    ASSETS_NO='" + barcode + "'";
                dataGridView6.DataSource = och.getDataSetBySql(Tmpstr).Tables[0];
            }

        }
        private void show_Forebay(string Meterid)
        {
            string Tmpstr = string.Empty;
            //表C.2　基本误差 MM_BASICERR_MET_CONC
            Tmpstr = "select * from geny_error  where MeterID=" + Meterid + "  order by RangeNo,PointNo";
            dataGridView1.DataSource = mysqlh.GetDataSet(Tmpstr).Tables[0];
            //表C.3　电能表常数试验 MM_CONST_MET_CONC
            Tmpstr = "select * from geny_walktest  where MeterID=" + Meterid;
            dataGridView2.DataSource = mysqlh.GetDataSet(Tmpstr).Tables[0];
            //表C.4　起动试验 MM_STARTING_MET_CONC
            Tmpstr = "select * from geny_start  where MeterID=" + Meterid;
            dataGridView3.DataSource = mysqlh.GetDataSet(Tmpstr).Tables[0];
            //表C.5　潜动试验 MM_CREEPING_MET_CONC
            Tmpstr = "select * from geny_hide  where MeterID=" + Meterid;
            dataGridView4.DataSource = mysqlh.GetDataSet(Tmpstr).Tables[0];
            //表C.7　日计时误差 MM_DAYERR_MET_CONC
            Tmpstr = "select * from  geny_dayerr  where MeterID=" + Meterid;
            dataGridView5.DataSource = mysqlh.GetDataSet(Tmpstr).Tables[0];
            //表C.7　日计时误差 MM_DAYERR_MET_CONC
            Tmpstr = "select * from  geny_ErrRange  where MeterID=" + Meterid;
            dataGridView6.DataSource = mysqlh.GetDataSet(Tmpstr).Tables[0];
        }
        private void showDetail(string app_no, string barcode)
        {
            string Tmpstr = string.Empty;

            if (HaiYi == false)
            {
                //表C.1　外观检查结论 MM_INTUIT_MET_CONC
                Tmpstr = "select * from MT_INTUIT_MET_CONC  where DETECT_TASK_NO='" + app_no + "' and  ASSET_NO='" + barcode + "'";
                dataGridView1.DataSource = och.getDataSetBySql(Tmpstr).Tables[0];
                //表C.2　基本误差 MM_BASICERR_MET_CONC
                Tmpstr = "select * from MT_BASICERR_MET_CONC  where DETECT_TASK_NO='" + app_no + "' and  ASSET_NO='" + barcode + "'";
                dataGridView2.DataSource = och.getDataSetBySql(Tmpstr).Tables[0];
                //表C.3　电能表常数试验 MM_CONST_MET_CONC
                Tmpstr = "select * from MT_CONST_MET_CONC   where DETECT_TASK_NO='" + app_no + "' and  ASSET_NO='" + barcode + "'";
                dataGridView3.DataSource = och.getDataSetBySql(Tmpstr).Tables[0];
                //表C.4　起动试验 MM_STARTING_MET_CONC
                Tmpstr = "select * from MT_STARTING_MET_CONC    where DETECT_TASK_NO='" + app_no + "' and  ASSET_NO='" + barcode + "'";
                dataGridView4.DataSource = och.getDataSetBySql(Tmpstr).Tables[0];
                //表C.5　潜动试验 MM_CREEPING_MET_CONC
                Tmpstr = "select * from MT_CREEPING_MET_CONC     where DETECT_TASK_NO='" + app_no + "' and  ASSET_NO='" + barcode + "'";
                dataGridView5.DataSource = och.getDataSetBySql(Tmpstr).Tables[0];
                //表C.6　计度器总电能示值组合误差MM_HUTCHISON_COMBINA_MET_CONC
                Tmpstr = "select * from MT_HUTCHISON_COMBINA_MET_CONC      where DETECT_TASK_NO='" + app_no + "' and  ASSET_NO='" + barcode + "'";
                dataGridView6.DataSource = och.getDataSetBySql(Tmpstr).Tables[0];
                //表C.7　日计时误差 MM_DAYERR_MET_CONC
                Tmpstr = "select * from MT_DAYERR_MET_CONC       where DETECT_TASK_NO='" + app_no + "' and  ASSET_NO='" + barcode + "'";
                dataGridView7.DataSource = och.getDataSetBySql(Tmpstr).Tables[0];
                //表C.10　载波通信性能试验 MM_WAVE_MET_CONC
                Tmpstr = "select * from MT_WAVE_MET_CONC        where DETECT_TASK_NO='" + app_no + "' and  ASSET_NO='" + barcode + "'";
                dataGridView8.DataSource = och.getDataSetBySql(Tmpstr).Tables[0];
                //表C.11　误差变差试验 MM_ERROR_MET_CONC
                Tmpstr = "select * from MT_ERROR_MET_CONC         where DETECT_TASK_NO='" + app_no + "' and  ASSET_NO='" + barcode + "'";
                dataGridView9.DataSource = och.getDataSetBySql(Tmpstr).Tables[0];
                //表C.12　误差一致性试验 MM_CONSIST_MET_CONC
                Tmpstr = "select * from MT_CONSIST_MET_CONC          where DETECT_TASK_NO='" + app_no + "' and  ASSET_NO='" + barcode + "'";
                dataGridView10.DataSource = och.getDataSetBySql(Tmpstr).Tables[0];
                //表C.13　负载电流升降变差试验 MM_VARIATION_MET_CONC
                Tmpstr = "select * from MT_VARIATION_MET_CONC           where DETECT_TASK_NO='" + app_no + "' and  ASSET_NO='" + barcode + "'";
                dataGridView11.DataSource = och.getDataSetBySql(Tmpstr).Tables[0];
                //表C.15　时段投切误差 MM_TS_MET_CONC
                Tmpstr = "select * from MT_TS_MET_CONC            where DETECT_TASK_NO='" + app_no + "' and  ASSET_NO='" + barcode + "'";
                dataGridView12.DataSource = och.getDataSetBySql(Tmpstr).Tables[0];
                //表C.14　密钥更新试验MM_ESAM_MET_CONC
                Tmpstr = "select * from MT_ESAM_MET_CONC            where DETECT_TASK_NO='" + app_no + "' and  ASSET_NO='" + barcode + "'";
                dataGridView13.DataSource = och.getDataSetBySql(Tmpstr).Tables[0];
                //表C.19　剩余电量递减试验 MM_EQ_MET_CONC
                Tmpstr = "select * from MT_EQ_MET_CONC              where DETECT_TASK_NO='" + app_no + "' and  ASSET_NO='" + barcode + "'";
                dataGridView14.DataSource = och.getDataSetBySql(Tmpstr).Tables[0];
                //表C.20　通讯测试 MM_COMMINICATE_MET_CONC
                Tmpstr = "select * from MT_COMMINICATE_MET_CONC               where DETECT_TASK_NO='" + app_no + "' and  ASSET_NO='" + barcode + "'";
                dataGridView15.DataSource = och.getDataSetBySql(Tmpstr).Tables[0];
                //表C.23　零线 mt_lx_met_conc
                Tmpstr = "select * from mt_lx_met_conc                where DETECT_TASK_NO='" + app_no + "' and  ASSET_NO='" + barcode + "'";
                dataGridView16.DataSource = och.getDataSetBySql(Tmpstr).Tables[0];

                Tmpstr = "select * from MT_POWER_FLAG_RECD                where DETECT_TASK_NO='" + app_no + "' and  ASSET_NO='" + barcode + "'";
                dataGridView17.DataSource = och.getDataSetBySql(Tmpstr).Tables[0];

                //表C.27 费率和时段功能 MM_FEE_MET_CONC 
                Tmpstr = "select * from MT_FEE_MET_CONC                  where DETECT_TASK_NO='" + app_no + "' and  ASSET_NO='" + barcode + "'";
                dataGridView18.DataSource = och.getDataSetBySql(Tmpstr).Tables[0];

                //表C.32　需量示值误差MM_DEMANDVALUE_MET_CONC
                Tmpstr = "select * from MT_MAX_DEMAND_ERR_MET_CONC                   where DETECT_TASK_NO='" + app_no + "' and  ASSET_NO='" + barcode + "'";
                dataGridView20.DataSource = och.getDataSetBySql(Tmpstr).Tables[0];

                //表C.28　蓝牙试验 mt_ly_met_conc
                Tmpstr = "select * from mt_ly_met_conc                    where DETECT_TASK_NO='" + app_no + "' and  ASSET_NO='" + barcode + "'";
                dataGridView22.DataSource = och.getDataSetBySql(Tmpstr).Tables[0];
                //表C.28　蓝牙试验 mt_ly_met_conc
                Tmpstr = "select * from MT_COMMINICATE_MET_MODULE_CONC  where DETECT_TASK_NO='" + app_no + "' and  ASSET_NO='" + barcode + "'";
                dataGridView23.DataSource = och.getDataSetBySql(Tmpstr).Tables[0];
            }
            else
            {
                Tmpstr = "select * from meter_det_ero  where APP_NO='" + app_no + "'  and  ASSETS_NO='" + barcode + "' order by DIRECT,GROUP1 ";
                dataGridView1.DataSource = och.getDataSetBySql(Tmpstr).Tables[0];

                Tmpstr = "select * from meter_det_multifunc    where APP_NO='" + app_no + "'  and  ASSETS_NO='" + barcode + "'";
                dataGridView2.DataSource = och.getDataSetBySql(Tmpstr).Tables[0];

                Tmpstr = "select * from meter_det_tq   where APP_NO='" + app_no + "'  and  ASSETS_NO='" + barcode + "'";
                dataGridView3.DataSource = och.getDataSetBySql(Tmpstr).Tables[0];

                Tmpstr = "select * from meter_det_xl     where APP_NO='" + app_no + "'  and  ASSETS_NO='" + barcode + "'";
                dataGridView4.DataSource = och.getDataSetBySql(Tmpstr).Tables[0];

                Tmpstr = "select * from meter_walk_rec  where APP_NO='" + app_no + "'  and  ASSETS_NO='" + barcode + "'";
                dataGridView5.DataSource = och.getDataSetBySql(Tmpstr).Tables[0];

                Tmpstr = "select * from METER_DET_NUM  where APP_NO='" + app_no + "'  and  ASSETS_NO='" + barcode + "'";
                dataGridView6.DataSource = och.getDataSetBySql(Tmpstr).Tables[0];
            }

        }

        private void PreView_Load(object sender, EventArgs e)
        {
            txtApp_No.Text = APP_NO;

            tabControl1.TabPages[0].Text = "检定误差记录表";
            tabControl1.TabPages[1].Text = "校核常数";
            tabControl1.TabPages[2].Text = "起动试验";
            tabControl1.TabPages[3].Text = "潜动试验";
            tabControl1.TabPages[4].Text = "日计时误差";
            tabControl1.TabPages[5].Text = "误差量程";
            for (int i = 5; i < 22; i++)
            {
                //移除后续的标签
                tabControl1.TabPages.Remove(tabControl1.TabPages[6]);
            }

        }

        private void dgRSLT_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dgRSLT.Rows.Count > 0 && e.RowIndex > 0)
            {
                show_Forebay(dgRSLT["MeterID", e.RowIndex].Value.ToString());
            }
        }

        private void dataGridView1_RowPostPaint(object sender, DataGridViewRowPostPaintEventArgs e)
        {
            SolidBrush B = new SolidBrush(Color.Black);
            e.Graphics.DrawString(Convert.ToString(e.RowIndex + 1, System.Globalization.CultureInfo.CurrentUICulture), e.InheritedRowStyle.Font, B, e.RowBounds.Location.X + 10, e.RowBounds.Location.Y + 4);
        }

        private void dataGridView2_RowPostPaint(object sender, DataGridViewRowPostPaintEventArgs e)
        {
            SolidBrush B = new SolidBrush(Color.Black);
            e.Graphics.DrawString(Convert.ToString(e.RowIndex + 1, System.Globalization.CultureInfo.CurrentUICulture), e.InheritedRowStyle.Font, B, e.RowBounds.Location.X + 10, e.RowBounds.Location.Y + 4);
        }

        private void dgRSLT_RowPostPaint(object sender, DataGridViewRowPostPaintEventArgs e)
        {
            SolidBrush B = new SolidBrush(Color.Black);
            e.Graphics.DrawString(Convert.ToString(e.RowIndex + 1, System.Globalization.CultureInfo.CurrentUICulture), e.InheritedRowStyle.Font, B, e.RowBounds.Location.X + 10, e.RowBounds.Location.Y + 4);

        }

        private void dgRSLT_CellMouseDown(object sender, DataGridViewCellMouseEventArgs e)
        {
            if (dgRSLT.Rows.Count > 0 && e.RowIndex > 0)
            {
                show_Forebay(dgRSLT["MeterID", e.RowIndex].Value.ToString());
            }
        }

    }
}
