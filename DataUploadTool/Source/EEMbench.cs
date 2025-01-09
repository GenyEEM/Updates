using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;
using System.Data;
using System.Windows.Forms;
using Org.BouncyCastle.Utilities.Collections;

namespace GenyDataUploadTool
{
    class EEMbench
    {
        #region dbTestData 
        /// <summary>
        /// 上传批号信息
        /// </summary>
        /// <param name="Fun"></param>
        /// <returns></returns>
        public ArrayList Upload_tblBatch(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO tblBatch (BatchNumber, BatchTodayNumber, BatchName, TestDate, TestTime, Temp, Humidity, Tester, Retester, Manage, Voltage,[Current], CurrentMax, Frequency, BanchNO, ReferenceMeter, PassNumber, FailNumber, FailMaterNO, TotalNumber) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5},{6},{7},{8},{9},{10},{11},{12},{13},{14},{15},{16},{17},{18},{19})",
                    Fun.Rows[i]["BatchNumber"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["BatchNumber"].ToString() +"'",
                    Fun.Rows[i]["BatchTodayNumber"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["BatchTodayNumber"].ToString() +"'",
                    Fun.Rows[i]["BatchName"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["BatchName"], 
                    Fun.Rows[i]["TestDate"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TestDate"],
                    Fun.Rows[i]["TestTime"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TestTime"],   
                    Fun.Rows[i]["Temp"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Temp"].ToString() +"'",
                    Fun.Rows[i]["Humidity"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Humidity"].ToString() +"'",
                    Fun.Rows[i]["Tester"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Tester"].ToString() +"'",  
                    Fun.Rows[i]["Retester"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Retester"].ToString() +"'",  
                    Fun.Rows[i]["Manage"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Manage"].ToString() +"'",  
                    Fun.Rows[i]["Voltage"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Voltage"].ToString() +"'",
                    Fun.Rows[i]["Current"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Current"].ToString() +"'",
                    Fun.Rows[i]["CurrentMax"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CurrentMax"].ToString() +"'",
                    Fun.Rows[i]["Frequency"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Frequency"].ToString() +"'",
                    Fun.Rows[i]["BanchNO"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["BanchNO"].ToString() +"'",  
                    Fun.Rows[i]["ReferenceMeter"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ReferenceMeter"].ToString() +"'",  
                    Fun.Rows[i]["PassNumber"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["PassNumber"].ToString() +"'",
                    Fun.Rows[i]["FailNumber"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["FailNumber"].ToString() +"'",
                    Fun.Rows[i]["FailMaterNO"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["FailMaterNO"].ToString() +"'",  
                    Fun.Rows[i]["TotalNumber"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TotalNumber"].ToString() +"'"
                );
                al.Add(sb.ToString());
                sb.Clear();
            }

            return al;
        }
        /// <summary>
        /// 谐波数据
        /// </summary>
        /// <param name="Fun"></param>
        /// <returns></returns>
        public ArrayList Upload_dbTDtblHarmonic(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO [dbo].[dbTDtblHarmonic] ([MeterID], [MeasureDegreeID], [TestItemID], [Frequency], [Voltage], [VoltageAngle], [Current], [CurrentAngle]) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5},{6},{7})",
                    Fun.Rows[i]["MeterID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeterID"].ToString() +"'",
                    Fun.Rows[i]["MeasureDegreeID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeasureDegreeID"].ToString() +"'",
                    Fun.Rows[i]["TestItemID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TestItemID"].ToString() +"'",
                    Fun.Rows[i]["Frequency"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Frequency"].ToString() +"'",
                    Fun.Rows[i]["Voltage"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Voltage"].ToString() +"'",
                    Fun.Rows[i]["VoltageAngle"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["VoltageAngle"].ToString() +"'",
                    Fun.Rows[i]["Current"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Current"].ToString() +"'",
                    Fun.Rows[i]["CurrentAngle"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CurrentAngle"].ToString() +"'");
                al.Add(sb.ToString());
                sb.Clear();
            }
            return al;
        }

        /// <summary>
        /// 校验量程
        /// </summary>
        /// <param name="Fun"></param>
        /// <returns></returns> 
        public ArrayList Upload_tblMeasureDegree(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();

            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO tblMeasureDegree (MeterID, MeasureDegreeID, MeasureName, ListNo, Voltage, [Current], CurrentMax, ConnectMode) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5},{6},{7})", 
                    Fun.Rows[i]["MeterID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeterID"].ToString() +"'",
                    Fun.Rows[i]["MeasureDegreeID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeasureDegreeID"].ToString() +"'",
                    Fun.Rows[i]["MeasureName"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeasureName"].ToString() +"'",
                    Fun.Rows[i]["ListNo"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ListNo"].ToString() +"'", 
                    Fun.Rows[i]["Voltage"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Voltage"].ToString() +"'",
                    Fun.Rows[i]["Current"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Current"].ToString() +"'",
                    Fun.Rows[i]["CurrentMax"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CurrentMax"].ToString() +"'", 
                    Fun.Rows[i]["ConnectMode"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ConnectMode"].ToString() +"'"); 
                al.Add(sb.ToString());
                sb.Clear();
            } 
            return al;
        }

    /// <summary>
    /// 挂表信息
    /// </summary>
    /// <param name="Fun"></param>
    /// <returns></returns> 
    public ArrayList Upload_dbTDtblMeter(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO dbTDtblMeter (MeterID, BatchNumber, Nest, EquitmentNumber, MeterNo, AssetNo, BarCode, MeterAddress, TestDate, Temp, Humidity, Tester, Retester, Manage, TestUnit, Conclusion, MeterType, MeterName, Type, SwitchOnMode, Detent, ReferenceMeterType, Class, Class1, Connection, Voltage, [Current],CurrentMax, Frequency, Constant, ConstantUnit, ConstantReactive, ConstantUnitReactive, Manufactory, ProduceStandard, EffectiveDate, MeterSortNumber, Net) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5},{6},{7},{8},{9},{10},{11},{12},{13},{14},{15},{16},{17},{18},{19},{20},{21},{22},{23},{24},{25}, {26},{27},{28},{29},{30},{31},{32},{33},{34},{35},{36},{37})",
                    Fun.Rows[i]["MeterID"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["MeterID"].ToString() + "'",
                    Fun.Rows[i]["BatchNumber"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["BatchNumber"].ToString() + "'",
                    Fun.Rows[i]["Nest"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["Nest"].ToString() + "'",
                    Fun.Rows[i]["EquitmentNumber"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["EquitmentNumber"].ToString() + "'",
                    Fun.Rows[i]["MeterNo"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["MeterNo"].ToString() + "'",
                    Fun.Rows[i]["AssetNo"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["AssetNo"].ToString() + "'",
                    Fun.Rows[i]["BarCode"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["BarCode"].ToString() + "'",
                    Fun.Rows[i]["MeterAddress"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["MeterAddress"].ToString() + "'",
                    Fun.Rows[i]["TestDate"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["TestDate"].ToString() + "'",
                    Fun.Rows[i]["Temp"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["Temp"].ToString() + "'",
                    Fun.Rows[i]["Humidity"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["Humidity"].ToString() + "'",
                    Fun.Rows[i]["Tester"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["Tester"].ToString() + "'",
                    Fun.Rows[i]["Retester"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["Retester"].ToString() + "'",
                    Fun.Rows[i]["Manage"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["Manage"].ToString() + "'",
                    Fun.Rows[i]["TestUnit"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["TestUnit"].ToString() + "'",
                    Fun.Rows[i]["Conclusion"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["Conclusion"].ToString() + "'",
                    Fun.Rows[i]["MeterType"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["MeterType"].ToString() + "'",
                    Fun.Rows[i]["MeterName"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["MeterName"].ToString() + "'",
                    Fun.Rows[i]["Type"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["Type"].ToString() + "'",
                    Fun.Rows[i]["SwitchOnMode"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["SwitchOnMode"].ToString() + "'",
                    Fun.Rows[i]["Detent"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["Detent"].ToString() + "'",
                    Fun.Rows[i]["ReferenceMeterType"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["ReferenceMeterType"].ToString() + "'",
                    Fun.Rows[i]["Class"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["Class"].ToString() + "'",
                    Fun.Rows[i]["Class1"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["Class1"].ToString() + "'",
                    Fun.Rows[i]["Connection"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["Connection"].ToString() + "'",
                    Fun.Rows[i]["Voltage"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["Voltage"].ToString() + "'",
                    Fun.Rows[i]["Current"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["Current"].ToString() + "'",
                    Fun.Rows[i]["CurrentMax"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["CurrentMax"].ToString() + "'",
                    Fun.Rows[i]["Frequency"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["Frequency"].ToString() + "'",
                    Fun.Rows[i]["Constant"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["Constant"].ToString() + "'",
                    Fun.Rows[i]["ConstantUnit"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["ConstantUnit"].ToString() + "'",
                    Fun.Rows[i]["ConstantReactive"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["ConstantReactive"].ToString() + "'",
                    Fun.Rows[i]["ConstantUnitReactive"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["ConstantUnitReactive"].ToString() + "'",
                    Fun.Rows[i]["Manufactory"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["Manufactory"].ToString() + "'",
                    Fun.Rows[i]["ProduceStandard"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["ProduceStandard"].ToString() + "'",
                    Fun.Rows[i]["EffectiveDate"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["EffectiveDate"].ToString() + "'",
                    Fun.Rows[i]["MeterSortNumber"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["MeterSortNumber"].ToString() + "'",
                    Fun.Rows[i]["Net"] == DBNull.Value ? "NULL" :(bool)Fun.Rows[i]["Net"] ? "1" : "0");

                al.Add(sb.ToString());
                sb.Clear();
            }

            return al;
        }

        /// <summary>
        /// 校验项数据
        /// </summary>
        /// <param name="Fun"></param>
        /// <returns></returns>
        public ArrayList Upload_tblTestItem(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO [dbo].[tblTestItem] ([MeterID], [MeasureDegreeID], [TestItemID], [ListNo], [TestItemName], [CheckType], [CheckAffect], [CheckValue], [CheckValue1], [CheckValue2], [CheckValue3], [CheckValue4]) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5},{6},{7},{8},{9},{10},{11})",
                     Fun.Rows[i]["MeterID"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["MeterID"].ToString() + "'",
                     Fun.Rows[i]["MeasureDegreeID"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["MeasureDegreeID"].ToString() + "'",
                     Fun.Rows[i]["TestItemID"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["TestItemID"].ToString() + "'",
                     Fun.Rows[i]["ListNo"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["MeterID"].ToString() + "'",
                     Fun.Rows[i]["TestItemName"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["TestItemName"].ToString() + "'",
                     Fun.Rows[i]["CheckType"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["CheckType"].ToString() + "'",
                     Fun.Rows[i]["CheckAffect"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["CheckAffect"].ToString() + "'",
                     Fun.Rows[i]["CheckValue"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["CheckValue"].ToString() + "'",
                     Fun.Rows[i]["CheckValue1"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["CheckValue1"].ToString() + "'",
                     Fun.Rows[i]["CheckValue2"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["CheckValue2"].ToString() + "'",
                     Fun.Rows[i]["CheckValue3"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["CheckValue3"].ToString() + "'",
                     Fun.Rows[i]["CheckValue4"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["CheckValue4"].ToString() + "'");
                al.Add(sb.ToString());
                sb.Clear();
            }
            return al;
        }

        /// <summary>
        /// 基本误差试验
        /// </summary>
        /// <param name="Fun"></param>
        /// <returns></returns>
        public ArrayList Upload_dbTDtblTestResult00(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();

            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO dbTDtblTestResult00 (MeterID, MeasureDegreeID, TestItemID, TestPointName, ListNo, Phase, VoltagePercent, CurrentPercent, PowerFoctor, Cycle, SampleCount, TestTime, Time, TopErr, BotErr, StandardErr, IsStandardTest, ErrData, AveData, Error, Conclusion, StandardError, StandardConclusion) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5},{6},{7},{8},{9},{10},{11},{12},{13},{14},{15},{16},{17},{18},{19},{20},{21},{22})",
                    Fun.Rows[i]["MeterID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeterID"].ToString() +"'",
                    Fun.Rows[i]["MeasureDegreeID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeasureDegreeID"].ToString() +"'",
                    Fun.Rows[i]["TestItemID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TestItemID"].ToString() +"'",
                    Fun.Rows[i]["TestPointName"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TestPointName"].ToString() +"'", 
                    Fun.Rows[i]["ListNo"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ListNo"].ToString() +"'",
                    Fun.Rows[i]["Phase"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Phase"].ToString() +"'",
                    Fun.Rows[i]["VoltagePercent"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["VoltagePercent"].ToString() +"'",
                    Fun.Rows[i]["CurrentPercent"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CurrentPercent"].ToString() +"'",
                    Fun.Rows[i]["PowerFoctor"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["PowerFoctor"].ToString() +"'",
                    Fun.Rows[i]["Cycle"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Cycle"].ToString() +"'",
                    Fun.Rows[i]["SampleCount"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["SampleCount"].ToString() +"'",
                    Fun.Rows[i]["TestTime"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TestTime"].ToString() +"'",
                    Fun.Rows[i]["Time"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Time"].ToString() +"'",
                    Fun.Rows[i]["TopErr"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TopErr"].ToString() +"'",
                    Fun.Rows[i]["BotErr"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["BotErr"].ToString() +"'",
                    Fun.Rows[i]["StandardErr"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["StandardErr"].ToString() +"'",
                    Fun.Rows[i]["IsStandardTest"] == DBNull.Value ? "0" : (Fun.Rows[i]["IsStandardTest"].ToString()  == "True" || Fun.Rows[i]["IsStandardTest"].ToString().ToLower() == "1" ? "1" : "0"),
                    Fun.Rows[i]["ErrData"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ErrData"].ToString() +"'",  
                    Fun.Rows[i]["AveData"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["AveData"].ToString() +"'", 
                    Fun.Rows[i]["Error"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Error"].ToString() +"'",  
                    Fun.Rows[i]["Conclusion"] == DBNull.Value ? "0" : (Fun.Rows[i]["Conclusion"].ToString()  == "True" || Fun.Rows[i]["Conclusion"].ToString().ToLower() == "1" ? "1" : "0"),
                    Fun.Rows[i]["StandardError"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["StandardError"].ToString() +"'",  
                    Fun.Rows[i]["StandardConclusion"] == DBNull.Value ? "0" : (Fun.Rows[i]["StandardConclusion"].ToString()  == "True" || Fun.Rows[i]["StandardConclusion"].ToString().ToLower() == "1" ? "1" : "0"));

                al.Add(sb.ToString());
                sb.Clear();
            }
            return al;
        }

        /// <summary>
        /// 起动试验
        /// </summary>
        /// <param name="Fun"></param>
        /// <returns></returns>
        public ArrayList Upload_dbTDtblTestResult01(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder(); 
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO dbTDtblTestResult01 (MeterID, MeasureDegreeID, TestItemID, ListNo, Voltagepercent, Currentpercent, StartAllTime, StartRuntime, Conclusion) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5},{6},{7},{8})",
                    Fun.Rows[i]["MeterID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeterID"].ToString() +"'",
                    Fun.Rows[i]["MeasureDegreeID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeasureDegreeID"].ToString() +"'",
                    Fun.Rows[i]["TestItemID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TestItemID"].ToString() +"'",
                    Fun.Rows[i]["ListNo"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ListNo"].ToString() +"'",
                    Fun.Rows[i]["Voltagepercent"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Voltagepercent"].ToString() +"'",
                    Fun.Rows[i]["Currentpercent"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Currentpercent"].ToString() +"'",
                    Fun.Rows[i]["StartAllTime"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["StartAllTime"].ToString() +"'",
                    Fun.Rows[i]["StartRuntime"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["StartRuntime"].ToString() +"'",
                    Fun.Rows[i]["Conclusion"] == DBNull.Value ? "0" : (Fun.Rows[i]["Conclusion"].ToString()  == "True" || Fun.Rows[i]["Conclusion"].ToString().ToLower() == "1" ? "1" : "0")); 
                al.Add(sb.ToString());
                sb.Clear();
            }

            return al;
        }

        /// <summary>
        /// 潜动试验
        /// </summary>
        /// <param name="Fun"></param>
        /// <returns></returns>
        public ArrayList Upload_dbTDtblTestResult02(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();

            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO dbTDtblTestResult02 (MeterID, MeasureDegreeID, TestItemID, ListNo, Voltagepercent, Currentpercent, HideAllTime, HideRuntime, Conclusion) VALUES (");

                sb.AppendFormat("{0},{1},{2},{3},{4},{5},{6},{7},{8})",
                    Fun.Rows[i]["MeterID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeterID"].ToString() +"'",
                    Fun.Rows[i]["MeasureDegreeID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeasureDegreeID"].ToString() +"'",
                    Fun.Rows[i]["TestItemID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TestItemID"].ToString() +"'",
                    Fun.Rows[i]["ListNo"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ListNo"].ToString() +"'",
                    Fun.Rows[i]["Voltagepercent"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Voltagepercent"].ToString() +"'",
                    Fun.Rows[i]["Currentpercent"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Currentpercent"].ToString() +"'",
                    Fun.Rows[i]["HideAllTime"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["HideAllTime"].ToString() +"'", 
                    Fun.Rows[i]["HideRuntime"] == DBNull.Value ? "NULL" :"'"+  Fun.Rows[i]["HideRuntime"].ToString() +"'", 
                    Fun.Rows[i]["Conclusion"] == DBNull.Value ? "0" : (bool)Fun.Rows[i]["Conclusion"] ? "1" : "0");

                al.Add(sb.ToString());
                sb.Clear();
            }

            return al;
        }

        /// <summary>
        /// 校核常数
        /// </summary>
        /// <param name="Fun"></param>
        /// <returns></returns>
        public ArrayList Upload_dbTDtblTestResult03(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();

            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO dbTDtblTestResult03 (MeterID, MeasureDegreeID, TestItemID, ListNo, CTtime, VoltagePercent, CurrentPercent, Constant, StartDeg, EndDeg, ZZDeg, LLDeg, CTerr, Conclusion) VALUES (");
 
                sb.AppendFormat("{0},{1},{2},{3},{4},{5},{6},{7},{8},{9},{10},{11},{12},{13})",
                    Fun.Rows[i]["MeterID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeterID"].ToString() +"'",
                    Fun.Rows[i]["MeasureDegreeID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeasureDegreeID"].ToString() +"'",
                    Fun.Rows[i]["TestItemID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TestItemID"].ToString() +"'",
                    Fun.Rows[i]["ListNo"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ListNo"].ToString() +"'",
                    Fun.Rows[i]["CTtime"] == DBNull.Value ? "NULL" :"'" + Fun.Rows[i]["CTtime"].ToString() +"'", 
                    Fun.Rows[i]["VoltagePercent"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["VoltagePercent"].ToString() +"'",  
                    Fun.Rows[i]["CurrentPercent"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CurrentPercent"].ToString() +"'",
                    Fun.Rows[i]["Constant"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Constant"].ToString() +"'",
                    Fun.Rows[i]["StartDeg"] == DBNull.Value ? "NULL" :"'" + Fun.Rows[i]["StartDeg"].ToString() +"'",  
                    Fun.Rows[i]["EndDeg"] == DBNull.Value ? "NULL" :"'" + Fun.Rows[i]["EndDeg"].ToString() +"'", 
                    Fun.Rows[i]["ZZDeg"] == DBNull.Value ? "NULL" :"'" + Fun.Rows[i]["ZZDeg"].ToString() +"'",  
                    Fun.Rows[i]["LLDeg"] == DBNull.Value ? "NULL" :"'" + Fun.Rows[i]["LLDeg"].ToString() +"'",  
                    Fun.Rows[i]["CTerr"] == DBNull.Value ? "NULL" :"'" + Fun.Rows[i]["CTerr"].ToString() +"'",  
                    Fun.Rows[i]["Conclusion"] == DBNull.Value ? "NULL" :(Fun.Rows[i]["Conclusion"].ToString()  == "True" || Fun.Rows[i]["Conclusion"].ToString().ToLower() == "1" ? "1" : "0"));

                al.Add(sb.ToString());
                sb.Clear();
            }

            return al;
        }

        /// <summary>
        /// 计度组合试验
        /// </summary>
        /// <param name="Fun"></param>
        /// <returns></returns>
        public ArrayList Upload_dbTDtblTestResult05(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO dbTDtblTestResult05 (MeterID, MeasureDegreeID, TestItemID, ListNo, TotalPower, JianFengPower, FengPower, PingPower, GuPower, Conclusion) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5},{6},{7},{8},{9})",
                    Fun.Rows[i]["MeterID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeterID"].ToString() +"'",
                    Fun.Rows[i]["MeasureDegreeID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeasureDegreeID"].ToString() +"'",
                    Fun.Rows[i]["TestItemID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TestItemID"].ToString() +"'",
                    Fun.Rows[i]["ListNo"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ListNo"].ToString() +"'",
                    Fun.Rows[i]["TotalPower"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TotalPower"].ToString() +"'",
                    Fun.Rows[i]["JianFengPower"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["JianFengPower"].ToString() +"'",
                    Fun.Rows[i]["FengPower"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["FengPower"].ToString() +"'",
                    Fun.Rows[i]["PingPower"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["PingPower"].ToString() +"'",
                    Fun.Rows[i]["GuPower"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["GuPower"].ToString() +"'",
                    Fun.Rows[i]["Conclusion"] == DBNull.Value ? "NULL" : (Fun.Rows[i]["Conclusion"].ToString()  == "True" || Fun.Rows[i]["Conclusion"].ToString().ToLower() == "1" ? "1" : "0"));
                al.Add(sb.ToString());
                sb.Clear();
            }

            return al;
        }

        /// <summary>
        /// 日计时
        /// </summary>
        /// <param name="Fun"></param>
        /// <returns></returns>
        public ArrayList Upload_dbTDtblTestResult06(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO dbTDtblTestResult06 (MeterID, MeasureDegreeID, TestItemID, ListNo, TimeFrequency, SampleTime, SampleCount, ErrData, RJSerr, Conclusion) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5},{6},{7},{8},{9})",
                    Fun.Rows[i]["MeterID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeterID"].ToString() +"'",
                    Fun.Rows[i]["MeasureDegreeID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeasureDegreeID"].ToString() +"'",
                    Fun.Rows[i]["TestItemID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TestItemID"].ToString() +"'",
                    Fun.Rows[i]["ListNo"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ListNo"].ToString() +"'",
                    Fun.Rows[i]["TimeFrequency"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TimeFrequency"].ToString() +"'",
                    Fun.Rows[i]["SampleTime"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["SampleTime"].ToString() +"'",
                    Fun.Rows[i]["SampleCount"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["SampleCount"].ToString() +"'",
                    Fun.Rows[i]["ErrData"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ErrData"].ToString() +"'", 
                    Fun.Rows[i]["RJSerr"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["RJSerr"].ToString() +"'",
                    Fun.Rows[i]["Conclusion"] == DBNull.Value ? "NULL" : (Fun.Rows[i]["Conclusion"].ToString()  == "True" || Fun.Rows[i]["Conclusion"].ToString().ToLower() == "1" ? "1" : "0"));
                al.Add(sb.ToString());
                sb.Clear();
            }

            return al;
        }

        /// <summary>
        /// 时段投切
        /// </summary>
        /// <param name="Fun"></param>
        /// <returns></returns>
        public ArrayList Upload_dbTDtblTestResult07(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO dbTDtblTestResult07 (MeterID, MeasureDegreeID, TestItemID, ListNo, JianFengConclusion, FengConclusion, PingConclusion, GuConclusion, Conclusion) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5},{6},{7},{8})",
                    Fun.Rows[i]["MeterID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeterID"].ToString() +"'",
                    Fun.Rows[i]["MeasureDegreeID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeasureDegreeID"].ToString() +"'",
                    Fun.Rows[i]["TestItemID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TestItemID"].ToString() +"'",
                    Fun.Rows[i]["ListNo"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ListNo"].ToString() +"'",
                    Fun.Rows[i]["JianFengConclusion"] == DBNull.Value ? "NULL" : (Fun.Rows[i]["JianFengConclusion"].ToString()  == "True" || Fun.Rows[i]["JianFengConclusion"].ToString().ToLower() == "1" ? "1" : "0"),
                    Fun.Rows[i]["FengConclusion"] == DBNull.Value ? "NULL" : (Fun.Rows[i]["FengConclusion"].ToString()  == "True" || Fun.Rows[i]["FengConclusion"].ToString().ToLower() == "1" ? "1" : "0"),
                    Fun.Rows[i]["PingConclusion"] == DBNull.Value ? "NULL" :(Fun.Rows[i]["PingConclusion"].ToString()  == "True" || Fun.Rows[i]["PingConclusion"].ToString().ToLower() == "1" ? "1" : "0"),
                    Fun.Rows[i]["GuConclusion"] == DBNull.Value ? "NULL" :(Fun.Rows[i]["GuConclusion"].ToString()  == "True" || Fun.Rows[i]["GuConclusion"].ToString().ToLower() == "1" ? "1" : "0"),
                    Fun.Rows[i]["Conclusion"] == DBNull.Value ? "NULL" :(Fun.Rows[i]["Conclusion"].ToString()  == "True" || Fun.Rows[i]["Conclusion"].ToString().ToLower() == "1" ? "1" : "0"));
                al.Add(sb.ToString());
                sb.Clear();
            }

            return al;
        }

        /// <summary>
        /// 需量试验
        /// </summary>
        /// <param name="Fun"></param>
        /// <returns></returns>
        public ArrayList Upload_dbTDtblTestResult08(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO dbTDtblTestResult08 (MeterID, MeasureDegreeID, TestItemID, ListNo, TestPointName, Phase, VoltagePercent, CurrentPercent, PowerFoctor, XLTime, XLMax, XLErr, STXLMax, Conclusion) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5},{6},{7},{8},{9},{10},{11},{12},{13})",
                    Fun.Rows[i]["MeterID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeterID"].ToString() +"'",
                    Fun.Rows[i]["MeasureDegreeID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeasureDegreeID"].ToString() +"'",
                    Fun.Rows[i]["TestItemID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TestItemID"].ToString() +"'",
                    Fun.Rows[i]["ListNo"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ListNo"].ToString() +"'",
                    Fun.Rows[i]["TestPointName"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TestPointName"].ToString() +"'",
                    Fun.Rows[i]["Phase"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Phase"].ToString() +"'",
                    Fun.Rows[i]["VoltagePercent"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["VoltagePercent"].ToString() +"'",
                    Fun.Rows[i]["CurrentPercent"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CurrentPercent"].ToString() +"'",
                    Fun.Rows[i]["PowerFoctor"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["PowerFoctor"].ToString() +"'",
                    Fun.Rows[i]["XLTime"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["XLTime"].ToString() +"'",
                    Fun.Rows[i]["XLMax"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["XLMax"].ToString() +"'",
                    Fun.Rows[i]["XLErr"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["XLErr"].ToString() +"'",
                    Fun.Rows[i]["STXLMax"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["STXLMax"].ToString() +"'",
                    Fun.Rows[i]["Conclusion"] == DBNull.Value ? "NULL" : (Fun.Rows[i]["Conclusion"].ToString()  == "True" || Fun.Rows[i]["Conclusion"].ToString().ToLower() == "1" ? "1" : "0"));
                al.Add(sb.ToString());
                sb.Clear();
            }

            return al;
        }

        /// <summary>
        /// 需量周期
        /// </summary>
        /// <param name="Fun"></param>
        /// <returns></returns>
        public ArrayList Upload_dbTDtblTestResult10(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO dbTDtblTestResult10 (MeterID, MeasureDegreeID, TestItemID, TestPointId, ListNo, ErrData, Conclusion) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5},{6})",
                    Fun.Rows[i]["MeterID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeterID"].ToString() +"'",
                    Fun.Rows[i]["MeasureDegreeID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeasureDegreeID"].ToString() +"'",
                    Fun.Rows[i]["TestItemID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TestItemID"].ToString() +"'",
                    Fun.Rows[i]["TestPointId"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TestPointId"].ToString() +"'",
                    Fun.Rows[i]["ListNo"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ListNo"].ToString() +"'",
                    Fun.Rows[i]["ErrData"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ErrData"].ToString() +"'",
                    Fun.Rows[i]["Conclusion"] == DBNull.Value ? "NULL" : (Fun.Rows[i]["Conclusion"].ToString()  == "True" || Fun.Rows[i]["Conclusion"].ToString().ToLower() == "1" ? "1" : "0"));
                al.Add(sb.ToString());
                sb.Clear();
            } 
            return al;
        }

        /// <summary>
        /// 记录器检查
        /// </summary>
        /// <param name="Fun"></param>
        /// <returns></returns>
        public ArrayList Upload_dbTDtblTestResult16(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO dbTDtblTestResult16 (MeterID, MeasureDegreeID, TestItemID, ListNo, PZPower, PZJFPower, PZFPower, PZPPower, PZGPower, QZPower, QZJFPower, QZFPower, QZPPower, QZGPower, PFPower, PFJFPower, PFFPower, PFPPower, PFGPower, QFPower, QFJFPower, QFFPower, QFPPower, QFGPower, Q1Power, Q1JFPower, Q1FPower, Q1PPower, Q1GPower, Q2Power, Q2JFPower, Q2FPower, Q2PPower, Q2GPower, Q3Power, Q3JFPower, Q3FPower, Q3PPower, Q3GPower, Q4Power, Q4JFPower, Q4FPower, Q4PPower, Q4GPower, Conclusion) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5},{6},{7},{8},{9},{10},{11},{12},{13},{14},{15},{16},{17},{18},{19},{20},{21},{22},{23},{24},{25},{26},{27},{28},{29},{30},{31},{32},{33},{34},{35},{36},{37},{38},{39},{40},{41},{42},{43},{44},{45},{46},{47})",
                    Fun.Rows[i]["MeterID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeterID"].ToString() +"'",
                    Fun.Rows[i]["MeasureDegreeID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeasureDegreeID"].ToString() +"'",
                    Fun.Rows[i]["TestItemID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TestItemID"].ToString() +"'",
                    Fun.Rows[i]["ListNo"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ListNo"].ToString() +"'",
                    Fun.Rows[i]["PZPower"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["PZPower"].ToString() +"'",
                    Fun.Rows[i]["PZJFPower"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["PZJFPower"].ToString() +"'",
                    Fun.Rows[i]["PZFPower"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["PZFPower"].ToString() +"'",
                    Fun.Rows[i]["PZPPower"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["PZPPower"].ToString() +"'",
                    Fun.Rows[i]["PZGPower"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["PZGPower"].ToString() +"'",
                    Fun.Rows[i]["QZPower"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["QZPower"].ToString() +"'",
                    Fun.Rows[i]["QZJFPower"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["QZJFPower"].ToString() +"'",
                    Fun.Rows[i]["QZFPower"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["QZFPower"].ToString() +"'",
                    Fun.Rows[i]["QZPPower"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["QZPPower"].ToString() +"'",
                    Fun.Rows[i]["QZGPower"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["QZGPower"].ToString() +"'",
                    Fun.Rows[i]["PFPower"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["PFPower"].ToString() +"'",
                    Fun.Rows[i]["PFJFPower"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["PFJFPower"].ToString() +"'",
                    Fun.Rows[i]["PFFPower"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["PFFPower"].ToString() +"'",
                    Fun.Rows[i]["PFPPower"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["PFPPower"].ToString() +"'",
                    Fun.Rows[i]["PFGPower"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["PFGPower"].ToString() +"'",
                    Fun.Rows[i]["QFPower"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["QFPower"].ToString() +"'",
                    Fun.Rows[i]["QFJFPower"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["QFJFPower"].ToString() +"'",
                    Fun.Rows[i]["QFFPower"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["QFFPower"].ToString() +"'",
                    Fun.Rows[i]["QFPPower"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["QFPPower"].ToString() +"'",
                    Fun.Rows[i]["QFGPower"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["QFGPower"].ToString() +"'",
                    Fun.Rows[i]["Q1Power"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Q1Power"].ToString() +"'",
                    Fun.Rows[i]["Q1JFPower"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Q1JFPower"].ToString() +"'",
                    Fun.Rows[i]["Q1FPower"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Q1FPower"].ToString() +"'",
                    Fun.Rows[i]["Q1PPower"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Q1PPower"].ToString() +"'",
                    Fun.Rows[i]["Q1GPower"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Q1GPower"].ToString() +"'",
                    Fun.Rows[i]["Q2Power"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Q2Power"].ToString() +"'",
                    Fun.Rows[i]["Q2JFPower"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Q2JFPower"].ToString() +"'",
                    Fun.Rows[i]["Q2FPower"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Q2FPower"].ToString() +"'",
                    Fun.Rows[i]["Q2PPower"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Q2PPower"].ToString() +"'",
                    Fun.Rows[i]["Q2GPower"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Q2GPower"].ToString() +"'",
                    Fun.Rows[i]["Q3Power"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Q3Power"].ToString() +"'",
                    Fun.Rows[i]["Q3JFPower"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Q3JFPower"].ToString() +"'",
                    Fun.Rows[i]["Q3FPower"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Q3FPower"].ToString() +"'",
                    Fun.Rows[i]["Q3PPower"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Q3PPower"].ToString() +"'",
                    Fun.Rows[i]["Q3GPower"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Q3GPower"].ToString() +"'",
                    Fun.Rows[i]["Q3Power"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Q3Power"].ToString() +"'",
                    Fun.Rows[i]["Q3JFPower"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Q3JFPower"].ToString() +"'",
                    Fun.Rows[i]["Q3FPower"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Q3FPower"].ToString() +"'",
                    Fun.Rows[i]["Q3PPower"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Q3PPower"].ToString() +"'",
                    Fun.Rows[i]["Q3GPower"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Q3GPower"].ToString() +"'",
                    Fun.Rows[i]["Q4Power"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Q4Power"].ToString() +"'",
                    Fun.Rows[i]["Q4JFPower"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Q4JFPower"].ToString() +"'",
                    Fun.Rows[i]["Q4FPower"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Q4FPower"].ToString() +"'",
                    Fun.Rows[i]["Q4PPower"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Q4PPower"].ToString() +"'",
                    Fun.Rows[i]["Q4GPower"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Q4GPower"].ToString() +"'",
                    Fun.Rows[i]["Conclusion"] == DBNull.Value ? "NULL" : (Fun.Rows[i]["Conclusion"].ToString()  == "True" || Fun.Rows[i]["Conclusion"].ToString().ToLower() == "1" ? "1" : "0"));
                al.Add(sb.ToString());
                sb.Clear();
            }
            return al;
        }

        #endregion


        #region SeleWay 

        public ArrayList Upload_MeterInfo(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO MeterInfo (cType, iAddressType, cAddressValue, cPassword, cCommSetting, iDemandCycle, iDemandStep, fDayFrequency, iDayDivideFre, cPeriodType, cPeriodSharp, cPeriodPeak, cPeriodPlane, cPeriodVale, iPulseMode, iReactiveMode, iPowerPoint) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5},{6},{7},{8},{9},{10},{11},{12},{13},{14},{15},{16})",
                    Fun.Rows[i]["cType"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cType"].ToString() +"'",
                    Fun.Rows[i]["iAddressType"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iAddressType"].ToString() +"'",
                    Fun.Rows[i]["cAddressValue"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cAddressValue"].ToString() +"'",
                    Fun.Rows[i]["cPassword"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cPassword"].ToString() +"'",
                    Fun.Rows[i]["cCommSetting"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cCommSetting"].ToString() +"'",
                    Fun.Rows[i]["iDemandCycle"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iDemandCycle"].ToString() +"'",
                    Fun.Rows[i]["iDemandStep"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iDemandStep"].ToString() +"'",
                    Fun.Rows[i]["fDayFrequency"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["fDayFrequency"].ToString() +"'",
                    Fun.Rows[i]["iDayDivideFre"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iDayDivideFre"].ToString() +"'",
                    Fun.Rows[i]["cPeriodType"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cPeriodType"].ToString() +"'",
                    Fun.Rows[i]["cPeriodSharp"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cPeriodSharp"].ToString() +"'",
                    Fun.Rows[i]["cPeriodPeak"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cPeriodPeak"].ToString() +"'",
                    Fun.Rows[i]["cPeriodPlane"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cPeriodPlane"].ToString() +"'",
                    Fun.Rows[i]["cPeriodVale"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cPeriodVale"].ToString() +"'",
                    Fun.Rows[i]["iPulseMode"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iPulseMode"].ToString() +"'",
                    Fun.Rows[i]["iReactiveMode"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iReactiveMode"].ToString() +"'",
                    Fun.Rows[i]["iPowerPoint"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iPowerPoint"].ToString() +"'");
                al.Add(sb.ToString());
                sb.Clear();
            }

            return al;
        }

        public ArrayList Upload_RuleAffectData(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();

            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO RuleAffectData (cWayName, iAffectNo, cAffectName, cRange, fVoltage, fCurrent, fFrequency, fAngleA, fAngleB, fAngleC, cABCVoltage, cABCCurrent, cLimit, cBCLimit, cLoadName, bFlagTest, iCompare, cXieBo, fLeanAngle, bReverse, iCircles) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5},{6},{7},{8},{9},{10},{11},{12},{13},{14},{15},{16},{17},{18},{19},{20})",
                Fun.Rows[i]["cWayName"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cWayName"].ToString() +"'",
                Fun.Rows[i]["iAffectNo"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iAffectNo"].ToString() +"'",
                Fun.Rows[i]["cAffectName"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cAffectName"].ToString() +"'",
                Fun.Rows[i]["cRange"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cRange"].ToString() +"'",
                Fun.Rows[i]["fVoltage"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["fVoltage"].ToString() +"'",
                Fun.Rows[i]["fCurrent"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["fCurrent"].ToString() +"'",
                Fun.Rows[i]["fFrequency"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["fFrequency"].ToString() +"'",
                Fun.Rows[i]["fAngleA"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["fAngleA"].ToString() +"'",
                Fun.Rows[i]["fAngleB"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["fAngleB"].ToString() +"'",
                Fun.Rows[i]["fAngleC"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["fAngleC"].ToString() +"'",
                Fun.Rows[i]["cABCVoltage"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cABCVoltage"].ToString() +"'",
                Fun.Rows[i]["cABCCurrent"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cABCCurrent"].ToString() +"'",
                Fun.Rows[i]["cLimit"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cLimit"].ToString() +"'",
                Fun.Rows[i]["cBCLimit"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cBCLimit"].ToString() +"'",
                Fun.Rows[i]["cLoadName"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cLoadName"].ToString() +"'",
                Fun.Rows[i]["bFlagTest"] == DBNull.Value ? "0" : (Fun.Rows[i]["bFlagTest"].ToString()  == "True" || Fun.Rows[i]["bFlagTest"].ToString().ToLower() == "1" ? "1" : "0"),
                Fun.Rows[i]["iCompare"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iCompare"].ToString() +"'",
                Fun.Rows[i]["cXieBo"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cXieBo"].ToString() +"'",
                Fun.Rows[i]["fLeanAngle"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["fLeanAngle"].ToString() +"'",
                Fun.Rows[i]["bReverse"] == DBNull.Value ? "0" : (Fun.Rows[i]["bReverse"].ToString()  == "True" || Fun.Rows[i]["bReverse"].ToString().ToLower() == "1" ? "1" : "0"),
                Fun.Rows[i]["iCircles"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iCircles"].ToString() +"'");
                al.Add(sb.ToString());
                sb.Clear();
            } 
            return al;
        }

        public ArrayList Upload_RuleErrorData(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO RuleErrorData (cType, iNo, cPointName, cLimit) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3})",
                    Fun.Rows[i]["cType"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cType"].ToString() +"'",
                    Fun.Rows[i]["iNo"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iNo"].ToString() +"'",
                    Fun.Rows[i]["cPointName"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cPointName"].ToString() +"'",
                    Fun.Rows[i]["cLimit"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cLimit"].ToString() +"'");
                al.Add(sb.ToString());
                sb.Clear();
            }

            return al;
        }


        public ArrayList Upload_RuleWayData(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO RuleWayData (cWayName, cBaseRange, cTestMode, cInMode, cMeterType, cPrecision, cWayAdjust, cWayTest, cWayMultiFunction, cWaySpeacialTest, fWarmCurrent, fWarmTime, cStartRange, cStartCurrent, cStartCurrentP, cStartCurrentQ, iStartPulse, cStartTime, cStartTimeP, cStartTimeQ, cHideRange, cHideVoltage, iHideCurrent, iHideTimeMode, iHidePulse, cHideTime, cHideTimeP, cHideTimeQ, fErrorUpLimit, fErrorDownLimit, iErrorSmax, cErrorSmaxRange, iErrorIbCircle, iWalkMode, iWalkPara, iWalkAutoRead, cWalkRange, cPeriodType, iPeriodWalk, iDemandTestTime, iDemandTestCycle, iDayCircle, iDayTimes, fPeriodWalkE, iDemandTestEvent, fStdVoltage, fStdCurrent, fStdConstant, fStdFrequency, cType, cProtocal, cStopBack, cPrecisionQ, cFactory, cVoltageLimit, cCurrentLimit, iPulseMode) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5},{6},{7},{8},{9},{10},{11},{12},{13},{14},{15},{16},{17},{18},{19},{20},{21},{22},{23},{24},{25},{26},{27},{28},{29},{30},{31},{32},{33},{34},{35},{36},{37},{38},{39},{40},{41},{42},{43},{44},{45},{46},{47},{48},{49},{50},{51},{52},{53},{54',{55},{56})",
                    Fun.Rows[i]["cWayName"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cWayName"].ToString() +"'",
                    Fun.Rows[i]["cBaseRange"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cBaseRange"].ToString() +"'",
                    Fun.Rows[i]["cTestMode"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cTestMode"].ToString() +"'",
                    Fun.Rows[i]["cInMode"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cInMode"].ToString() +"'",
                    Fun.Rows[i]["cMeterType"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cMeterType"].ToString() +"'",
                    Fun.Rows[i]["cPrecision"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cPrecision"].ToString() +"'",
                    Fun.Rows[i]["cWayAdjust"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cWayAdjust"].ToString() +"'",
                    Fun.Rows[i]["cWayTest"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cWayTest"].ToString() +"'",
                    Fun.Rows[i]["cWayMultiFunction"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cWayMultiFunction"].ToString() +"'",
                    Fun.Rows[i]["cWaySpeacialTest"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cWaySpeacialTest"].ToString() +"'",
                    Fun.Rows[i]["fWarmCurrent"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["fWarmCurrent"].ToString() +"'",
                    Fun.Rows[i]["fWarmTime"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["fWarmTime"].ToString() +"'",
                    Fun.Rows[i]["cStartRange"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cStartRange"].ToString() +"'",
                    Fun.Rows[i]["cStartCurrent"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cStartCurrent"].ToString() +"'",
                    Fun.Rows[i]["cStartCurrentP"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cStartCurrentP"].ToString() +"'",
                    Fun.Rows[i]["cStartCurrentQ"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cStartCurrentQ"].ToString() +"'",
                    Fun.Rows[i]["iStartPulse"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iStartPulse"].ToString() +"'",
                    Fun.Rows[i]["cStartTime"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cStartTime"].ToString() +"'",
                    Fun.Rows[i]["cStartTimeP"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cStartTimeP"].ToString() +"'",
                    Fun.Rows[i]["cStartTimeQ"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cStartTimeQ"].ToString() +"'",
                    Fun.Rows[i]["cHideRange"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cHideRange"].ToString() +"'",
                    Fun.Rows[i]["cHideVoltage"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cHideVoltage"].ToString() +"'",
                    Fun.Rows[i]["iHideCurrent"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iHideCurrent"].ToString() +"'",
                    Fun.Rows[i]["iHideTimeMode"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iHideTimeMode"].ToString() +"'",
                    Fun.Rows[i]["iHidePulse"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iHidePulse"].ToString() +"'",
                    Fun.Rows[i]["cHideTime"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cHideTime"].ToString() +"'",
                    Fun.Rows[i]["cHideTimeP"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cHideTimeP"].ToString() +"'",
                    Fun.Rows[i]["cHideTimeQ"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cHideTimeQ"].ToString() +"'",
                    Fun.Rows[i]["fErrorUpLimit"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["fErrorUpLimit"].ToString() +"'",
                    Fun.Rows[i]["fErrorDownLimit"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["fErrorDownLimit"].ToString() +"'",
                    Fun.Rows[i]["iErrorSmax"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iErrorSmax"].ToString() +"'",
                    Fun.Rows[i]["cErrorSmaxRange"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cErrorSmaxRange"].ToString() +"'",
                    Fun.Rows[i]["iErrorIbCircle"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iErrorIbCircle"].ToString() +"'",
                    Fun.Rows[i]["iWalkMode"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iWalkMode"].ToString() +"'",
                    Fun.Rows[i]["iWalkPara"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iWalkPara"].ToString() +"'",
                    Fun.Rows[i]["iWalkAutoRead"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iWalkAutoRead"].ToString() +"'",
                    Fun.Rows[i]["cWalkRange"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cWalkRange"].ToString() +"'",
                    Fun.Rows[i]["cPeriodType"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cPeriodType"].ToString() +"'",
                    Fun.Rows[i]["iPeriodWalk"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iPeriodWalk"].ToString() +"'",
                    Fun.Rows[i]["iDemandTestTime"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iDemandTestTime"].ToString() +"'",
                    Fun.Rows[i]["iDemandTestCycle"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iDemandTestCycle"].ToString() +"'",
                    Fun.Rows[i]["iDayCircle"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iDayCircle"].ToString() +"'",
                    Fun.Rows[i]["iDayTimes"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iDayTimes"].ToString() +"'",
                    Fun.Rows[i]["fPeriodWalkE"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["fPeriodWalkE"].ToString() +"'",
                    Fun.Rows[i]["iDemandTestEvent"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iDemandTestEvent"].ToString() +"'",
                    Fun.Rows[i]["fStdVoltage"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["fStdVoltage"].ToString() +"'",
                    Fun.Rows[i]["fStdCurrent"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["fStdCurrent"].ToString() +"'",
                    Fun.Rows[i]["fStdConstant"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["fStdConstant"].ToString() +"'",
                    Fun.Rows[i]["fStdFrequency"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["fStdFrequency"].ToString() +"'",
                    Fun.Rows[i]["cType"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cType"].ToString() +"'",
                    Fun.Rows[i]["cProtocal"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cProtocal"].ToString() +"'",
                    Fun.Rows[i]["cStopBack"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cStopBack"].ToString() +"'",
                    Fun.Rows[i]["cPrecisionQ"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cPrecisionQ"].ToString() +"'",
                    Fun.Rows[i]["cFactory"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cFactory"].ToString() +"'",
                    Fun.Rows[i]["cVoltageLimit"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cVoltageLimit"].ToString() +"'",
                    Fun.Rows[i]["cCurrentLimit"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cCurrentLimit"].ToString() +"'",
                    Fun.Rows[i]["iPulseMode"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iPulseMode"].ToString() +"'");
                al.Add(sb.ToString());
                sb.Clear();
            }
            return al;
        }

        public ArrayList Upload_ScanCode(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO ScanCode (cType, cName, cCode, cNote) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3})",
                Fun.Rows[i]["cType"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cType"].ToString() +"'",
                Fun.Rows[i]["cName"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cName"].ToString() +"'",
                Fun.Rows[i]["cCode"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cCode"].ToString() +"'",
                Fun.Rows[i]["cNote"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cNote"].ToString() +"'");
                al.Add(sb.ToString());
                sb.Clear();
            }

            return al;
        }

        public ArrayList Upload_TestAffectData(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO TestAffectData (cWayName, iAffectNo, cAffectName, cRange, fVoltage, fCurrent, fFrequency, fAngleA, fAngleB, fAngleC, cABCVoltage, cABCCurrent, cLimit, cBCLimit, cLoadName, bFlagTest, iCompare, cXieBo, fLeanAngle, bReverse, iCircles, iTestTimes, ACur, BCur, CCur, AAgl, BAgl, CAgl) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5},{6},{7},{8},{9},{10},{11},{12},{13},{14},{15},{16},{17},{18},{19},{20},{21},{22},{23},{24},{25},{26},{27})",
                    Fun.Rows[i]["cWayName"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cWayName"].ToString() +"'",
                    Fun.Rows[i]["iAffectNo"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iAffectNo"].ToString() +"'",
                    Fun.Rows[i]["cAffectName"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cAffectName"].ToString() +"'",
                    Fun.Rows[i]["cRange"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cRange"].ToString() +"'",
                    Fun.Rows[i]["fVoltage"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["fVoltage"].ToString() +"'",
                    Fun.Rows[i]["fCurrent"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["fCurrent"].ToString() +"'",
                    Fun.Rows[i]["fFrequency"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["fFrequency"].ToString() +"'",
                    Fun.Rows[i]["fAngleA"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["fAngleA"].ToString() +"'",
                    Fun.Rows[i]["fAngleB"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["fAngleB"].ToString() +"'",
                    Fun.Rows[i]["fAngleC"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["fAngleC"].ToString() +"'",
                    Fun.Rows[i]["cABCVoltage"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cABCVoltage"].ToString() +"'",
                    Fun.Rows[i]["cABCCurrent"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cABCCurrent"].ToString() +"'",
                    Fun.Rows[i]["cLimit"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cLimit"].ToString() +"'",
                    Fun.Rows[i]["cBCLimit"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cBCLimit"].ToString() +"'",
                    Fun.Rows[i]["cLoadName"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cLoadName"].ToString() +"'",
                    Fun.Rows[i]["bFlagTest"] == DBNull.Value ? "0" : (Fun.Rows[i]["bFlagTest"].ToString()  == "True" || Fun.Rows[i]["bFlagTest"].ToString().ToLower() == "1" ? "1" : "0"),
                    Fun.Rows[i]["iCompare"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iCompare"].ToString() +"'",
                    Fun.Rows[i]["cXieBo"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cXieBo"].ToString() +"'",
                    Fun.Rows[i]["fLeanAngle"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["fLeanAngle"].ToString() +"'",
                    Fun.Rows[i]["bReverse"] == DBNull.Value ? "0" : (Fun.Rows[i]["bReverse"].ToString()  == "True" || Fun.Rows[i]["bReverse"].ToString().ToLower() == "1" ? "1" : "0"),
                    Fun.Rows[i]["iCircles"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iCircles"].ToString() +"'",
                    Fun.Rows[i]["iTestTimes"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iTestTimes"].ToString() +"'",
                    Fun.Rows[i]["ACur"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ACur"].ToString() +"'",
                    Fun.Rows[i]["BCur"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["BCur"].ToString() +"'",
                    Fun.Rows[i]["CCur"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CCur"].ToString() +"'",
                    Fun.Rows[i]["AAgl"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["AAgl"].ToString() +"'",
                    Fun.Rows[i]["BAgl"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["BAgl"].ToString() +"'",
                    Fun.Rows[i]["CAgl"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CAgl"].ToString() +"'");
                al.Add(sb.ToString());
                sb.Clear();
            }

            return al;
        }


        public ArrayList Upload_TestAffectDataStd(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO TestAffectDataStd (cWayName, iAffectNo, cAffectName, cRange, fVoltage, fCurrent, fFrequency, fAngleA, fAngleB, fAngleC, cABCVoltage, cABCCurrent, cLimit, cBCLimit, cLoadName, bFlagTest, iCompare, cXieBo, fLeanAngle, bReverse, iTestCirCles, cConstant, fShowMsg) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5},{6},{7},{8},{9},{10},{11},{12},{13},{14},{15},{16},{17},{18},{19},{20},{21},{22})",
                Fun.Rows[i]["cWayName"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cWayName"].ToString() +"'",
                Fun.Rows[i]["iAffectNo"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iAffectNo"].ToString() +"'",
                Fun.Rows[i]["cAffectName"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cAffectName"].ToString() +"'",
                Fun.Rows[i]["cRange"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cRange"].ToString() +"'",
                Fun.Rows[i]["fVoltage"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["fVoltage"].ToString() +"'",
                Fun.Rows[i]["fCurrent"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["fCurrent"].ToString() +"'",
                Fun.Rows[i]["fFrequency"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["fFrequency"].ToString() +"'",
                Fun.Rows[i]["fAngleA"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["fAngleA"].ToString() +"'",
                Fun.Rows[i]["fAngleB"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["fAngleB"].ToString() +"'",
                Fun.Rows[i]["fAngleC"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["fAngleC"].ToString() +"'",
                Fun.Rows[i]["cABCVoltage"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cABCVoltage"].ToString() +"'",
                Fun.Rows[i]["cABCCurrent"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cABCCurrent"].ToString() +"'",
                Fun.Rows[i]["cLimit"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cLimit"].ToString() +"'",
                Fun.Rows[i]["cBCLimit"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cBCLimit"].ToString() +"'",
                Fun.Rows[i]["cLoadName"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cLoadName"].ToString() +"'",
                Fun.Rows[i]["bFlagTest"] == DBNull.Value ? "0" : (Fun.Rows[i]["bFlagTest"].ToString()  == "True" || Fun.Rows[i]["bFlagTest"].ToString().ToLower() == "1" ? "1" : "0"),
                Fun.Rows[i]["iCompare"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iCompare"].ToString() +"'",
                Fun.Rows[i]["cXieBo"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cXieBo"].ToString() +"'",
                Fun.Rows[i]["fLeanAngle"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["fLeanAngle"].ToString() +"'",
                Fun.Rows[i]["bReverse"] == DBNull.Value ? "0" : (Fun.Rows[i]["bReverse"].ToString()  == "True" || Fun.Rows[i]["bReverse"].ToString().ToLower() == "1" ? "1" : "0"),
                Fun.Rows[i]["iTestCirCles"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iTestCirCles"].ToString() +"'",
                Fun.Rows[i]["cConstant"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cConstant"].ToString() +"'",
                Fun.Rows[i]["fShowMsg"] == DBNull.Value ? "0" : (Fun.Rows[i]["fShowMsg"].ToString()  == "True" || Fun.Rows[i]["fShowMsg"].ToString().ToLower() == "1" ? "1" : "0"));
                al.Add(sb.ToString());
                sb.Clear();
            }
            return al;
        }
         
        public ArrayList Upload_TestErrorData(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO TestErrorData (cWayName, iRangeNo, cRange, cPrecision, iPointNo, cPointName, iTestTimes, cUserUpLimit, cUserDownLimit, SmaxLimit, iCircles, ItnTopErr, ItnLowerErr, MtCo, elem) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5},{6},{7},{8},{9},{10},{11},{12},{13},{14})",
                Fun.Rows[i]["cWayName"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cWayName"].ToString() +"'",
                Fun.Rows[i]["iRangeNo"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iRangeNo"].ToString() +"'",
                Fun.Rows[i]["cRange"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cRange"].ToString() +"'",
                Fun.Rows[i]["cPrecision"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cPrecision"].ToString() +"'",
                Fun.Rows[i]["iPointNo"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iPointNo"].ToString() +"'",
                Fun.Rows[i]["cPointName"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cPointName"].ToString() +"'",
                Fun.Rows[i]["iTestTimes"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iTestTimes"].ToString() +"'",
                Fun.Rows[i]["cUserUpLimit"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cUserUpLimit"].ToString() +"'",
                Fun.Rows[i]["cUserDownLimit"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cUserDownLimit"].ToString() +"'",
                Fun.Rows[i]["SmaxLimit"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["SmaxLimit"].ToString() +"'",
                Fun.Rows[i]["iCircles"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iCircles"].ToString() +"'",
                Fun.Rows[i]["ItnTopErr"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ItnTopErr"].ToString() +"'",
                Fun.Rows[i]["ItnLowerErr"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ItnLowerErr"].ToString() +"'",
                Fun.Rows[i]["MtCo"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MtCo"].ToString() +"'",
                Fun.Rows[i]["elem"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["elem"].ToString() +"'");
                al.Add(sb.ToString());
                sb.Clear();
            } 
            return al;
        }
 
        public ArrayList Upload_TestErrorDataStd(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO TestErrorDataStd (cWayName, iRangeNo, cRange, cPrecision, iPointNo, cPointName, iTestTimes, cUserUpLimit, cUserDownLimit, SmaxLimit, cVoltage, cCurrent, cConstant, fShowMsg, iTestCircles) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5},{6},{7},{8},{9},{10},{11},{12},{13},{14})",
                Fun.Rows[i]["cWayName"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cWayName"].ToString() +"'",
                Fun.Rows[i]["iRangeNo"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iRangeNo"].ToString() +"'",
                Fun.Rows[i]["cRange"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cRange"].ToString() +"'",
                Fun.Rows[i]["cPrecision"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cPrecision"].ToString() +"'",
                Fun.Rows[i]["iPointNo"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iPointNo"].ToString() +"'",
                Fun.Rows[i]["cPointName"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cPointName"].ToString() +"'",
                Fun.Rows[i]["iTestTimes"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iTestTimes"].ToString() +"'",
                Fun.Rows[i]["cUserUpLimit"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cUserUpLimit"].ToString() +"'",
                Fun.Rows[i]["cUserDownLimit"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cUserDownLimit"].ToString() +"'",
                Fun.Rows[i]["SmaxLimit"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["SmaxLimit"].ToString() +"'",
                Fun.Rows[i]["cVoltage"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cVoltage"].ToString() +"'",
                Fun.Rows[i]["cCurrent"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cCurrent"].ToString() +"'",
                Fun.Rows[i]["cConstant"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cConstant"].ToString() +"'",
                Fun.Rows[i]["fShowMsg"] == DBNull.Value ? "0" : (Fun.Rows[i]["fShowMsg"].ToString()  == "True" || Fun.Rows[i]["fShowMsg"].ToString().ToLower() == "1" ? "1" : "0"),
                Fun.Rows[i]["iTestCircles"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iTestCircles"].ToString() +"'");
                al.Add(sb.ToString());
                sb.Clear();
            } 
            return al;
        }

       
        public ArrayList Upload_TestWayData(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO TestWayData (cWayName, cBaseRange, cTestMode, cInMode, cMeterType, cPrecision, cWayAdjust, cWayTest, cWayMultiFunction, cWaySpeacialTest, fWarmCurrent, fWarmTime, cStartRange, cStartCurrent, cStartCurrentP, cStartCurrentQ, iStartPulse, cStartTime, cStartTimeP, cStartTimeQ, cHideRange, cHideVoltage, iHideCurrent, iHideTimeMode, iHidePulse, cHideTime, cHideTimeP, cHideTimeQ, fErrorUpLimit, fErrorDownLimit, iErrorSmax, cErrorSmaxRange, iErrorIbCircle, iWalkMode, iWalkPara, iWalkAutoRead, cWalkRange, cPeriodType, iPeriodWalk, iDemandTestTime, iDemandTestCycle, iDayCircle, iDayTimes, fPeriodWalkE, iDemandTestEvent, fStdVoltage, fStdCurrent, fStdConstant, fStdFrequency, cType, cProtocal, cStopBack, cPrecisionQ, cFactory, cVoltageLimit, cCurrentLimit, iPulseMode, cWalkLimit, cWalkLimit2) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5},{6},{7},{8},{9},{10},{11},{12},{13},{14},{15},{16},{17},{18},{19},{20},{21},{22},{23},{24},{25},{26},{27},{28},{29},{30},{31},{32},{33},{34},{35},{36},{37},{38},{39},{40},{41},{42},{43},{44},{45},{46},{47},{48},{49},{50},{51},{52},{53},{54},{55},{56},{57},{58})",
                    Fun.Rows[i]["cWayName"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cWayName"].ToString() +"'",
                    Fun.Rows[i]["cBaseRange"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cBaseRange"].ToString() +"'",
                    Fun.Rows[i]["cTestMode"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cTestMode"].ToString() +"'",
                    Fun.Rows[i]["cInMode"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cInMode"].ToString() +"'",
                    Fun.Rows[i]["cMeterType"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cMeterType"].ToString() +"'",
                    Fun.Rows[i]["cPrecision"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cPrecision"].ToString() +"'",
                    Fun.Rows[i]["cWayAdjust"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cWayAdjust"].ToString() +"'",
                    Fun.Rows[i]["cWayTest"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cWayTest"].ToString() +"'",
                    Fun.Rows[i]["cWayMultiFunction"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cWayMultiFunction"].ToString() +"'",
                    Fun.Rows[i]["cWaySpeacialTest"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cWaySpeacialTest"].ToString() +"'",
                    Fun.Rows[i]["fWarmCurrent"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["fWarmCurrent"].ToString() +"'",
                    Fun.Rows[i]["fWarmTime"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["fWarmTime"].ToString() +"'",
                    Fun.Rows[i]["cStartRange"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cStartRange"].ToString() +"'",
                    Fun.Rows[i]["cStartCurrent"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cStartCurrent"].ToString() +"'",
                    Fun.Rows[i]["cStartCurrentP"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cStartCurrentP"].ToString() +"'",
                    Fun.Rows[i]["cStartCurrentQ"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cStartCurrentQ"].ToString() +"'",
                    Fun.Rows[i]["iStartPulse"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iStartPulse"].ToString() +"'",
                    Fun.Rows[i]["cStartTime"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cStartTime"].ToString() +"'",
                    Fun.Rows[i]["cStartTimeP"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cStartTimeP"].ToString() +"'",
                    Fun.Rows[i]["cStartTimeQ"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cStartTimeQ"].ToString() +"'",
                    Fun.Rows[i]["cHideRange"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cHideRange"].ToString() +"'",
                    Fun.Rows[i]["cHideVoltage"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cHideVoltage"].ToString() +"'",
                    Fun.Rows[i]["iHideCurrent"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iHideCurrent"].ToString() +"'",
                    Fun.Rows[i]["iHideTimeMode"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iHideTimeMode"].ToString() +"'",
                    Fun.Rows[i]["iHidePulse"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iHidePulse"].ToString() +"'",
                    Fun.Rows[i]["cHideTime"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cHideTime"].ToString() +"'",
                    Fun.Rows[i]["cHideTimeP"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cHideTimeP"].ToString() +"'",
                    Fun.Rows[i]["cHideTimeQ"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cHideTimeQ"].ToString() +"'",
                    Fun.Rows[i]["fErrorUpLimit"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["fErrorUpLimit"].ToString() +"'",
                    Fun.Rows[i]["fErrorDownLimit"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["fErrorDownLimit"].ToString() +"'",
                    Fun.Rows[i]["iErrorSmax"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iErrorSmax"].ToString() +"'",
                    Fun.Rows[i]["cErrorSmaxRange"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cErrorSmaxRange"].ToString() +"'",
                    Fun.Rows[i]["iErrorIbCircle"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iErrorIbCircle"].ToString() +"'",
                    Fun.Rows[i]["iWalkMode"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iWalkMode"].ToString() +"'",
                    Fun.Rows[i]["iWalkPara"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iWalkPara"].ToString() +"'",
                    Fun.Rows[i]["iWalkAutoRead"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iWalkAutoRead"].ToString() +"'",
                    Fun.Rows[i]["cWalkRange"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cWalkRange"].ToString() +"'",
                    Fun.Rows[i]["cPeriodType"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cPeriodType"].ToString() +"'",
                    Fun.Rows[i]["iPeriodWalk"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iPeriodWalk"].ToString() +"'",
                    Fun.Rows[i]["iDemandTestTime"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iDemandTestTime"].ToString() +"'",
                    Fun.Rows[i]["iDemandTestCycle"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iDemandTestCycle"].ToString() +"'",
                    Fun.Rows[i]["iDayCircle"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iDayCircle"].ToString() +"'",
                    Fun.Rows[i]["iDayTimes"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iDayTimes"].ToString() +"'", 
                    Fun.Rows[i]["fPeriodWalkE"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["fPeriodWalkE"].ToString() +"'",
                    Fun.Rows[i]["iDemandTestEvent"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iDemandTestEvent"].ToString() +"'",
                    Fun.Rows[i]["fStdVoltage"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["fStdVoltage"].ToString() +"'",
                    Fun.Rows[i]["fStdCurrent"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["fStdCurrent"].ToString() +"'",
                    Fun.Rows[i]["fStdConstant"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["fStdConstant"].ToString() +"'",
                    Fun.Rows[i]["fStdFrequency"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["fStdFrequency"].ToString() +"'",
                    Fun.Rows[i]["cType"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cType"].ToString() +"'",
                    Fun.Rows[i]["cProtocal"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cProtocal"].ToString() +"'",
                    Fun.Rows[i]["cStopBack"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cStopBack"].ToString() +"'",
                    Fun.Rows[i]["cPrecisionQ"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cPrecisionQ"].ToString() +"'",
                    Fun.Rows[i]["cFactory"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cFactory"].ToString() +"'",
                    Fun.Rows[i]["cVoltageLimit"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cVoltageLimit"].ToString() +"'",
                    Fun.Rows[i]["cCurrentLimit"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cCurrentLimit"].ToString() +"'",
                    Fun.Rows[i]["iPulseMode"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iPulseMode"].ToString() +"'",
                    Fun.Rows[i]["cWalkLimit"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cWalkLimit"].ToString() +"'",
                    Fun.Rows[i]["cWalkLimit2"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cWalkLimit2"].ToString() +"'");
                al.Add(sb.ToString());
                sb.Clear();
            }

            return al;
        }

        public ArrayList Upload_TestWayDataStd(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO TestWayDataStd (cWayName, cBaseRange, cTestMode, cInMode, cMeterType, cPrecision, cWayAdjust, cWayTest, cWayMultiFunction, cWaySpeacialTest, fWarmCurrent, fWarmTime, cStartRange, cStartCurrent, cStartCurrentP, cStartCurrentQ, iStartPulse, cStartTime, cStartTimeP, cStartTimeQ, cHideRange, cHideVoltage, iHideCurrent, iHideTimeMode, iHidePulse, cHideTime, cHideTimeP, cHideTimeQ, fErrorUpLimit, fErrorDownLimit, iErrorSmax, cErrorSmaxRange, iErrorIbCircle, iWalkMode, iWalkPara, iWalkAutoRead, cWalkRange, cPeriodType, iPeriodWalk, iDemandTestTime, iDemandTestCycle, iDayCircle, iDayTimes, fPeriodWalkE, iDemandTestEvent, fStdVoltage, fStdCurrent, fStdConstant, fStdFrequency, cType, cProtocal, cStopBack, cPrecisionQ, cFactory, cVoltageLimit, cCurrentLimit, iPulseMode, cWalkLimit, cWalkLimit2) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5},{6},{7},{8},{9},{10},{11},{12},{13},{14},{15},{16},{17},{18},{19},{20},{21},{22},{23},{24},{25},{26},{27},{28},{29},{30},{31},{32},{33},{34},{35},{36},{37},{38},{39},{40},{41},{42},{43},{44},{45},{46},{47},{48},{49},{50},{51},{52},{53},{54},{55},'{56}','{57}')",
                    Fun.Rows[i]["cWayName"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cWayName"].ToString() +"'",
                    Fun.Rows[i]["cBaseRange"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cBaseRange"].ToString() +"'",
                    Fun.Rows[i]["cTestMode"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cTestMode"].ToString() +"'",
                    Fun.Rows[i]["cInMode"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cInMode"].ToString() +"'",
                    Fun.Rows[i]["cMeterType"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cMeterType"].ToString() +"'",
                    Fun.Rows[i]["cPrecision"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cPrecision"].ToString() +"'",
                    Fun.Rows[i]["cWayAdjust"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cWayAdjust"].ToString() +"'",
                    Fun.Rows[i]["cWayTest"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cWayTest"].ToString() +"'",
                    Fun.Rows[i]["cWayMultiFunction"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cWayMultiFunction"].ToString() +"'",
                    Fun.Rows[i]["cWaySpeacialTest"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cWaySpeacialTest"].ToString() +"'",
                    Fun.Rows[i]["fWarmCurrent"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["fWarmCurrent"].ToString() +"'",
                    Fun.Rows[i]["fWarmTime"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["fWarmTime"].ToString() +"'",
                    Fun.Rows[i]["cStartRange"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cStartRange"].ToString() +"'",
                    Fun.Rows[i]["cStartCurrent"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cStartCurrent"].ToString() +"'",
                    Fun.Rows[i]["cStartCurrentP"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cStartCurrentP"].ToString() +"'",
                    Fun.Rows[i]["cStartCurrentQ"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cStartCurrentQ"].ToString() +"'",
                    Fun.Rows[i]["iStartPulse"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iStartPulse"].ToString() +"'",
                    Fun.Rows[i]["cStartTime"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cStartTime"].ToString() +"'",
                    Fun.Rows[i]["cStartTimeP"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cStartTimeP"].ToString() +"'",
                    Fun.Rows[i]["cStartTimeQ"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cStartTimeQ"].ToString() +"'",
                    Fun.Rows[i]["cHideRange"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cHideRange"].ToString() +"'",
                    Fun.Rows[i]["cHideVoltage"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cHideVoltage"].ToString() +"'",
                    Fun.Rows[i]["iHideCurrent"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iHideCurrent"].ToString() +"'",
                    Fun.Rows[i]["iHideTimeMode"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iHideTimeMode"].ToString() +"'",
                    Fun.Rows[i]["iHidePulse"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iHidePulse"].ToString() +"'",
                    Fun.Rows[i]["cHideTime"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cHideTime"].ToString() +"'",
                    Fun.Rows[i]["cHideTimeP"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cHideTimeP"].ToString() +"'",
                    Fun.Rows[i]["cHideTimeQ"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cHideTimeQ"].ToString() +"'",
                    Fun.Rows[i]["fErrorUpLimit"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["fErrorUpLimit"].ToString() +"'",
                    Fun.Rows[i]["fErrorDownLimit"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["fErrorDownLimit"].ToString() +"'",
                    Fun.Rows[i]["iErrorSmax"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iErrorSmax"].ToString() +"'",
                    Fun.Rows[i]["cErrorSmaxRange"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cErrorSmaxRange"].ToString() +"'",
                    Fun.Rows[i]["iErrorIbCircle"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iErrorIbCircle"].ToString() +"'",
                    Fun.Rows[i]["iWalkMode"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iWalkMode"].ToString() +"'",
                    Fun.Rows[i]["iWalkPara"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iWalkPara"].ToString() +"'",
                    Fun.Rows[i]["iWalkAutoRead"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iWalkAutoRead"].ToString() +"'",
                    Fun.Rows[i]["cWalkRange"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cWalkRange"].ToString() +"'",
                    Fun.Rows[i]["cPeriodType"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cPeriodType"].ToString() +"'",
                    Fun.Rows[i]["iPeriodWalk"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iPeriodWalk"].ToString() +"'",
                    Fun.Rows[i]["iDemandTestTime"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iDemandTestTime"].ToString() +"'",
                    Fun.Rows[i]["iDemandTestCycle"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iDemandTestCycle"].ToString() +"'",
                    Fun.Rows[i]["iDayCircle"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iDayCircle"].ToString() +"'",
                    Fun.Rows[i]["iDayTimes"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iDayTimes"].ToString() +"'",
                    Fun.Rows[i]["fPeriodWalkE"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["fPeriodWalkE"].ToString() +"'",
                    Fun.Rows[i]["iDemandTestEvent"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iDemandTestEvent"].ToString() +"'",
                    Fun.Rows[i]["fStdVoltage"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["fStdVoltage"].ToString() +"'",
                    Fun.Rows[i]["fStdCurrent"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["fStdCurrent"].ToString() +"'",
                    Fun.Rows[i]["fStdConstant"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["fStdConstant"].ToString() +"'",
                    Fun.Rows[i]["fStdFrequency"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["fStdFrequency"].ToString() +"'",
                    Fun.Rows[i]["cType"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cType"].ToString() +"'",
                    Fun.Rows[i]["cProtocal"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cProtocal"].ToString() +"'",
                    Fun.Rows[i]["cStopBack"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cStopBack"].ToString() +"'",
                    Fun.Rows[i]["cPrecisionQ"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cPrecisionQ"].ToString() +"'",
                    Fun.Rows[i]["cFactory"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cFactory"].ToString() +"'",
                    Fun.Rows[i]["cVoltageLimit"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cVoltageLimit"].ToString() +"'",
                    Fun.Rows[i]["cCurrentLimit"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cCurrentLimit"].ToString() +"'",
                    Fun.Rows[i]["iPulseMode"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iPulseMode"].ToString() +"'",
                    Fun.Rows[i]["cWalkLimit"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cWalkLimit"].ToString() +"'",
                    Fun.Rows[i]["cWalkLimit2"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cWalkLimit2"].ToString() +"'");
                al.Add(sb.ToString());
                sb.Clear();
            }
            return al;
        }
         
        public ArrayList Upload_UseData(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO UseData (cType, cValue) VALUES (");
                sb.AppendFormat("{0},{1})",
                Fun.Rows[i]["cType"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cType"].ToString() +"'",
                Fun.Rows[i]["cValue"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cValue"].ToString() +"'");
                al.Add(sb.ToString());
                sb.Clear();
            } 
            return al;
        }

        // 生成方法
        public ArrayList Upload_UserData(DataTable Fun)
        {
            ArrayList al = new ArrayList(); 
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO UserData (ID, [USER], PASSWORD, Propertiy, WRITE) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4})",
                Fun.Rows[i]["ID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ID"].ToString() +"'",
                Fun.Rows[i]["USER"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["USER"].ToString() +"'",
                Fun.Rows[i]["PASSWORD"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["PASSWORD"].ToString() +"'",
                Fun.Rows[i]["Propertiy"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Propertiy"].ToString() +"'",
                Fun.Rows[i]["WRITE"] == DBNull.Value ? "0" : (Fun.Rows[i]["WRITE"].ToString()  == "True" || Fun.Rows[i]["WRITE"].ToString().ToLower() == "1" ? "1" : "0"));
                al.Add(sb.ToString());
                sb.Clear();
            }

            return al;
        }

        public ArrayList Upload_XieBoData(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO XieBoData (cName, cType, Times, Share, Angle, IsIn, Mode) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5},{6})",
                Fun.Rows[i]["cName"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cName"].ToString() +"'",
                Fun.Rows[i]["cType"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cType"].ToString() +"'",
                Fun.Rows[i]["Times"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Times"].ToString() +"'",
                Fun.Rows[i]["Share"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Share"].ToString() +"'",
                Fun.Rows[i]["Angle"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Angle"].ToString() +"'",
                Fun.Rows[i]["IsIn"] == DBNull.Value ? "0" : (Fun.Rows[i]["IsIn"].ToString()  == "True" || Fun.Rows[i]["IsIn"].ToString().ToLower() == "1" ? "1" : "0"),
                Fun.Rows[i]["Mode"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Mode"].ToString() +"'");
                al.Add(sb.ToString());
                sb.Clear();
            } 
            return al;
        }
        #endregion


        #region tmpData
        public ArrayList Upload_NumberCode(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO NumberCode (IndexID, serialno, meterno, ScanCode, Constant, TesterCode, TestCircs, ADDRESS, MODEL, MadePlace, SerialDate, TestUnit, Class, Voltage, [Current], Precision, Frequency, StartDeg, cConnectMode, cLeiXing, cInMode, cTestMode, bStopBack, cCommProtocol, cPassword, cCommSetting, iDemandCycle, iDemandStep, fDayFrequency, iDayDivideFre, cPeriodSharp, cPeriodPeak, cPeriodPlane, cPeriodVale, bAvailable, iReactiveMode, iPulseMode, PrecisionQ, iPowerPoint, EConstant) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5},{6},{7},{8},{9},{10},{11},{12},{13},{14},{15},{16},{17},{18},{19},{20},{21},{22},{23},{24},{25},{26},{27},{28},{29},{30},{31},{32},{33},{34},{35},{36},{37},{38},{39})",
                    Fun.Rows[i]["IndexID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["IndexID"].ToString() +"'",
                    Fun.Rows[i]["serialno"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["serialno"].ToString() +"'",
                    Fun.Rows[i]["meterno"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["meterno"].ToString() +"'",
                    Fun.Rows[i]["ScanCode"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ScanCode"].ToString() +"'",
                    Fun.Rows[i]["Constant"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Constant"].ToString() +"'",
                    Fun.Rows[i]["TesterCode"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TesterCode"].ToString() +"'",
                    Fun.Rows[i]["TestCircs"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TestCircs"].ToString() +"'",
                    Fun.Rows[i]["ADDRESS"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ADDRESS"].ToString() +"'",
                    Fun.Rows[i]["MODEL"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MODEL"].ToString() +"'",
                    Fun.Rows[i]["MadePlace"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MadePlace"].ToString() +"'",
                    Fun.Rows[i]["SerialDate"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["SerialDate"].ToString() +"'",
                    Fun.Rows[i]["TestUnit"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TestUnit"].ToString() +"'",
                    Fun.Rows[i]["Class"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Class"].ToString() +"'",
                    Fun.Rows[i]["Voltage"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Voltage"].ToString() +"'",
                    Fun.Rows[i]["Current"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Current"].ToString() +"'",
                    Fun.Rows[i]["Precision"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Precision"].ToString() +"'",
                    Fun.Rows[i]["Frequency"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Frequency"].ToString() +"'",
                    Fun.Rows[i]["StartDeg"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["StartDeg"].ToString() +"'",
                    Fun.Rows[i]["cConnectMode"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cConnectMode"].ToString() +"'",
                    Fun.Rows[i]["cLeiXing"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cLeiXing"].ToString() +"'",
                    Fun.Rows[i]["cInMode"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cInMode"].ToString() +"'",
                    Fun.Rows[i]["cTestMode"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cTestMode"].ToString() +"'",
                    Fun.Rows[i]["bStopBack"] == DBNull.Value ? "0" : (Fun.Rows[i]["bStopBack"].ToString()  == "True" || Fun.Rows[i]["bStopBack"].ToString().ToLower() == "1" ? "1" : "0"),
                    Fun.Rows[i]["cCommProtocol"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cCommProtocol"].ToString() +"'",
                    Fun.Rows[i]["cPassword"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cPassword"].ToString() +"'",
                    Fun.Rows[i]["cCommSetting"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cCommSetting"].ToString() +"'",
                    Fun.Rows[i]["iDemandCycle"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iDemandCycle"].ToString() +"'",
                    Fun.Rows[i]["iDemandStep"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iDemandStep"].ToString() +"'",
                    Fun.Rows[i]["fDayFrequency"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["fDayFrequency"].ToString() +"'",
                    Fun.Rows[i]["iDayDivideFre"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iDayDivideFre"].ToString() +"'",
                    Fun.Rows[i]["cPeriodSharp"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cPeriodSharp"].ToString() +"'",
                    Fun.Rows[i]["cPeriodPeak"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cPeriodPeak"].ToString() +"'",
                    Fun.Rows[i]["cPeriodPlane"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cPeriodPlane"].ToString() +"'",
                    Fun.Rows[i]["cPeriodVale"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cPeriodVale"].ToString() +"'",
                    Fun.Rows[i]["bAvailable"] == DBNull.Value ? "0" : (Fun.Rows[i]["bAvailable"].ToString()  == "True" || Fun.Rows[i]["bAvailable"].ToString().ToLower() == "1" ? "1" : "0"),
                    Fun.Rows[i]["iReactiveMode"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iReactiveMode"].ToString() +"'",
                    Fun.Rows[i]["iPulseMode"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iPulseMode"].ToString() +"'",
                    Fun.Rows[i]["PrecisionQ"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["PrecisionQ"].ToString() +"'",
                    Fun.Rows[i]["iPowerPoint"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iPowerPoint"].ToString() +"'",
                    Fun.Rows[i]["EConstant"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["EConstant"].ToString() +"'");
                al.Add(sb.ToString());
                sb.Clear();
            }

            return al;
        } 
        public ArrayList Upload_tblRtInfo(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO tblRtInfo (pid, range, pt, iteration, begintime, endtime, temp, humi, WhtLimit, varhtLimit, setvolt, setamp, setangle, setfreq, elms, rdimpwh, rdimpvah, param1, param2, param3, param4, param5, param6, param7, param8, param9, param10) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},'{4:yyyy-MM-dd HH:mm:ss}','{5:yyyy-MM-dd HH:mm:ss}',{6},{7},{8},{9},{10},{11},{12},{13},{14},{15},{16},{17},{18},{19},{20},{21},{22},{23},{24},{25},{26})",
                Fun.Rows[i]["pid"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["pid"].ToString() +"'",
                Fun.Rows[i]["range"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["range"].ToString() +"'",
                Fun.Rows[i]["pt"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["pt"].ToString() +"'",
                Fun.Rows[i]["iteration"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iteration"].ToString() +"'",
                Fun.Rows[i]["begintime"] == DBNull.Value ? "NULL" :"'"+ ((DateTime)Fun.Rows[i]["begintime"]).ToString("yyyy-MM-dd HH:mm:ss"),
                Fun.Rows[i]["endtime"] == DBNull.Value ? "NULL" :"'"+ ((DateTime)Fun.Rows[i]["endtime"]).ToString("yyyy-MM-dd HH:mm:ss"),
                Fun.Rows[i]["temp"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["temp"].ToString() +"'",
                Fun.Rows[i]["humi"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["humi"].ToString() +"'",
                Fun.Rows[i]["WhtLimit"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["WhtLimit"].ToString() +"'",
                Fun.Rows[i]["varhtLimit"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["varhtLimit"].ToString() +"'",
                Fun.Rows[i]["setvolt"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["setvolt"].ToString() +"'",
                Fun.Rows[i]["setamp"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["setamp"].ToString() +"'",
                Fun.Rows[i]["setangle"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["setangle"].ToString() +"'",
                Fun.Rows[i]["setfreq"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["setfreq"].ToString() +"'",
                Fun.Rows[i]["elms"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["elms"].ToString() +"'",
                Fun.Rows[i]["rdimpwh"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["rdimpwh"].ToString() +"'",
                Fun.Rows[i]["rdimpvah"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["rdimpvah"].ToString() +"'",
                Fun.Rows[i]["param1"] == DBNull.Value ? "NULL" :"'" + Fun.Rows[i]["param1"].ToString() +"'",
                Fun.Rows[i]["param2"] == DBNull.Value ? "NULL" :"'" + Fun.Rows[i]["param2"].ToString() +"'",
                Fun.Rows[i]["param3"] == DBNull.Value ? "NULL" :"'" + Fun.Rows[i]["param3"].ToString() +"'",
                Fun.Rows[i]["param4"] == DBNull.Value ? "NULL" :"'" + Fun.Rows[i]["param4"].ToString() +"'",
                Fun.Rows[i]["param5"] == DBNull.Value ? "NULL" :"'" + Fun.Rows[i]["param5"].ToString() +"'",
                Fun.Rows[i]["param6"] == DBNull.Value ? "NULL" :"'" + Fun.Rows[i]["param6"].ToString() +"'",
                Fun.Rows[i]["param7"] == DBNull.Value ? "NULL" :"'" + Fun.Rows[i]["param7"].ToString() +"'",
                Fun.Rows[i]["param8"] == DBNull.Value ? "NULL" :"'" + Fun.Rows[i]["param8"].ToString() +"'",
                Fun.Rows[i]["param9"] == DBNull.Value ? "NULL" :"'" + Fun.Rows[i]["param9"].ToString() +"'",
                Fun.Rows[i]["param10"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["param10"].ToString() + "'");
                al.Add(sb.ToString());
                sb.Clear();
            } 

            return al;
        }

 
      public ArrayList Upload_TmpCommResult(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO TmpCommResult (ID, IndexID, Conclusion, CommDate, CommTime, CommPeriodTime1, CommPeriodTime2, CommPeriodTime3, CommPeriodTime4, CommDemandZyAll, CommDemandZyI, CommDemandZyII, CommDemandZyIII, CommDemandZyIV, CommDemandFyAll, CommDemandFyI, CommDemandFyII, CommDemandFyIII, CommDemandFyIV, CommDemandZwAll, CommDemandZwI, CommDemandZwII, CommDemandZwIII, CommDemandZwIV, CommDemandFwAll, CommDemandFwI, CommDemandFwII, CommDemandFwIII, CommDemandFwIV, A_NowV, A_NowC, A_NowP, A_NowQ, B_NowV, B_NowC, B_NowP, B_NowQ, C_NowV, C_NowC, C_NowP, C_NowQ, State_Meter, State_Net, State_Week, OffVol_A_Start, OffVol_A_End, OffVol_A_Times, OffVol_B_Start, OffVol_B_End, OffVol_B_Times, OffVol_C_Start, OffVol_C_End, OffVol_C_Times, CommDemandCycle, CommDemandSlider) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5},{6},{7},{8},{9},{10},{11},{12},{13},{14},{15},{16},{17},{18},{19},{20},{21},{22},{23},{24},{25},{26},{27},{28},{29},{30},{31},{32},{33},{34},{35},{36},{37},{38},{39},{40},{41},{42},{43},{44},{45},{46},{47},{48},{49},{50},{51},{52},{53})",
                    Fun.Rows[i]["ID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ID"].ToString() +"'",
                    Fun.Rows[i]["IndexID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["IndexID"].ToString() +"'",
                    Fun.Rows[i]["Conclusion"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Conclusion"].ToString() +"'",
                    Fun.Rows[i]["CommDate"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CommDate"].ToString() +"'",
                    Fun.Rows[i]["CommTime"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CommTime"].ToString() +"'",
                    Fun.Rows[i]["CommPeriodTime1"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CommPeriodTime1"].ToString() +"'",
                    Fun.Rows[i]["CommPeriodTime2"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CommPeriodTime2"].ToString() +"'",
                    Fun.Rows[i]["CommPeriodTime3"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CommPeriodTime3"].ToString() +"'",
                    Fun.Rows[i]["CommPeriodTime4"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CommPeriodTime4"].ToString() +"'",
                    Fun.Rows[i]["CommDemandZyAll"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CommDemandZyAll"].ToString() +"'",
                    Fun.Rows[i]["CommDemandZyI"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CommDemandZyI"].ToString() +"'",
                    Fun.Rows[i]["CommDemandZyII"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CommDemandZyII"].ToString() +"'",
                    Fun.Rows[i]["CommDemandZyIII"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CommDemandZyIII"].ToString() +"'",
                    Fun.Rows[i]["CommDemandZyIV"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CommDemandZyIV"].ToString() +"'",
                    Fun.Rows[i]["CommDemandFyAll"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CommDemandFyAll"].ToString() +"'",
                    Fun.Rows[i]["CommDemandFyI"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CommDemandFyI"].ToString() +"'",
                    Fun.Rows[i]["CommDemandFyII"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CommDemandFyII"].ToString() +"'",
                    Fun.Rows[i]["CommDemandFyIII"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CommDemandFyIII"].ToString() +"'",
                    Fun.Rows[i]["CommDemandFyIV"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CommDemandFyIV"].ToString() +"'",
                    Fun.Rows[i]["CommDemandZwAll"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CommDemandZwAll"].ToString() +"'",
                    Fun.Rows[i]["CommDemandZwI"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CommDemandZwI"].ToString() +"'",
                    Fun.Rows[i]["CommDemandZwII"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CommDemandZwII"].ToString() +"'",
                    Fun.Rows[i]["CommDemandZwIII"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CommDemandZwIII"].ToString() +"'",
                    Fun.Rows[i]["CommDemandZwIV"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CommDemandZwIV"].ToString() +"'",
                    Fun.Rows[i]["CommDemandFwAll"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CommDemandFwAll"].ToString() +"'",
                    Fun.Rows[i]["CommDemandFwI"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CommDemandFwI"].ToString() +"'",
                    Fun.Rows[i]["CommDemandFwII"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CommDemandFwII"].ToString() +"'",
                    Fun.Rows[i]["CommDemandFwIII"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CommDemandFwIII"].ToString() +"'",
                    Fun.Rows[i]["CommDemandFwIV"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CommDemandFwIV"].ToString() +"'",
                    Fun.Rows[i]["A_NowV"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["A_NowV"].ToString() +"'",
                    Fun.Rows[i]["A_NowC"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["A_NowC"].ToString() +"'",
                    Fun.Rows[i]["A_NowP"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["A_NowP"].ToString() +"'",
                    Fun.Rows[i]["A_NowQ"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["A_NowQ"].ToString() +"'",
                    Fun.Rows[i]["B_NowV"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["B_NowV"].ToString() +"'",
                    Fun.Rows[i]["B_NowC"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["B_NowC"].ToString() +"'",
                    Fun.Rows[i]["B_NowP"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["B_NowP"].ToString() +"'",
                    Fun.Rows[i]["B_NowQ"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["B_NowQ"].ToString() +"'",
                    Fun.Rows[i]["C_NowV"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["C_NowV"].ToString() +"'",
                    Fun.Rows[i]["C_NowC"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["C_NowC"].ToString() +"'",
                    Fun.Rows[i]["C_NowP"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["C_NowP"].ToString() +"'", 
                    Fun.Rows[i]["C_NowQ"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["C_NowQ"].ToString() +"'",
                    Fun.Rows[i]["State_Meter"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["State_Meter"].ToString() +"'",
                    Fun.Rows[i]["State_Net"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["State_Net"].ToString() +"'",
                    Fun.Rows[i]["State_Week"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["State_Week"].ToString() +"'",
                    Fun.Rows[i]["OffVol_A_Start"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["OffVol_A_Start"].ToString() +"'",
                    Fun.Rows[i]["OffVol_A_End"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["OffVol_A_End"].ToString() +"'",
                    Fun.Rows[i]["OffVol_A_Times"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["OffVol_A_Times"].ToString() +"'",
                    Fun.Rows[i]["OffVol_B_Start"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["OffVol_B_Start"].ToString() +"'",
                    Fun.Rows[i]["OffVol_B_End"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["OffVol_B_End"].ToString() +"'",
                    Fun.Rows[i]["OffVol_B_Times"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["OffVol_B_Times"].ToString() +"'",
                    Fun.Rows[i]["OffVol_C_Start"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["OffVol_C_Start"].ToString() +"'",
                    Fun.Rows[i]["OffVol_C_End"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["OffVol_C_End"].ToString() +"'",
                    Fun.Rows[i]["OffVol_C_Times"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["OffVol_C_Times"].ToString() +"'",
                    Fun.Rows[i]["CommDemandCycle"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CommDemandCycle"].ToString() +"'",
                    Fun.Rows[i]["CommDemandSlider"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CommDemandSlider"].ToString() +"'");
                al.Add(sb.ToString());
                sb.Clear();
            } 
            return al;
        }

        public ArrayList Upload_TmpError(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO TmpError (IndexID, iRangeNo, cRange, iPointNo, cPointName, cError, cAveData, cCIData, cSmax, bOverLimit, hipluses) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5},{6},{7},{8},{9},{10})",
                    Fun.Rows[i]["IndexID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["IndexID"].ToString() +"'",
                    Fun.Rows[i]["iRangeNo"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iRangeNo"].ToString() +"'",
                    Fun.Rows[i]["cRange"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cRange"].ToString() +"'",
                    Fun.Rows[i]["iPointNo"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iPointNo"].ToString() +"'",
                    Fun.Rows[i]["cPointName"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cPointName"].ToString() +"'",
                    Fun.Rows[i]["cError"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cError"].ToString() +"'",
                    Fun.Rows[i]["cAveData"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cAveData"].ToString() +"'",
                    Fun.Rows[i]["cCIData"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cCIData"].ToString() +"'",
                    Fun.Rows[i]["cSmax"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cSmax"].ToString() +"'",
                    Fun.Rows[i]["bOverLimit"] == DBNull.Value ? "0" : (Fun.Rows[i]["bOverLimit"].ToString()  == "True" || Fun.Rows[i]["bOverLimit"].ToString().ToLower() == "1" ? "1" : "0"),
                    Fun.Rows[i]["hipluses"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["hipluses"].ToString() +"'");
                al.Add(sb.ToString());
                sb.Clear();
            } 
            return al;
        }

        public ArrayList Upload_TmpMultiResult(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();

            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO TmpMultiResult (MeterID, commtest, statetest, memotest, GPStest, GPSerror, DAYtest, DAYerror, TIMEsect, TIMEerror, combinErrT, ShowValueErrT, FeeErrT, VOLtageDrop, JStandardTQ, JFactTQ, JError, JTstart, JTend, JTvalue, Jstart, Jend, Jvalue, JcombinErr, FStandardTQ, FFactTQ, FError, FTstart, FTend, FTvalue, Fstart, Fend, Fvalue, FcombinErr, PStandardTQ, PFactTQ, PError, PTstart, PTend, PTvalue, Pstart, Pend, Pvalue, PcombinErr, GStandardTQ, GFactTQ, GError, GTstart, GTend, GTvalue, Gstart, Gand, Gvalue, GcombinErr, ShowStd, SHowMeter, SHowValueErr, MaxR01ibT, MaxR1ibT, MaxRImaxT, RequireT, MaxR01ibSV, MaxR01ibFV, MaxR01ibE, MaxR1ibSV, MaxR1ibFV, MaxR1ibE, MaxRImaxSV, MaxRImaxFV, MaxRImaxE, Requirep, Requireperr, JYZD, JYFD, JWZD, JWFD, JW1D, JW2D, JW3D, JW4D, FYZD, FYFD, FWZD, FWFD, FW1D, FW2D, FW3D, FW4D, PYZD, PYFD, PWZD, PWFD, PW1D, PW2D, PW3D, PW4D, GYZD, GYFD, GWZD, GWFD, GW1D, GW2D, GW3D, GW4D, ZYZD, ZYFD, ZWZD, ZWFD, ZW1D, ZW2D, ZW3D, ZW4D, GPSSetTime, GPSGetTime, EndEj, EndEf, EndEp, EndEg, EndE0, CombinErr, VolDropLimit, VolDropPulse, MemoRule, EventRecord, EventClearTimes1, EventMeterTime, EventClearTimes2, EventClearTime2, JYZD_S, JYFD_S, JWZD_S, JWFD_S, FYZD_S, FYFD_S, FWZD_S, FWFD_S, PYZD_S, PYFD_S, PWZD_S, PWFD_S, GYZD_S, GYFD_S, GWZD_S, GWFD_S, ZYZD_S, ZYFD_S, ZWZD_S, ZWFD_S, BeginTime, EndTime, MaxR005ibSV, MaxR005ibFV, MaxR005ibE, MaxR005ibT, RequireperrAve, DayErr1, DayErr2, DayErr3, DayErr4, DayErr5, DayErr6, DayErr7, DayErr8, DayErr9, DayErr10, DayErrAve) VALUES (");
                sb.AppendFormat(
                    "'{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}','{11}','{12}','{13}','{14:yyyy-MM-dd HH:mm:ss}','{15:yyyy-MM-dd HH:mm:ss}','{16}','{17}','{18}','{19}','{20}','{21}','{22}','{23}','{24}','{25:yyyy-MM-dd HH:mm:ss}','{26:yyyy-MM-dd HH:mm:ss}','{27}','{28}','{29}','{30}','{31}','{32}','{33:yyyy-MM-dd HH:mm:ss}','{34:yyyy-MM-dd HH:mm:ss}','{35}','{36}','{37}','{38}','{39}','{40}','{41}','{42}','{43}','{44}','{45}','{46}','{47}','{48}','{49}','{50}','{51}','{52}','{53}','{54}','{55}','{56}','{57}','{58}','{59}','{60}','{61}','{62}','{63}','{64}','{65}','{66}','{67}','{68}','{69}','{70}','{71}','{72}','{73}','{74}','{75}','{76}','{77}','{78}','{79}','{80}','{81}','{82}','{83}','{84}','{85}','{86}','{87}','{88}','{89}','{90}','{91}','{92}','{93}','{94}','{95}','{96}','{97}','{98}','{99}','{100}','{101}','{102}','{103}','{104}','{105}','{106}','{107}','{108}','{109}','{110}','{111}','{112}','{113}','{114}','{115}','{116}','{117}','{118}','{119}','{120}','{121}','{122}','{123}','{124}','{125}','{126}','{127}','{128}','{129}','{130}','{131}','{132}','{133}','{134}','{135}','{136}','{137}','{138}','{139}','{140}','{141}','{142}','{143}','{144}','{145}','{146}','{147}','{148}','{149}','{150}','{151}','{152}','{153}','{154}','{155}','{156}','{157}','{158}','{159}','{160}','{161}','{162}','{163}')",
                Fun.Rows[i]["MeterID"],
                Fun.Rows[i]["commtest"],
                Fun.Rows[i]["statetest"],
                Fun.Rows[i]["memotest"],
                Fun.Rows[i]["GPStest"],
                Fun.Rows[i]["GPSerror"],
                Fun.Rows[i]["DAYtest"],
                Fun.Rows[i]["DAYerror"],
                Fun.Rows[i]["TIMEsect"],
                Fun.Rows[i]["TIMEerror"],
                Fun.Rows[i]["combinErrT"],
                Fun.Rows[i]["ShowValueErrT"],
                Fun.Rows[i]["FeeErrT"],
                Fun.Rows[i]["VOLtageDrop"],
                Fun.Rows[i]["JStandardTQ"],
                Fun.Rows[i]["JFactTQ"],
                Fun.Rows[i]["JError"],
                Fun.Rows[i]["JTstart"],
                Fun.Rows[i]["JTend"],
                Fun.Rows[i]["JTvalue"],
                Fun.Rows[i]["Jstart"],
                Fun.Rows[i]["Jend"],
                Fun.Rows[i]["Jvalue"],
                Fun.Rows[i]["JcombinErr"],
                Fun.Rows[i]["FStandardTQ"],
                Fun.Rows[i]["FFactTQ"],
                Fun.Rows[i]["FError"],
                Fun.Rows[i]["FTstart"],
                Fun.Rows[i]["FTend"],
                Fun.Rows[i]["FTvalue"],
                Fun.Rows[i]["Fstart"],
                Fun.Rows[i]["Fend"],
                Fun.Rows[i]["Fvalue"],
                Fun.Rows[i]["FcombinErr"],
                Fun.Rows[i]["PStandardTQ"],
                Fun.Rows[i]["PFactTQ"],
                Fun.Rows[i]["PError"],
                Fun.Rows[i]["PTstart"],
                Fun.Rows[i]["PTend"],
                Fun.Rows[i]["PTvalue"],
                Fun.Rows[i]["Pstart"],
                Fun.Rows[i]["Pend"],
                Fun.Rows[i]["Pvalue"],
                Fun.Rows[i]["PcombinErr"],
                Fun.Rows[i]["GStandardTQ"],
                Fun.Rows[i]["GFactTQ"],
                Fun.Rows[i]["GError"],
                Fun.Rows[i]["GTstart"],
                Fun.Rows[i]["GTend"],
                Fun.Rows[i]["GTvalue"],
                Fun.Rows[i]["Gstart"],
                Fun.Rows[i]["Gand"],
                Fun.Rows[i]["Gvalue"],
                Fun.Rows[i]["GcombinErr"],
                Fun.Rows[i]["ShowStd"],
                Fun.Rows[i]["SHowMeter"],
                Fun.Rows[i]["SHowValueErr"],
                Fun.Rows[i]["MaxR01ibT"],
                Fun.Rows[i]["MaxR1ibT"],
                Fun.Rows[i]["MaxRImaxT"],
                Fun.Rows[i]["RequireT"],
                Fun.Rows[i]["MaxR01ibSV"],
                Fun.Rows[i]["MaxR01ibFV"],
                Fun.Rows[i]["MaxR01ibE"],
                Fun.Rows[i]["MaxR1ibSV"],
                Fun.Rows[i]["MaxR1ibFV"],
                Fun.Rows[i]["MaxR1ibE"],
                Fun.Rows[i]["MaxRImaxSV"],
                Fun.Rows[i]["MaxRImaxFV"],
                Fun.Rows[i]["MaxRImaxE"],
                Fun.Rows[i]["Requirep"],
                Fun.Rows[i]["Requireperr"],
                Fun.Rows[i]["JYZD"],
                Fun.Rows[i]["JYFD"],
                Fun.Rows[i]["JWZD"],
                Fun.Rows[i]["JWFD"],
                Fun.Rows[i]["JW1D"],
                Fun.Rows[i]["JW2D"],
                Fun.Rows[i]["JW3D"],
                Fun.Rows[i]["JW4D"],
                Fun.Rows[i]["FYZD"],
                Fun.Rows[i]["FYFD"],
                Fun.Rows[i]["FWZD"],
                Fun.Rows[i]["FWFD"],
                Fun.Rows[i]["FW1D"],
                Fun.Rows[i]["FW2D"],
                Fun.Rows[i]["FW3D"],
                Fun.Rows[i]["FW4D"],
                Fun.Rows[i]["PYZD"],
                Fun.Rows[i]["PYFD"],
                Fun.Rows[i]["PWZD"],
                Fun.Rows[i]["PWFD"],
                Fun.Rows[i]["PW1D"],
                Fun.Rows[i]["PW2D"],
                Fun.Rows[i]["PW3D"],
                Fun.Rows[i]["PW4D"],
                Fun.Rows[i]["GYZD"],
                Fun.Rows[i]["GYFD"],
                Fun.Rows[i]["GWZD"],
                Fun.Rows[i]["GWFD"],
                Fun.Rows[i]["GW1D"],
                Fun.Rows[i]["GW2D"],
                Fun.Rows[i]["GW3D"],
                Fun.Rows[i]["GW4D"],
                Fun.Rows[i]["ZYZD"],
                Fun.Rows[i]["ZYFD"],
                Fun.Rows[i]["ZWZD"],
                Fun.Rows[i]["ZWFD"],
                Fun.Rows[i]["ZW1D"],
                Fun.Rows[i]["ZW2D"],
                Fun.Rows[i]["ZW3D"],
                Fun.Rows[i]["ZW4D"],
                Fun.Rows[i]["GPSSetTime"],
                Fun.Rows[i]["GPSGetTime"],
                Fun.Rows[i]["EndEj"],
                Fun.Rows[i]["EndEf"],
                Fun.Rows[i]["EndEp"],
                Fun.Rows[i]["EndEg"],
                Fun.Rows[i]["EndE0"],
                Fun.Rows[i]["CombinErr"],
                Fun.Rows[i]["VolDropLimit"],
                Fun.Rows[i]["VolDropPulse"],
                Fun.Rows[i]["MemoRule"],
                Fun.Rows[i]["EventRecord"],
                Fun.Rows[i]["EventClearTimes1"],
                Fun.Rows[i]["EventMeterTime"],
                Fun.Rows[i]["EventClearTimes2"],
                Fun.Rows[i]["EventClearTime2"],
                Fun.Rows[i]["JYZD_S"],
                Fun.Rows[i]["JYFD_S"],
                Fun.Rows[i]["JWZD_S"],
                Fun.Rows[i]["JWFD_S"],
                Fun.Rows[i]["FYZD_S"],
                Fun.Rows[i]["FYFD_S"],
                Fun.Rows[i]["FWZD_S"],
                Fun.Rows[i]["FWFD_S"],
                Fun.Rows[i]["PYZD_S"],
                Fun.Rows[i]["PYFD_S"],
                Fun.Rows[i]["PWZD_S"],
                Fun.Rows[i]["PWFD_S"],
                Fun.Rows[i]["GYZD_S"],
                Fun.Rows[i]["GYFD_S"],
                Fun.Rows[i]["GWZD_S"],
                Fun.Rows[i]["GWFD_S"],
                Fun.Rows[i]["ZYZD_S"],
                Fun.Rows[i]["ZYFD_S"],
                Fun.Rows[i]["ZWZD_S"],
                Fun.Rows[i]["ZWFD_S"],
                Fun.Rows[i]["BeginTime"],
                Fun.Rows[i]["EndTime"],
                Fun.Rows[i]["MaxR005ibSV"],
                Fun.Rows[i]["MaxR005ibFV"],
                Fun.Rows[i]["MaxR005ibE"],
                Fun.Rows[i]["MaxR005ibT"],
                Fun.Rows[i]["RequireperrAve"],
                Fun.Rows[i]["DayErr1"],
                Fun.Rows[i]["DayErr2"],
                Fun.Rows[i]["DayErr3"],
                Fun.Rows[i]["DayErr4"],
                Fun.Rows[i]["DayErr5"],
                Fun.Rows[i]["DayErr6"],
                Fun.Rows[i]["DayErr7"],
                Fun.Rows[i]["DayErr8"],
                Fun.Rows[i]["DayErr9"],
                Fun.Rows[i]["DayErr10"],
                Fun.Rows[i]["DayErrAve"]);
                al.Add(sb.ToString());
                sb.Clear();
            }

            return al;
        }
        public ArrayList Upload_TmpSpecialError(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();

            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO TmpSpecialError (IndexID, iRangeNo, cRange, cError, cAveData, cCIData, cSmax, bOverLimit, cAffectV, cStdCIData, cStdAveData, cConnect, fVoltage, fCurrent, fFrequency, fAngleA, fAngleB, fAngleC, cABCVoltage, cABCCurrent, cLimit, cBCLimit, cLoadName, bFlagTest, iCompare, cXieBo, fLeanAngle, bReverse, iCircles, iTestTimes, ACur, BCur, CCur, AAgl, BAgl, CAgl) VALUES (");
                sb.AppendFormat("{0},{1},'{2}','{3}','{4}','{5}','{6}',{7},'{8}','{9}','{10}','{11}',{12},{13},{14},{15},{16},{17},'{18}','{19}','{20}','{21}','{22}',{23},{24},{25},'{26}',{27},{28},{29},{30},'{31}','{32}','{33}','{34}','{35}')",
                    Fun.Rows[i]["IndexID"],
                    Fun.Rows[i]["iRangeNo"],
                    Fun.Rows[i]["cRange"],
                    Fun.Rows[i]["cError"],
                    Fun.Rows[i]["cAveData"],
                    Fun.Rows[i]["cCIData"],
                    Fun.Rows[i]["cSmax"],
                    Fun.Rows[i]["bOverLimit"],
                    Fun.Rows[i]["cAffectV"],
                    Fun.Rows[i]["cStdCIData"],
                    Fun.Rows[i]["cStdAveData"],
                    Fun.Rows[i]["cConnect"],
                    Fun.Rows[i]["fVoltage"],
                    Fun.Rows[i]["fCurrent"],
                    Fun.Rows[i]["fFrequency"],
                    Fun.Rows[i]["fAngleA"],
                    Fun.Rows[i]["fAngleB"],
                    Fun.Rows[i]["fAngleC"],
                    Fun.Rows[i]["cABCVoltage"],
                    Fun.Rows[i]["cABCCurrent"],
                    Fun.Rows[i]["cLimit"],
                    Fun.Rows[i]["cBCLimit"],
                    Fun.Rows[i]["cLoadName"],
                    Fun.Rows[i]["bFlagTest"],
                    Fun.Rows[i]["iCompare"],
                    Fun.Rows[i]["cXieBo"],
                    Fun.Rows[i]["fLeanAngle"],
                    Fun.Rows[i]["bReverse"],
                    Fun.Rows[i]["iCircles"],
                    Fun.Rows[i]["iTestTimes"],
                    Fun.Rows[i]["ACur"],
                    Fun.Rows[i]["BCur"],
                    Fun.Rows[i]["CCur"],
                    Fun.Rows[i]["AAgl"],
                    Fun.Rows[i]["BAgl"],
                    Fun.Rows[i]["CAgl"]);
                al.Add(sb.ToString());
                sb.Clear();
            }

            return al;
        }

        public ArrayList Upload_dbDtmpData(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();

            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO dbDtmpData (IndexID, Hidetest, Starttest, WalkTest, HideTest1, HideTest2, HideTest3, HideTest4, StartTest1, StartTest2, StartTest3, StartTest4, WalkTest1, WalkTest2, WalkTest3, WalkTest4, StartTime1, StartTime2, StartTime3, StartTime4, StartCurrent1, StartCurrent2, StartCurrent3, StartCurrent4, StartTimeT1, StartTimeT2, StartTimeT3, StartTimeT4, HideTime1, HideTime2, HideTime3, HideTime4, HideVoltage1, HideVoltage2, HideVoltage3, HideVoltage4, HideTimeT1, HideTimeT2, HideTimeT3, HideTimeT4, WalkValue1, WalkValue2, WalkValue3, WalkValue4, WalkValueT1, WalkValueT2, WalkValueT3, WalkValueT4, WalkError1, WalkError2, WalkError3, WalkError4, PulseWidth, PulseWidth1, PulseWidth2, PulseWidth3, PulseWidth4, PulseWidthV1, PulseWidthV2, PulseWidthV3, PulseWidthV4, PulseHeight, PulseHeight1, PulseHeight2, PulseHeight3, PulseHeight4, PulseHeightV1, PulseHeightV2, PulseHeightV3, PulseHeightV4, WalkValueS1, WalkValueS2, WalkValueS3, WalkValueS4, WalkValueE1, WalkValueE2, WalkValueE3, WalkValueE4, WalkError_Pulse1, WalkError_Pulse2, WalkError_Pulse3, WalkError_Pulse4, WalkLimit) VALUES (");
                sb.AppendFormat("{0},'{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}','{11}','{12}','{13}','{14}','{15}','{16}','{17}','{18}','{19}','{20}','{21}','{22}','{23}','{24}','{25}','{26}','{27}','{28}','{29}','{30}','{31}','{32}','{33}','{34}','{35}','{36}','{37}','{38}','{39}','{40}','{41}','{42}','{43}','{44}','{45}','{46}','{47}','{48}','{49}','{50}','{51}','{52}','{53}','{54}','{55}','{56}','{57}','{58}','{59}','{60}','{61}','{62}','{63}','{64}','{65}','{66}','{67}')",

                    Fun.Rows[i]["IndexID"],
                    Fun.Rows[i]["Hidetest"],
                    Fun.Rows[i]["Starttest"],
                    Fun.Rows[i]["WalkTest"],
                    Fun.Rows[i]["HideTest1"],
                    Fun.Rows[i]["HideTest2"],
                    Fun.Rows[i]["HideTest3"],
                    Fun.Rows[i]["HideTest4"],
                    Fun.Rows[i]["StartTest1"],
                    Fun.Rows[i]["StartTest2"],
                    Fun.Rows[i]["StartTest3"],
                    Fun.Rows[i]["StartTest4"],
                    Fun.Rows[i]["WalkTest1"],
                    Fun.Rows[i]["WalkTest2"],
                    Fun.Rows[i]["WalkTest3"],
                    Fun.Rows[i]["WalkTest4"],
                    Fun.Rows[i]["StartTime1"],
                    Fun.Rows[i]["StartTime2"],
                    Fun.Rows[i]["StartTime3"],
                    Fun.Rows[i]["StartTime4"],
                    Fun.Rows[i]["StartCurrent1"],
                    Fun.Rows[i]["StartCurrent2"],
                    Fun.Rows[i]["StartCurrent3"],
                    Fun.Rows[i]["StartCurrent4"],
                    Fun.Rows[i]["StartTimeT1"],
                    Fun.Rows[i]["StartTimeT2"],
                    Fun.Rows[i]["StartTimeT3"],
                    Fun.Rows[i]["StartTimeT4"],
                    Fun.Rows[i]["HideTime1"],
                    Fun.Rows[i]["HideTime2"],
                    Fun.Rows[i]["HideTime3"],
                    Fun.Rows[i]["HideTime4"],
                    Fun.Rows[i]["HideVoltage1"],
                    Fun.Rows[i]["HideVoltage2"],
                    Fun.Rows[i]["HideVoltage3"],
                    Fun.Rows[i]["HideVoltage4"],
                    Fun.Rows[i]["HideTimeT1"],
                    Fun.Rows[i]["HideTimeT2"],
                    Fun.Rows[i]["HideTimeT3"],
                    Fun.Rows[i]["HideTimeT4"],
                    Fun.Rows[i]["WalkValue1"],
                    Fun.Rows[i]["WalkValue2"],
                    Fun.Rows[i]["WalkValue3"],
                    Fun.Rows[i]["WalkValue4"],
                    Fun.Rows[i]["WalkValueT1"],
                    Fun.Rows[i]["WalkValueT2"],
                    Fun.Rows[i]["WalkValueT3"],
                    Fun.Rows[i]["WalkValueT4"],
                    Fun.Rows[i]["WalkError1"],
                    Fun.Rows[i]["WalkError2"],
                    Fun.Rows[i]["WalkError3"],
                    Fun.Rows[i]["WalkError4"],
                    Fun.Rows[i]["PulseWidth"],
                    Fun.Rows[i]["PulseWidth1"],
                    Fun.Rows[i]["PulseWidth2"],
                    Fun.Rows[i]["PulseWidth3"],
                    Fun.Rows[i]["PulseWidth4"],
                    Fun.Rows[i]["PulseWidthV1"],
                    Fun.Rows[i]["PulseWidthV2"],
                    Fun.Rows[i]["PulseWidthV3"],
                    Fun.Rows[i]["PulseWidthV4"],
                    Fun.Rows[i]["PulseHeight"],
                    Fun.Rows[i]["PulseHeight1"],
                    Fun.Rows[i]["PulseHeight2"],
                    Fun.Rows[i]["PulseHeight3"],
                    Fun.Rows[i]["PulseHeight4"],
                    Fun.Rows[i]["PulseHeightV1"],
                    Fun.Rows[i]["PulseHeightV2"],
                    Fun.Rows[i]["PulseHeightV3"],
                    Fun.Rows[i]["PulseHeightV4"],
                    Fun.Rows[i]["WalkValueS1"],
                    Fun.Rows[i]["WalkValueS2"],
                    Fun.Rows[i]["WalkValueS3"],
                    Fun.Rows[i]["WalkValueS4"],
                    Fun.Rows[i]["WalkValueE1"],
                    Fun.Rows[i]["WalkValueE2"],
                    Fun.Rows[i]["WalkValueE3"],
                    Fun.Rows[i]["WalkValueE4"],
                    Fun.Rows[i]["WalkError_Pulse1"],
                    Fun.Rows[i]["WalkError_Pulse2"],
                    Fun.Rows[i]["WalkError_Pulse3"],
                    Fun.Rows[i]["WalkError_Pulse4"],
                    Fun.Rows[i]["WalkLimit"]
                );

                al.Add(sb.ToString());
                sb.Clear();
            }

            return al;
        }

        #endregion
    }
}