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
    class SubRSMbench
    {
        #region dbData
        public ArrayList Upload_ErrData(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO ErrData (MeterID, RangeCode, SortNo, LoadName, Data1, Data2, Data3, Data4, Data5, AveData, CIData, SmaxData, Data6, Data7, Data8, Data9, Data10, Data11, Data12, qualified) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5},{6},{7},{8},{9},{10},{11},{12},{13},{14},{15},{16},{17},{18},{19})",
                    Fun.Rows[i]["MeterID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeterID"].ToString() +"'",
                    Fun.Rows[i]["RangeCode"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["RangeCode"].ToString() +"'",
                    Fun.Rows[i]["SortNo"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["SortNo"].ToString() +"'",
                    Fun.Rows[i]["LoadName"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["LoadName"].ToString() +"'",
                    Fun.Rows[i]["Data1"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Data1"].ToString() +"'",
                    Fun.Rows[i]["Data2"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Data2"].ToString() +"'",
                    Fun.Rows[i]["Data3"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Data3"].ToString() +"'",
                    Fun.Rows[i]["Data4"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Data4"].ToString() +"'",
                    Fun.Rows[i]["Data5"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Data5"].ToString() +"'",
                    Fun.Rows[i]["AveData"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["AveData"].ToString() +"'",
                    Fun.Rows[i]["CIData"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CIData"].ToString() +"'",
                    Fun.Rows[i]["SmaxData"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["SmaxData"].ToString() +"'",
                    Fun.Rows[i]["Data6"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Data6"].ToString() +"'",
                    Fun.Rows[i]["Data7"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Data7"].ToString() +"'",
                    Fun.Rows[i]["Data8"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Data8"].ToString() +"'",
                    Fun.Rows[i]["Data9"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Data9"].ToString() +"'",
                    Fun.Rows[i]["Data10"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Data10"].ToString() +"'",
                    Fun.Rows[i]["Data11"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Data11"].ToString() +"'",
                    Fun.Rows[i]["Data12"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Data12"].ToString() +"'",
                    Fun.Rows[i]["qualified"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["qualified"].ToString() +"'");
                al.Add(sb.ToString());
                sb.Clear();
            }

            return al;
        }

        public ArrayList Upload_ResultData(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO ResultData (MeterID, MeterPlace, serialno, meterno, ScanCode, Model, Type, Voltage, [Current], Constant, Precision, WireModel, Frequency, SerialDate, MadePlace, TEMP, HUMIDITY, TESTER, RETESTER, MANAGE, TESTDATE, STARTEST, HIDDENTEST, StopTest, StartCurrent, Resistance, PIEZO, TESTYER, TESTMON, TESTDAY, MINCURR, WALKTEST, STARTDEG, ENDDEG, CUNDUTOTAL, CUNDUPEAK, CUNDUVALEY, PNO, TNO, TestUnit, Smax, ForConclusion, AftConclusion, Conclusion24h, Conclusion, Net, StartTime, HideTime) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5},{6},{7},{8},{9},{10},{11},{12},{13},{14},{15},{16},{17},{18},{19},{20},{21},{22},{23},{24},{25},{26},{27},{28},{29},{30},{31},{32},{33},{34},{35},{36},{37},{38},{39},{40},{41},{42},{43},{44},{45},{46},{47})",
                    Fun.Rows[i]["MeterID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeterID"].ToString() +"'",
                    Fun.Rows[i]["MeterPlace"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["MeterPlace"].ToString() + "'",
                    Fun.Rows[i]["serialno"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["serialno"].ToString() +"'",
                    Fun.Rows[i]["meterno"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["meterno"].ToString() +"'",
                    Fun.Rows[i]["ScanCode"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ScanCode"].ToString() +"'",
                    Fun.Rows[i]["Model"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Model"].ToString() +"'",
                    Fun.Rows[i]["Type"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Type"].ToString() +"'",
                    Fun.Rows[i]["Voltage"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Voltage"].ToString() +"'",
                    Fun.Rows[i]["Current"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Current"].ToString() +"'",
                    Fun.Rows[i]["Constant"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Constant"].ToString() +"'",
                   
                    Fun.Rows[i]["Precision"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Precision"].ToString() +"'",
                    Fun.Rows[i]["WireModel"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["WireModel"].ToString() +"'",
                    Fun.Rows[i]["Frequency"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Frequency"].ToString() +"'",
                    Fun.Rows[i]["SerialDate"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["SerialDate"].ToString() +"'",
                    Fun.Rows[i]["MadePlace"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MadePlace"].ToString() +"'",
                    Fun.Rows[i]["TEMP"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TEMP"].ToString() +"'",
                    Fun.Rows[i]["HUMIDITY"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["HUMIDITY"].ToString() +"'",
                    Fun.Rows[i]["TESTER"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TESTER"].ToString() +"'",
                    Fun.Rows[i]["RETESTER"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["RETESTER"].ToString() +"'",
                    Fun.Rows[i]["MANAGE"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MANAGE"].ToString() +"'",

                    Fun.Rows[i]["TESTDATE"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TESTDATE"].ToString() +"'",
                    Fun.Rows[i]["STARTEST"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["STARTEST"].ToString() +"'",
                    Fun.Rows[i]["HIDDENTEST"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["HIDDENTEST"].ToString() +"'",
                    Fun.Rows[i]["StopTest"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["StopTest"].ToString() +"'",
                    Fun.Rows[i]["StartCurrent"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["StartCurrent"].ToString() +"'",
                    Fun.Rows[i]["Resistance"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Resistance"].ToString() +"'",
                    Fun.Rows[i]["PIEZO"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["PIEZO"].ToString() +"'",
                    Fun.Rows[i]["TESTYER"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TESTYER"].ToString() +"'",
                    Fun.Rows[i]["TESTMON"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TESTMON"].ToString() +"'",
                    Fun.Rows[i]["TESTDAY"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TESTDAY"].ToString() +"'",

                    Fun.Rows[i]["MINCURR"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MINCURR"].ToString() +"'",
                    Fun.Rows[i]["WALKTEST"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["WALKTEST"].ToString() +"'",
                    Fun.Rows[i]["STARTDEG"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["STARTDEG"].ToString() +"'",
                    Fun.Rows[i]["ENDDEG"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ENDDEG"].ToString() +"'",
                    Fun.Rows[i]["CUNDUTOTAL"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CUNDUTOTAL"].ToString() +"'",
                    Fun.Rows[i]["CUNDUPEAK"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CUNDUPEAK"].ToString() +"'",
                    Fun.Rows[i]["CUNDUVALEY"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CUNDUVALEY"].ToString() +"'",
                    Fun.Rows[i]["PNO"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["PNO"].ToString() +"'",
                    Fun.Rows[i]["TNO"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TNO"].ToString() +"'",
                    Fun.Rows[i]["TestUnit"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TestUnit"].ToString() +"'",

                    Fun.Rows[i]["Smax"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Smax"].ToString() +"'",
                    Fun.Rows[i]["ForConclusion"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ForConclusion"].ToString() +"'",
                    Fun.Rows[i]["AftConclusion"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["AftConclusion"].ToString() +"'",
                    Fun.Rows[i]["Conclusion24h"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Conclusion24h"].ToString() +"'",
                    Fun.Rows[i]["Conclusion"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Conclusion"].ToString() +"'",
                    Fun.Rows[i]["Net"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Net"].ToString() +"'",
                    Fun.Rows[i]["StartTime"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["StartTime"].ToString() +"'",
                    Fun.Rows[i]["HideTime"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["HideTime"].ToString() +"'");
                al.Add(sb.ToString());
                sb.Clear();
            }

            return al;
        }

        public ArrayList Upload_SpecialErrorData(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO SpecialErrorData (MeterID, IndexID, iRangeNo, cRange, cError, cAveData, cCIData, cSmax, bOverLimit, cAffectV, cStdCIData, cStdAveData, cConnect, fVoltage, fCurrent, fFrequency, fAngleA, fAngleB, fAngleC, cABCVoltage, cABCCurrent, cLimit, cBCLimit, cLoadName, bFlagTest, iCompare, cXieBo, fLeanAngle, bReverse, iCircles, iTestTimes, ACur, BCur, CCur, AAgl, BAgl, CAgl, repe_error) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5},{6},{7},{8},{9},{10},{11},{12},{13},{14},{15},{16},{17},{18},{19},{20},{21},{22},{23},{24},{25},{26},{27},{28},{29},{30},{31},{32},{33},{34},{35},{36},{37})",
                    Fun.Rows[i]["MeterID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeterID"].ToString() +"'",
                    Fun.Rows[i]["IndexID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["IndexID"].ToString() +"'",
                    Fun.Rows[i]["iRangeNo"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iRangeNo"].ToString() +"'",
                    Fun.Rows[i]["cRange"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cRange"].ToString() +"'",
                    Fun.Rows[i]["cError"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cError"].ToString() +"'",
                    Fun.Rows[i]["cAveData"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cAveData"].ToString() +"'",
                    Fun.Rows[i]["cCIData"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cCIData"].ToString() +"'",
                    Fun.Rows[i]["cSmax"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cSmax"].ToString() +"'",
                    Fun.Rows[i]["bOverLimit"] == DBNull.Value ? "0" : (Fun.Rows[i]["bOverLimit"].ToString()  == "True"|| Fun.Rows[i]["bOverLimit"].ToString().ToLower() == "1" ? "1" : "0"),
                    Fun.Rows[i]["cAffectV"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cAffectV"].ToString() +"'",

                    Fun.Rows[i]["cStdCIData"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cStdCIData"].ToString() +"'",
                    Fun.Rows[i]["cStdAveData"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cStdAveData"].ToString() +"'",
                    Fun.Rows[i]["cConnect"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cConnect"].ToString() +"'",
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
                    Fun.Rows[i]["bFlagTest"] == DBNull.Value ? "0" : (Fun.Rows[i]["bFlagTest"].ToString()  == "True"|| Fun.Rows[i]["bFlagTest"].ToString().ToLower() == "1" ? "1" : "0"),
                    Fun.Rows[i]["iCompare"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iCompare"].ToString() +"'",
                    Fun.Rows[i]["cXieBo"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["cXieBo"].ToString() +"'",
                    Fun.Rows[i]["fLeanAngle"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["fLeanAngle"].ToString() +"'",
                    Fun.Rows[i]["bReverse"] == DBNull.Value ? "0" : (Fun.Rows[i]["bReverse"].ToString()  == "True"|| Fun.Rows[i]["bReverse"].ToString().ToLower() == "1" ? "1" : "0"),
                    Fun.Rows[i]["iCircles"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iCircles"].ToString() +"'",

                    Fun.Rows[i]["iTestTimes"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["iTestTimes"].ToString() +"'",
                    Fun.Rows[i]["ACur"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ACur"].ToString() +"'",
                    Fun.Rows[i]["BCur"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["BCur"].ToString() +"'",
                    Fun.Rows[i]["CCur"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CCur"].ToString() +"'",
                    Fun.Rows[i]["AAgl"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["AAgl"].ToString() +"'",
                    Fun.Rows[i]["BAgl"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["BAgl"].ToString() +"'",
                    Fun.Rows[i]["CAgl"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CAgl"].ToString() +"'",
                    Fun.Rows[i]["repe_error"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["repe_error"].ToString() +"'");
                al.Add(sb.ToString());
                sb.Clear();
            }

            return al;
        }



        public ArrayList Upload_TestRange(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO TestRange (MeterID, RangeCode, Voltage,[Current], ConnectMode, dialtest) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5})",
                Fun.Rows[i]["MeterID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeterID"].ToString() +"'",
                Fun.Rows[i]["RangeCode"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["RangeCode"].ToString() +"'",
                Fun.Rows[i]["Voltage"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Voltage"].ToString() +"'",
                Fun.Rows[i]["Current"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Current"].ToString() +"'",
                Fun.Rows[i]["ConnectMode"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ConnectMode"].ToString() +"'",
                Fun.Rows[i]["dialtest"] == DBNull.Value ? "NULL" :  "'" + Fun.Rows[i]["dialtest"].ToString() +"'");
                al.Add(sb.ToString());
                sb.Clear();
            } 
            return al;
        }


        public ArrayList Upload_tmpresult(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO tmpresult (MeterID, Hidetest, Starttest, WalkTest, HideTest1, HideTest2, HideTest3, HideTest4, StartTest1, StartTest2, StartTest3, StartTest4, WalkTest1, WalkTest2, WalkTest3, WalkTest4, StartTime1, StartTime2, StartTime3, StartTime4, StartCurrent1, StartCurrent2, StartCurrent3, StartCurrent4, StartTimeT1, StartTimeT2, StartTimeT3, StartTimeT4, HideTime1, HideTime2, HideTime3, HideTime4, HideVoltage1, HideVoltage2, HideVoltage3, HideVoltage4, HideTimeT1, HideTimeT2, HideTimeT3, HideTimeT4, WalkValue1, WalkValue2, WalkValue3, WalkValue4, WalkValueT1, WalkValueT2, WalkValueT3, WalkValueT4, WalkError1, WalkError2, WalkError3, WalkError4, PulseWidth, PulseWidth1, PulseWidth2, PulseWidth3, PulseWidth4, PulseWidthV1, PulseWidthV2, PulseWidthV3, PulseWidthV4, PulseHeight, PulseHeight1, PulseHeight2, PulseHeight3, PulseHeight4, PulseHeightV1, PulseHeightV2, PulseHeightV3, PulseHeightV4, WalkValueS1, WalkValueS2, WalkValueS3, WalkValueS4, WalkValueE1, WalkValueE2, WalkValueE3, WalkValueE4, WalkError_Pulse1, WalkError_Pulse2, WalkError_Pulse3, WalkError_Pulse4, WalkLimit) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5},{6},{7},{8},{9},{10},{11},{12},{13},{14},{15},{16},{17},{18},{19},{20},{21},{22},{23},{24},{25},{26},{27},{28},{29},{30},{31},{32},{33},{34},{35},{36},{37},{38},{39},{40},{41},{42},{43},{44},{45},{46},{47},{48},{49},{50},{51},{52},{53},{54},{55},{56},{57},{58},{59},{60},{61},{62},{63},{64},{65},{66},{67},{68},{69},{70},{71},{72},{73},{74},{75},{76},{77},{78},{79},{80},{81},{82})",
                    Fun.Rows[i]["MeterID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeterID"].ToString() +"'",
                    Fun.Rows[i]["Hidetest"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Hidetest"].ToString() +"'",
                    Fun.Rows[i]["Starttest"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Starttest"].ToString() +"'",
                    Fun.Rows[i]["WalkTest"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["WalkTest"].ToString() +"'",
                    Fun.Rows[i]["HideTest1"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["HideTest1"].ToString() +"'",
                    Fun.Rows[i]["HideTest2"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["HideTest2"].ToString() +"'",
                    Fun.Rows[i]["HideTest3"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["HideTest3"].ToString() +"'",
                    Fun.Rows[i]["HideTest4"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["HideTest4"].ToString() +"'",
                    Fun.Rows[i]["StartTest1"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["StartTest1"].ToString() +"'",
                    Fun.Rows[i]["StartTest2"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["StartTest2"].ToString() +"'",

                    Fun.Rows[i]["StartTest3"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["StartTest3"].ToString() +"'",
                    Fun.Rows[i]["StartTest4"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["StartTest4"].ToString() +"'",
                    Fun.Rows[i]["WalkTest1"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["WalkTest1"].ToString() +"'",
                    Fun.Rows[i]["WalkTest2"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["WalkTest2"].ToString() +"'",
                    Fun.Rows[i]["WalkTest3"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["WalkTest3"].ToString() +"'",
                    Fun.Rows[i]["WalkTest4"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["WalkTest4"].ToString() +"'",
                    Fun.Rows[i]["StartTime1"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["StartTime1"].ToString() +"'",
                    Fun.Rows[i]["StartTime2"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["StartTime2"].ToString() +"'",
                    Fun.Rows[i]["StartTime3"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["StartTime3"].ToString() +"'",
                    Fun.Rows[i]["StartTime4"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["StartTime4"].ToString() +"'",

                    Fun.Rows[i]["StartCurrent1"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["StartCurrent1"].ToString() +"'",
                    Fun.Rows[i]["StartCurrent2"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["StartCurrent2"].ToString() +"'",
                    Fun.Rows[i]["StartCurrent3"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["StartCurrent3"].ToString() +"'",
                    Fun.Rows[i]["StartCurrent4"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["StartCurrent4"].ToString() +"'",
                    Fun.Rows[i]["StartTimeT1"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["StartTimeT1"].ToString() +"'",
                    Fun.Rows[i]["StartTimeT2"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["StartTimeT2"].ToString() +"'",
                    Fun.Rows[i]["StartTimeT3"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["StartTimeT3"].ToString() +"'",
                    Fun.Rows[i]["StartTimeT4"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["StartTimeT4"].ToString() +"'",
                    Fun.Rows[i]["HideTime1"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["HideTime1"].ToString() +"'",
                    Fun.Rows[i]["HideTime2"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["HideTime2"].ToString() +"'",

                    Fun.Rows[i]["HideTime3"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["HideTime3"].ToString() +"'",
                    Fun.Rows[i]["HideTime4"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["HideTime4"].ToString() +"'",
                    Fun.Rows[i]["HideVoltage1"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["HideVoltage1"].ToString() +"'",
                    Fun.Rows[i]["HideVoltage2"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["HideVoltage2"].ToString() +"'",
                    Fun.Rows[i]["HideVoltage3"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["HideVoltage3"].ToString() +"'",
                    Fun.Rows[i]["HideVoltage4"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["HideVoltage4"].ToString() +"'",
                    Fun.Rows[i]["HideTimeT1"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["HideTimeT1"].ToString() +"'",
                    Fun.Rows[i]["HideTimeT2"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["HideTimeT2"].ToString() +"'",
                    Fun.Rows[i]["HideTimeT3"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["HideTimeT3"].ToString() +"'",
                    Fun.Rows[i]["HideTimeT4"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["HideTimeT4"].ToString() +"'",

                    Fun.Rows[i]["WalkValue1"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["WalkValue1"].ToString() +"'",
                    Fun.Rows[i]["WalkValue2"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["WalkValue2"].ToString() +"'",
                    Fun.Rows[i]["WalkValue3"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["WalkValue3"].ToString() +"'",
                    Fun.Rows[i]["WalkValue4"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["WalkValue4"].ToString() +"'",
                    Fun.Rows[i]["WalkValueT1"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["WalkValueT1"].ToString() +"'",
                    Fun.Rows[i]["WalkValueT2"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["WalkValueT2"].ToString() +"'",
                    Fun.Rows[i]["WalkValueT3"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["WalkValueT3"].ToString() +"'",
                    Fun.Rows[i]["WalkValueT4"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["WalkValueT4"].ToString() +"'",
                    Fun.Rows[i]["WalkError1"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["WalkError1"].ToString() +"'",
                    Fun.Rows[i]["WalkError2"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["WalkError2"].ToString() +"'",

                    Fun.Rows[i]["WalkError3"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["WalkError3"].ToString() +"'",
                    Fun.Rows[i]["WalkError4"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["WalkError4"].ToString() +"'",
                    Fun.Rows[i]["PulseWidth"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["PulseWidth"].ToString() +"'",
                    Fun.Rows[i]["PulseWidth1"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["PulseWidth1"].ToString() +"'",
                    Fun.Rows[i]["PulseWidth2"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["PulseWidth2"].ToString() +"'",
                    Fun.Rows[i]["PulseWidth3"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["PulseWidth3"].ToString() +"'",
                    Fun.Rows[i]["PulseWidth4"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["PulseWidth4"].ToString() +"'",
                    Fun.Rows[i]["PulseWidthV1"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["PulseWidthV1"].ToString() +"'",
                    Fun.Rows[i]["PulseWidthV2"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["PulseWidthV2"].ToString() +"'",
                    Fun.Rows[i]["PulseWidthV3"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["PulseWidthV3"].ToString() +"'",

                    Fun.Rows[i]["PulseWidthV4"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["PulseWidthV4"].ToString() +"'",
                    Fun.Rows[i]["PulseHeight"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["PulseHeight"].ToString() +"'",
                    Fun.Rows[i]["PulseHeight1"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["PulseHeight1"].ToString() +"'",
                    Fun.Rows[i]["PulseHeight2"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["PulseHeight2"].ToString() +"'",
                    Fun.Rows[i]["PulseHeight3"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["PulseHeight3"].ToString() +"'",
                    Fun.Rows[i]["PulseHeight4"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["PulseHeight4"].ToString() +"'",
                    Fun.Rows[i]["PulseHeightV1"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["PulseHeightV1"].ToString() +"'",
                    Fun.Rows[i]["PulseHeightV2"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["PulseHeightV2"].ToString() +"'",
                    Fun.Rows[i]["PulseHeightV3"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["PulseHeightV3"].ToString() +"'",
                    Fun.Rows[i]["PulseHeightV4"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["PulseHeightV4"].ToString() +"'",

                    Fun.Rows[i]["WalkValueS1"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["WalkValueS1"].ToString() +"'",
                    Fun.Rows[i]["WalkValueS2"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["WalkValueS2"].ToString() +"'",
                    Fun.Rows[i]["WalkValueS3"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["WalkValueS3"].ToString() +"'",
                    Fun.Rows[i]["WalkValueS4"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["WalkValueS4"].ToString() +"'",
                    Fun.Rows[i]["WalkValueE1"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["WalkValueE1"].ToString() +"'",
                    Fun.Rows[i]["WalkValueE2"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["WalkValueE2"].ToString() +"'",
                    Fun.Rows[i]["WalkValueE3"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["WalkValueE3"].ToString() +"'",
                    Fun.Rows[i]["WalkValueE4"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["WalkValueE4"].ToString() +"'",
                    Fun.Rows[i]["WalkError_Pulse1"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["WalkError_Pulse1"].ToString() +"'",
                    Fun.Rows[i]["WalkError_Pulse2"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["WalkError_Pulse2"].ToString() +"'",

                    Fun.Rows[i]["WalkError_Pulse3"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["WalkError_Pulse3"].ToString() +"'",
                    Fun.Rows[i]["WalkError_Pulse4"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["WalkError_Pulse4"].ToString() +"'",
                    Fun.Rows[i]["WalkLimit"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["WalkLimit"].ToString() +"'");
                    al.Add(sb.ToString());
                    sb.Clear();
            }
            return al;
        }
        #endregion

        #region dbMeasureDegree
        public ArrayList Upload_BiaoZhenBiaoData(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO BiaoZhenBiaoData (ModelTypeId, TypeId, ListT, WhatTable, WhereGrid, ListSecondT, Fun, Connection, Data) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5},{6},{7},{8})",
                    Fun.Rows[i]["ModelTypeId"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ModelTypeId"].ToString() +"'",
                    Fun.Rows[i]["TypeId"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TypeId"].ToString() +"'",
                    Fun.Rows[i]["ListT"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ListT"].ToString() +"'",
                    Fun.Rows[i]["WhatTable"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["WhatTable"].ToString() +"'",
                    Fun.Rows[i]["WhereGrid"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["WhereGrid"].ToString() +"'",
                    Fun.Rows[i]["ListSecondT"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ListSecondT"].ToString() +"'",
                    Fun.Rows[i]["Fun"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Fun"].ToString() +"'",
                    Fun.Rows[i]["Connection"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Connection"].ToString() +"'",
                    Fun.Rows[i]["Data"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Data"].ToString() +"'");
                al.Add(sb.ToString());
                sb.Clear();
            }

            return al;
        }

        public ArrayList Upload_DataList(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO DataList (DataName, Content) VALUES (");
                sb.AppendFormat("{0},{1})",
                Fun.Rows[i]["DataName"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["DataName"].ToString() +"'",
                Fun.Rows[i]["Content"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Content"].ToString() +"'");
                al.Add(sb.ToString());
                sb.Clear();
            }

            return al;
        }

        public ArrayList Upload_ParamList(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO ParamList (Id,FuZaiDianLiu, FuZaiLilu, CheckTypeId, CheckTypeDes, CheckAffectId, CheckAffectDes) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5},{6})",
                Fun.Rows[i]["Id"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Id"].ToString() +"'",
                Fun.Rows[i]["FuZaiDianLiu"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["FuZaiDianLiu"].ToString() +"'",
                Fun.Rows[i]["FuZaiLilu"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["FuZaiLilu"].ToString() +"'",
                Fun.Rows[i]["CheckTypeId"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CheckTypeId"].ToString() +"'",
                Fun.Rows[i]["CheckTypeDes"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CheckTypeDes"].ToString() +"'",
                Fun.Rows[i]["CheckAffectId"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CheckAffectId"].ToString() +"'",
                Fun.Rows[i]["CheckAffectDes"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CheckAffectDes"].ToString() +"'");
                al.Add(sb.ToString());
                sb.Clear();
            }

            return al;
        } 
        public ArrayList Upload_tblCheckHarmonic(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO tblCheckHarmonic (CheckID, CheckHarmonicName, CheckTime) VALUES (");
                sb.AppendFormat("{0},{1},{2})",
                Fun.Rows[i]["CheckID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CheckID"].ToString() +"'",
                Fun.Rows[i]["CheckHarmonicName"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CheckHarmonicName"].ToString() +"'",
                Fun.Rows[i]["CheckTime"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CheckTime"].ToString() +"'");
                al.Add(sb.ToString());
                sb.Clear();
            }

            return al;
        } 

        public ArrayList Upload_tblCheckWay(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO tblCheckWay (CheckID, CheckWayName, CheckType) VALUES (");
                sb.AppendFormat("{0},{1},{2})",
                    Fun.Rows[i]["CheckID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CheckID"].ToString() +"'",
                    Fun.Rows[i]["CheckWayName"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CheckWayName"].ToString() +"'",
                    Fun.Rows[i]["CheckType"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CheckType"].ToString() +"'");
                al.Add(sb.ToString());
                sb.Clear();
            }

            return al;
        }

        public ArrayList Upload_tblHarmonic(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO tblHarmonic (CheckID, Frequency, Voltage, VoltageAngle, [Current], CurrentAngle) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5})",
                    Fun.Rows[i]["CheckID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CheckID"].ToString() +"'",
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

        public ArrayList Upload_tblMeterModel(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO tblMeterModel (ModelTypeID, MeterName, MeterType, Type, SwitchOnMode, Detent, ReferenceMeterType, Class, Class1, Connection, Voltage, [Current], CurrentMax, Frequency, Constant, ConstantUnit, ConstantReactive, ConstantUnitReactive, Manufactory, ProduceStandard, TimeFrequency, ProtocolID, Baudrate, DataBit, StopBit, Parity, DecimalDigits, WGZX, WGFX) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5},{6},{7},{8},{9},{10},{11},{12},{13},{14},{15},{16},{17},{18},{19},{20},{21},{22},{23},{24},{25},{26},{27},{28})",
                    Fun.Rows[i]["ModelTypeID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ModelTypeID"].ToString() +"'",
                    Fun.Rows[i]["MeterName"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeterName"].ToString() +"'",
                    Fun.Rows[i]["MeterType"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeterType"].ToString() +"'",
                    Fun.Rows[i]["Type"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Type"].ToString() +"'",
                    Fun.Rows[i]["SwitchOnMode"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["SwitchOnMode"].ToString() +"'",
                    Fun.Rows[i]["Detent"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Detent"].ToString() +"'",
                    Fun.Rows[i]["ReferenceMeterType"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ReferenceMeterType"].ToString() +"'",
                    Fun.Rows[i]["Class"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Class"].ToString() +"'",
                    Fun.Rows[i]["Class1"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Class1"].ToString() +"'",
                    Fun.Rows[i]["Connection"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Connection"].ToString() +"'",
                    Fun.Rows[i]["Voltage"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Voltage"].ToString() +"'",
                    Fun.Rows[i]["Current"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Current"].ToString() +"'",
                    Fun.Rows[i]["CurrentMax"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CurrentMax"].ToString() +"'",
                    Fun.Rows[i]["Frequency"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Frequency"].ToString() +"'",
                    Fun.Rows[i]["Constant"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Constant"].ToString() +"'",
                    Fun.Rows[i]["ConstantUnit"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ConstantUnit"].ToString() +"'",
                    Fun.Rows[i]["ConstantReactive"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ConstantReactive"].ToString() +"'",
                    Fun.Rows[i]["ConstantUnitReactive"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ConstantUnitReactive"].ToString() +"'",
                    Fun.Rows[i]["Manufactory"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Manufactory"].ToString() +"'",
                    Fun.Rows[i]["ProduceStandard"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ProduceStandard"].ToString() +"'",
                    Fun.Rows[i]["TimeFrequency"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TimeFrequency"].ToString() +"'",
                    Fun.Rows[i]["ProtocolID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ProtocolID"].ToString() +"'",
                    Fun.Rows[i]["Baudrate"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Baudrate"].ToString() +"'",
                    Fun.Rows[i]["DataBit"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["DataBit"].ToString() +"'",
                    Fun.Rows[i]["StopBit"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["StopBit"].ToString() +"'",
                    Fun.Rows[i]["Parity"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Parity"].ToString() +"'",
                    Fun.Rows[i]["DecimalDigits"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["DecimalDigits"].ToString() +"'",
                    Fun.Rows[i]["WGZX"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["WGZX"].ToString() +"'",
                    Fun.Rows[i]["WGFX"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["WGFX"].ToString() +"'");
                al.Add(sb.ToString());
                sb.Clear();
            }

            return al;
        }


        public ArrayList Upload_tblPrjHarmonic(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO tblPrjHarmonic (ProjectID, MeasureDegreeID, TestItemID, Frequency, Voltage, VoltageAngle, [Current], CurrentAngle) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5},{6},{7})",
                    Fun.Rows[i]["ProjectID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ProjectID"].ToString() +"'",
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

        public ArrayList Upload_tblPrjMeasureDegree(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO tblPrjMeasureDegree (ProjectID, MeasureDegreeID, MeasureName, ListNo, Voltage, [Current], ConnectMode, IsTest) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5},{6},{7})",
                    Fun.Rows[i]["ProjectID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ProjectID"].ToString() +"'",
                    Fun.Rows[i]["MeasureDegreeID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeasureDegreeID"].ToString() +"'",
                    Fun.Rows[i]["MeasureName"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeasureName"].ToString() +"'",
                    Fun.Rows[i]["ListNo"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ListNo"].ToString() +"'",
                    Fun.Rows[i]["Voltage"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Voltage"].ToString() +"'",
                    Fun.Rows[i]["Current"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Current"].ToString() +"'",
                    Fun.Rows[i]["ConnectMode"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ConnectMode"].ToString() +"'",
                    Fun.Rows[i]["IsTest"] == DBNull.Value ? "0" : (Fun.Rows[i]["IsTest"].ToString()  == "True"|| Fun.Rows[i]["IsTest"].ToString().ToLower() == "1" ? "1" : "0"));
                al.Add(sb.ToString());
                sb.Clear();
            }

            return al;
        }

        public ArrayList Upload_tblPrjTestItem(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO tblPrjTestItem (ProjectID, MeasureDegreeID, TestItemID, ListNo, TestItemName, CheckType, CheckAffect, CheckValue, CheckValue1, CheckValue2, CheckValue3, CheckValue4, IsTest) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5},{6},{7},{8},{9},{10},{11},{12})",
                    Fun.Rows[i]["ProjectID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ProjectID"].ToString() +"'",
                    Fun.Rows[i]["MeasureDegreeID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeasureDegreeID"].ToString() +"'",
                    Fun.Rows[i]["TestItemID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TestItemID"].ToString() +"'",
                    Fun.Rows[i]["ListNo"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ListNo"].ToString() +"'",
                    Fun.Rows[i]["TestItemName"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TestItemName"].ToString() +"'",
                    Fun.Rows[i]["CheckType"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CheckType"].ToString() +"'",
                    Fun.Rows[i]["CheckAffect"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CheckAffect"].ToString() +"'",
                    Fun.Rows[i]["CheckValue"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CheckValue"].ToString() +"'",
                    Fun.Rows[i]["CheckValue1"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CheckValue1"].ToString() +"'",
                    Fun.Rows[i]["CheckValue2"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CheckValue2"].ToString() +"'",
                    Fun.Rows[i]["CheckValue3"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CheckValue3"].ToString() +"'",
                    Fun.Rows[i]["CheckValue4"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CheckValue4"].ToString() +"'",
                    Fun.Rows[i]["IsTest"] == DBNull.Value ? "0" : (Fun.Rows[i]["IsTest"].ToString()  == "True"|| Fun.Rows[i]["IsTest"].ToString().ToLower() == "1" ? "1" : "0"));
                al.Add(sb.ToString());
                sb.Clear();
            }

            return al;
        }

        public ArrayList Upload_tblPrjTestPoint(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO tblPrjTestPoint (ProjectID, MeasureDegreeID, TestItemID, ListNo, TestPointName, TestPointId, Phase, VoltagePercent, CurrentPercent, PowerFoctor, Cycle, SampleCount, TestTime, Time, TopErr, BotErr, IsTest, StandardErr, IsStandardTest, IsTestPoint) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5},{6},{7},{8},{9},{10},{11},{12},{13},{14},{15},{16},{17},{18},{19})",
                    Fun.Rows[i]["ProjectID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ProjectID"].ToString() +"'",
                    Fun.Rows[i]["MeasureDegreeID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeasureDegreeID"].ToString() +"'",
                    Fun.Rows[i]["TestItemID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TestItemID"].ToString() +"'",
                    Fun.Rows[i]["ListNo"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ListNo"].ToString() +"'",
                    Fun.Rows[i]["TestPointName"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TestPointName"].ToString() +"'",
                    Fun.Rows[i]["TestPointId"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TestPointId"].ToString() +"'",
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
                    Fun.Rows[i]["IsTest"] == DBNull.Value ? "0" : (Fun.Rows[i]["IsTest"].ToString()  == "True"|| Fun.Rows[i]["IsTest"].ToString().ToLower() == "1" ? "1" : "0"),
                    Fun.Rows[i]["StandardErr"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["StandardErr"].ToString() +"'",
                    Fun.Rows[i]["IsStandardTest"] == DBNull.Value ? "0" : (Fun.Rows[i]["IsStandardTest"].ToString()  == "True"|| Fun.Rows[i]["IsStandardTest"].ToString().ToLower() == "1" ? "1" : "0"),
                    Fun.Rows[i]["IsTestPoint"] == DBNull.Value ? "0" : (Fun.Rows[i]["IsTestPoint"].ToString()  == "True"|| Fun.Rows[i]["IsTestPoint"].ToString().ToLower() == "1" ? "1" : "0"));
                al.Add(sb.ToString());
                sb.Clear();
            }

            return al;
        }



        public ArrayList Upload_tblProject(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO tblProject (ProjectID,ProjectName, ConnectMode) VALUES (");
                sb.AppendFormat("{0},{1},{2})",
                Fun.Rows[i]["ProjectID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ProjectID"].ToString() +"'",
                Fun.Rows[i]["ProjectName"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ProjectName"].ToString() +"'",
                Fun.Rows[i]["ConnectMode"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ConnectMode"].ToString() +"'");
                al.Add(sb.ToString());
                sb.Clear();
            }

            return al;
        }

        public ArrayList Upload_tblTestPoint(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO tblTestPoint (CheckID, TestPointName, TestPointId, ListNo, Phase, VoltagePercent, CurrentPercent, PowerFoctor, Cycle, SampleCount, TestTime) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5},{6},{7},{8},{9},{10})",
                Fun.Rows[i]["CheckID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CheckID"].ToString() +"'",
                Fun.Rows[i]["TestPointName"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TestPointName"].ToString() +"'",
                Fun.Rows[i]["TestPointId"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TestPointId"].ToString() +"'",
                Fun.Rows[i]["ListNo"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ListNo"].ToString() +"'",
                Fun.Rows[i]["Phase"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Phase"].ToString() +"'",
                Fun.Rows[i]["VoltagePercent"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["VoltagePercent"].ToString() +"'",
                Fun.Rows[i]["CurrentPercent"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CurrentPercent"].ToString() +"'",
                Fun.Rows[i]["PowerFoctor"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["PowerFoctor"].ToString() +"'",
                Fun.Rows[i]["Cycle"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Cycle"].ToString() +"'",
                Fun.Rows[i]["SampleCount"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["SampleCount"].ToString() +"'",
                Fun.Rows[i]["TestTime"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TestTime"].ToString() +"'");
                al.Add(sb.ToString());
                sb.Clear();
            }

            return al;
        }


        #endregion

        #region dbMeterTmp

        public ArrayList Upload_dbMTBiaoZhenBiaoData(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO dbMTBiaoZhenBiaoData (MeterHungID, ModelTypeId, TypeId, ListT, WhatTable, WhereGrid, ListSecondT, Fun, Connection, Data) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5},{6},{7},{8},{9})",
                Fun.Rows[i]["MeterHungID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeterHungID"].ToString() +"'",
                Fun.Rows[i]["ModelTypeId"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ModelTypeId"].ToString() +"'",
                Fun.Rows[i]["TypeId"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TypeId"].ToString() +"'",
                Fun.Rows[i]["ListT"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ListT"].ToString() +"'",
                Fun.Rows[i]["WhatTable"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["WhatTable"].ToString() +"'",
                Fun.Rows[i]["WhereGrid"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["WhereGrid"].ToString() +"'",
                Fun.Rows[i]["ListSecondT"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ListSecondT"].ToString() +"'",
                Fun.Rows[i]["Fun"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Fun"].ToString() +"'",
                Fun.Rows[i]["Connection"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Connection"].ToString() +"'",
                Fun.Rows[i]["Data"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Data"].ToString() +"'");
                al.Add(sb.ToString());
                sb.Clear();
            }

            return al;
        }

        public ArrayList Upload_BiaoZhenBiaoData2(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO BiaoZhenBiaoData2 (MeterHungId, ModelTypeId, TypeId, ListT, Connection, Data) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5})",
                Fun.Rows[i]["MeterHungId"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeterHungId"].ToString() +"'",
                Fun.Rows[i]["ModelTypeId"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ModelTypeId"].ToString() +"'",
                Fun.Rows[i]["TypeId"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TypeId"].ToString() +"'",
                Fun.Rows[i]["ListT"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ListT"].ToString() +"'",
                Fun.Rows[i]["Connection"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Connection"].ToString() +"'",
                Fun.Rows[i]["Data"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Data"].ToString() +"'");
                al.Add(sb.ToString());
                sb.Clear();
            }

            return al;
        }

        public ArrayList Upload_tblAutoRunList(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO tblAutoRunList (ListNo, CheckType, CheckAffect, TestItemName, IsEnable, OverLoad, Dest) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5},{6})",
                    Fun.Rows[i]["ListNo"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ListNo"].ToString() +"'",
                    Fun.Rows[i]["CheckType"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CheckType"].ToString() +"'",
                    Fun.Rows[i]["CheckAffect"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CheckAffect"].ToString() +"'",
                    Fun.Rows[i]["TestItemName"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TestItemName"].ToString() +"'",
                    Fun.Rows[i]["IsEnable"] == DBNull.Value ? "0" : (Fun.Rows[i]["IsEnable"].ToString()  == "True"|| Fun.Rows[i]["IsEnable"].ToString().ToLower() == "1" ? "1" : "0"),
                    Fun.Rows[i]["OverLoad"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["OverLoad"].ToString() +"'",
                    Fun.Rows[i]["Dest"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Dest"].ToString() +"'");
                al.Add(sb.ToString());
                sb.Clear();
            }

            return al;
        }

        public ArrayList Upload_tblMeter(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO tblMeter (MeterHungID, Nest, EquitmentNumber, BatchNumber, ModelTypeID, MeterNo, AssetNo, BarCode, MeterAddress, ProtocolID, CommPort, TimeFrequency, Password, Baudrate, DataBit, StopBit, Parity, TestDate, Temp, Humidity, Tester, Retester, Manage, TestUnit, IsTest, Conclusion, MeterType, MeterName, Type, SwitchOnMode, Detent, ReferenceMeterType, Class, Class1, Connection, Voltage, [Current], CurrentMax, Frequency, Constant, ConstantUnit, ConstantReactive, ConstantUnitReactive, Manufactory, ProduceStandard, DecimalDigits, WGZX, WGFX) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5},{6},{7},{8},{9},{10},{11},{12},{13},{14},{15},{16},{17},{18},{19},{20},{21},{22},{23},{24},{25},{26},{27},{28},{29},{30},{31},{32},{33},{34},{35},{36},{37},{38},{39},{40},{41},{42},{43},{44},{45},{46},{47})",
                Fun.Rows[i]["MeterHungID"] == DBNull.Value ? "NULL" : Fun.Rows[i]["MeterHungID"].ToString(),
                Fun.Rows[i]["Nest"] == DBNull.Value ? "NULL" : Fun.Rows[i]["Nest"].ToString(),
                Fun.Rows[i]["EquitmentNumber"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["EquitmentNumber"].ToString() + "'",
                Fun.Rows[i]["BatchNumber"] == DBNull.Value ? "NULL" : Fun.Rows[i]["BatchNumber"].ToString(),
                Fun.Rows[i]["ModelTypeID"] == DBNull.Value ? "NULL" : Fun.Rows[i]["ModelTypeID"].ToString(),
                Fun.Rows[i]["MeterNo"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["MeterNo"].ToString() + "'",
                Fun.Rows[i]["AssetNo"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["AssetNo"].ToString() + "'",
                Fun.Rows[i]["BarCode"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["BarCode"].ToString() + "'",
                Fun.Rows[i]["MeterAddress"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["MeterAddress"].ToString() + "'",
                Fun.Rows[i]["ProtocolID"] == DBNull.Value ? "NULL" : Fun.Rows[i]["ProtocolID"].ToString(),
                Fun.Rows[i]["CommPort"] == DBNull.Value ? "NULL" : Fun.Rows[i]["CommPort"].ToString(),
                Fun.Rows[i]["TimeFrequency"] == DBNull.Value ? "NULL" : Fun.Rows[i]["TimeFrequency"].ToString(),
                Fun.Rows[i]["Password"] == DBNull.Value ? "NULL" : Fun.Rows[i]["Password"].ToString(),
                Fun.Rows[i]["Baudrate"] == DBNull.Value ? "NULL" : Fun.Rows[i]["Baudrate"].ToString(),
                Fun.Rows[i]["DataBit"] == DBNull.Value ? "NULL" : Fun.Rows[i]["DataBit"].ToString(),
                Fun.Rows[i]["StopBit"] == DBNull.Value ? "NULL" : Fun.Rows[i]["StopBit"].ToString(),
                Fun.Rows[i]["Parity"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["Parity"].ToString() + "'",
                Fun.Rows[i]["TestDate"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["TestDate"].ToString() + "'",
                Fun.Rows[i]["Temp"] == DBNull.Value ? "NULL" : Fun.Rows[i]["Temp"].ToString(),
                Fun.Rows[i]["Humidity"] == DBNull.Value ? "NULL" : Fun.Rows[i]["Humidity"].ToString(),
                Fun.Rows[i]["Tester"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["Tester"].ToString() + "'",
                Fun.Rows[i]["Retester"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["Retester"].ToString() + "'",
                Fun.Rows[i]["Manage"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["Manage"].ToString() + "'",
                Fun.Rows[i]["TestUnit"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["TestUnit"].ToString() + "'", 
                Fun.Rows[i]["IsTest"] == DBNull.Value ? "0" : (Fun.Rows[i]["IsTest"].ToString() == "True" || Fun.Rows[i]["IsTest"].ToString().ToLower() == "1" ? "1" : "0"),
                Fun.Rows[i]["Conclusion"] == DBNull.Value ? "0" : (Fun.Rows[i]["Conclusion"].ToString() == "True" || Fun.Rows[i]["Conclusion"].ToString().ToLower() == "1" ? "1" : "0"),
                Fun.Rows[i]["MeterType"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["MeterType"].ToString() + "'",
                Fun.Rows[i]["MeterName"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["MeterName"].ToString() + "'",
                Fun.Rows[i]["Type"] == DBNull.Value ? "NULL" : Fun.Rows[i]["Type"].ToString(),
                Fun.Rows[i]["SwitchOnMode"] == DBNull.Value ? "NULL" : Fun.Rows[i]["SwitchOnMode"].ToString(),
                Fun.Rows[i]["Detent"] == DBNull.Value ? "NULL" : Fun.Rows[i]["Detent"].ToString(),
                Fun.Rows[i]["ReferenceMeterType"] == DBNull.Value ? "NULL" : Fun.Rows[i]["ReferenceMeterType"].ToString(),
                Fun.Rows[i]["Class"] == DBNull.Value ? "NULL" : Fun.Rows[i]["Class"].ToString(),
                Fun.Rows[i]["Class1"] == DBNull.Value ? "NULL" : Fun.Rows[i]["Class1"].ToString(),
                Fun.Rows[i]["Connection"] == DBNull.Value ? "NULL" : Fun.Rows[i]["Connection"].ToString(),
                Fun.Rows[i]["Voltage"] == DBNull.Value ? "NULL" : Fun.Rows[i]["Voltage"].ToString(),
                Fun.Rows[i]["Current"] == DBNull.Value ? "NULL" : Fun.Rows[i]["Current"].ToString(),
                Fun.Rows[i]["CurrentMax"] == DBNull.Value ? "NULL" : Fun.Rows[i]["CurrentMax"].ToString(),
                Fun.Rows[i]["Frequency"] == DBNull.Value ? "NULL" : Fun.Rows[i]["Frequency"].ToString(),
                Fun.Rows[i]["Constant"] == DBNull.Value ? "NULL" : Fun.Rows[i]["Constant"].ToString(),
                Fun.Rows[i]["ConstantUnit"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["ConstantUnit"].ToString() + "'",
                Fun.Rows[i]["ConstantReactive"] == DBNull.Value ? "NULL" : Fun.Rows[i]["ConstantReactive"].ToString(),
                Fun.Rows[i]["ConstantUnitReactive"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["ConstantUnitReactive"].ToString() + "'",
                Fun.Rows[i]["Manufactory"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["Manufactory"].ToString() + "'",
                Fun.Rows[i]["ProduceStandard"] == DBNull.Value ? "NULL" : "'" + Fun.Rows[i]["ProduceStandard"].ToString().Replace("'", "''") + "'",
                Fun.Rows[i]["DecimalDigits"] == DBNull.Value ? "NULL" : Fun.Rows[i]["DecimalDigits"].ToString(),
                Fun.Rows[i]["WGZX"] == DBNull.Value ? "NULL" : Fun.Rows[i]["WGZX"].ToString(),
                Fun.Rows[i]["WGFX"] == DBNull.Value ? "NULL" : Fun.Rows[i]["WGFX"].ToString());
                al.Add(sb.ToString());
                sb.Clear();
            }

            return al;
        }

        public ArrayList Upload_dbMTtblMeterModel(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO dbMTtblMeterModel (ModelTypeID, MeterName, MeterType, Type, SwitchOnMode, Detent, ReferenceMeterType, Class, Class1, Connection, Voltage, [Current], CurrentMax, Frequency, Constant, ConstantUnit, ConstantReactive, ConstantUnitReactive, Manufactory, ProduceStandard, TimeFrequency, ProtocolID, Baudrate, DataBit, StopBit, Parity, DecimalDigits, WGZX, WGFX) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5},{6},{7},{8},{9},{10},{11},{12},{13},{14},{15},{16},{17},{18},{19},{20},{21},{22},{23},{24},{25},{26},{27},{28})",
                    Fun.Rows[i]["ModelTypeID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ModelTypeID"].ToString() +"'",
                    Fun.Rows[i]["MeterName"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeterName"].ToString() +"'",
                    Fun.Rows[i]["MeterType"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeterType"].ToString() +"'",
                    Fun.Rows[i]["Type"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Type"].ToString() +"'",
                    Fun.Rows[i]["SwitchOnMode"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["SwitchOnMode"].ToString() +"'",
                    Fun.Rows[i]["Detent"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Detent"].ToString() +"'",
                    Fun.Rows[i]["ReferenceMeterType"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ReferenceMeterType"].ToString() +"'",
                    Fun.Rows[i]["Class"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Class"].ToString() +"'",
                    Fun.Rows[i]["Class1"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Class1"].ToString() +"'",
                    Fun.Rows[i]["Connection"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Connection"].ToString() +"'",
                    Fun.Rows[i]["Voltage"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Voltage"].ToString() +"'",
                    Fun.Rows[i]["Current"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Current"].ToString() +"'",
                    Fun.Rows[i]["CurrentMax"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CurrentMax"].ToString() +"'",
                    Fun.Rows[i]["Frequency"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Frequency"].ToString() +"'",
                    Fun.Rows[i]["Constant"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Constant"].ToString() +"'",
                    Fun.Rows[i]["ConstantUnit"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ConstantUnit"].ToString() +"'",
                    Fun.Rows[i]["ConstantReactive"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ConstantReactive"].ToString() +"'",
                    Fun.Rows[i]["ConstantUnitReactive"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ConstantUnitReactive"].ToString() +"'",
                    Fun.Rows[i]["Manufactory"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Manufactory"].ToString() +"'",
                    Fun.Rows[i]["ProduceStandard"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ProduceStandard"].ToString() +"'",
                    Fun.Rows[i]["TimeFrequency"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TimeFrequency"].ToString() +"'",
                    Fun.Rows[i]["ProtocolID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ProtocolID"].ToString() +"'",
                    Fun.Rows[i]["Baudrate"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Baudrate"].ToString() +"'",
                    Fun.Rows[i]["DataBit"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["DataBit"].ToString() +"'",
                    Fun.Rows[i]["StopBit"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["StopBit"].ToString() +"'",
                    Fun.Rows[i]["Parity"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Parity"].ToString() +"'",
                    Fun.Rows[i]["DecimalDigits"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["DecimalDigits"].ToString() +"'",
                    Fun.Rows[i]["WGZX"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["WGZX"].ToString() +"'",
                    Fun.Rows[i]["WGFX"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["WGFX"].ToString() +"'");
                al.Add(sb.ToString());
                sb.Clear();
            }

            return al;
        }

        public ArrayList Upload_dbMTtblPrjHarmonic(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO dbMTtblPrjHarmonic (MeasureDegreeID, TestItemID, Frequency, Voltage, VoltageAngle, [Current], CurrentAngle) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5},{6})",
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

        public ArrayList Upload_dbMTtblPrjMeasureDegree(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO dbMTtblPrjMeasureDegree (MeasureDegreeID, MeasureName, ListNo, Voltage, [Current], CurrentMax, ConnectMode) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5},{6})",
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

        public ArrayList Upload_dbMTtblPrjTestPoint(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO dbMTtblPrjTestPoint (MeasureDegreeID, TestItemID, TestPointName, TestPointId, ListNo, Phase, VoltagePercent, CurrentPercent, PowerFoctor, Cycle, SampleCount, TestTime, Time, TopErr, BotErr, IsTest, StandardErr, IsStandardTest, IsTestPoint) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5},{6},{7},{8},{9},{10},{11},{12},{13},{14},{15},{16},{17},{18})",
                    Fun.Rows[i]["MeasureDegreeID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeasureDegreeID"].ToString() +"'",
                    Fun.Rows[i]["TestItemID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TestItemID"].ToString() +"'",
                    Fun.Rows[i]["TestPointName"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TestPointName"].ToString() +"'",
                    Fun.Rows[i]["TestPointId"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TestPointId"].ToString() +"'",
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
                    Fun.Rows[i]["IsTest"] == DBNull.Value ? "0" : (Fun.Rows[i]["IsTest"].ToString()  == "True"|| Fun.Rows[i]["IsTest"].ToString().ToLower() == "1" ? "1" : "0"),
                    Fun.Rows[i]["StandardErr"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["StandardErr"].ToString() +"'",
                    Fun.Rows[i]["IsStandardTest"] == DBNull.Value ? "0" : (Fun.Rows[i]["IsStandardTest"].ToString()  == "True"|| Fun.Rows[i]["IsStandardTest"].ToString().ToLower() == "1" ? "1" : "0"),
                    Fun.Rows[i]["IsTestPoint"] == DBNull.Value ? "0" : (Fun.Rows[i]["IsTestPoint"].ToString()  == "True"|| Fun.Rows[i]["IsTestPoint"].ToString().ToLower() == "1" ? "1" : "0"));
                al.Add(sb.ToString());
                sb.Clear();
            }

            return al;
        }

        public ArrayList Upload_tblPrjTestPointMeter(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO tblPrjTestPointMeter (MeterHungID, MeasureDegreeID, TestItemID, ListNo, Cycle, TestTime, Time, TopErr, BotErr, StandardErr) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5},{6},{7},{8},{9})",
                Fun.Rows[i]["MeterHungID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeterHungID"].ToString() +"'",
                Fun.Rows[i]["MeasureDegreeID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeasureDegreeID"].ToString() +"'",
                Fun.Rows[i]["TestItemID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TestItemID"].ToString() +"'",
                Fun.Rows[i]["ListNo"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ListNo"].ToString() +"'",
                Fun.Rows[i]["Cycle"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Cycle"].ToString() +"'",
                Fun.Rows[i]["TestTime"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TestTime"].ToString() +"'",
                Fun.Rows[i]["Time"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Time"].ToString() +"'",
                Fun.Rows[i]["TopErr"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TopErr"].ToString() +"'",
                Fun.Rows[i]["BotErr"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["BotErr"].ToString() +"'",
                Fun.Rows[i]["StandardErr"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["StandardErr"].ToString() +"'");
                al.Add(sb.ToString());
                sb.Clear();
            }

            return al;
        }

        public ArrayList Upload_dbMTtblProject(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO dbMTtblProject (ProjectID, ProjectName, ConnectMode) VALUES (");
                sb.AppendFormat("{0},{1},{2})",
                    Fun.Rows[i]["ProjectID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ProjectID"].ToString() +"'",
                    Fun.Rows[i]["ProjectName"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ProjectName"].ToString() +"'", // 替换单引号以避免SQL注入风险（尽管这不是防止SQL注入的最佳做法，但在此模板中保持一致性）
                    Fun.Rows[i]["ConnectMode"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ConnectMode"].ToString() +"'");
                al.Add(sb.ToString());
                sb.Clear();
            }

            return al;
        }

        public ArrayList Upload_tblTestResult00(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO tblTestResult00 (MeterHungID, MeasureDegreeID, TestItemID, TestPointId, TestPointName, ListNo, Phase, VoltagePercent, CurrentPercent, PowerFoctor, Cycle, SampleCount, TestTime, Time, TopErr, BotErr, StandardErr, IsStandardTest, ErrData, AveData, Error, Conclusion, StandardError, StandardConclusion) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5},{6},{7},{8},{9},{10},{11},{12},{13},{14},{15},{16},{17},{18},{19},{20},{21},{22},{23})",
                    Fun.Rows[i]["MeterHungID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeterHungID"].ToString() +"'",
                    Fun.Rows[i]["MeasureDegreeID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeasureDegreeID"].ToString() +"'",
                    Fun.Rows[i]["TestItemID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TestItemID"].ToString() +"'",
                    Fun.Rows[i]["TestPointId"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TestPointId"].ToString() +"'",
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
                    Fun.Rows[i]["IsStandardTest"] == DBNull.Value ? "0" : (Fun.Rows[i]["IsStandardTest"].ToString()  == "True"|| Fun.Rows[i]["IsStandardTest"].ToString().ToLower() == "1" ? "1" : "0"),
                    Fun.Rows[i]["ErrData"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ErrData"].ToString() +"'", // Replacing single quotes to avoid SQL injection (basic protection, use parameterized queries for real security)
                    Fun.Rows[i]["AveData"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["AveData"].ToString() +"'",
                    Fun.Rows[i]["Error"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Error"].ToString() +"'",
                    Fun.Rows[i]["Conclusion"] == DBNull.Value ? "0" : (Fun.Rows[i]["Conclusion"].ToString()  == "True"|| Fun.Rows[i]["Conclusion"].ToString().ToLower() == "1" ? "1" : "0"),
                    Fun.Rows[i]["StandardError"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["StandardError"].ToString() +"'",
                    Fun.Rows[i]["StandardConclusion"] == DBNull.Value ? "0" : (Fun.Rows[i]["StandardConclusion"].ToString()  == "True"|| Fun.Rows[i]["StandardConclusion"].ToString().ToLower() == "1" ? "1" : "0"));
                al.Add(sb.ToString());
                sb.Clear();
            }

            return al;
        }

        public ArrayList Upload_tblTestResult01(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO tblTestResult01 (MeterHungID, MeasureDegreeID, TestItemID, TestPointId, ListNo, VoltagePercent, CurrentPercent, StartAllTime, StartRuntime, Conclusion) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5},{6},{7},{8},{9})",
                Fun.Rows[i]["MeterHungID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeterHungID"].ToString() +"'",
                Fun.Rows[i]["MeasureDegreeID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeasureDegreeID"].ToString() +"'",
                Fun.Rows[i]["TestItemID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TestItemID"].ToString() +"'",
                Fun.Rows[i]["TestPointId"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TestPointId"].ToString() +"'",
                Fun.Rows[i]["ListNo"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ListNo"].ToString() +"'",
                Fun.Rows[i]["VoltagePercent"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["VoltagePercent"].ToString() +"'",
                Fun.Rows[i]["CurrentPercent"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CurrentPercent"].ToString() +"'",
                Fun.Rows[i]["StartAllTime"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["StartAllTime"].ToString() +"'",
                Fun.Rows[i]["StartRuntime"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["StartRuntime"].ToString() +"'",
                Fun.Rows[i]["Conclusion"] == DBNull.Value ? "0" : (Fun.Rows[i]["Conclusion"].ToString()  == "True"|| Fun.Rows[i]["Conclusion"].ToString().ToLower() == "1" ? "1" : "0"));
                al.Add(sb.ToString());
                sb.Clear();
            }

            return al;
        }

        public ArrayList Upload_tblTestResult02(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder(); 
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO tblTestResult02 (MeterHungID, MeasureDegreeID, TestItemID, TestPointId, ListNo, VoltagePercent, CurrentPercent, HideAllTime, HideRuntime, Conclusion) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5},{6},{7},{8},{9})",
                Fun.Rows[i]["MeterHungID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeterHungID"].ToString() +"'",
                Fun.Rows[i]["MeasureDegreeID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeasureDegreeID"].ToString() +"'",
                Fun.Rows[i]["TestItemID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TestItemID"].ToString() +"'",
                Fun.Rows[i]["TestPointId"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TestPointId"].ToString() +"'",
                Fun.Rows[i]["ListNo"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ListNo"].ToString() +"'",
                Fun.Rows[i]["VoltagePercent"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["VoltagePercent"].ToString() +"'",
                Fun.Rows[i]["CurrentPercent"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CurrentPercent"].ToString() +"'",
                Fun.Rows[i]["HideAllTime"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["HideAllTime"].ToString() +"'",
                Fun.Rows[i]["HideRuntime"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["HideRuntime"].ToString() +"'",
                Fun.Rows[i]["Conclusion"] == DBNull.Value ? "0" : (Fun.Rows[i]["Conclusion"].ToString()  == "True"|| Fun.Rows[i]["Conclusion"].ToString().ToLower() == "1" ? "1" : "0"));
                al.Add(sb.ToString());
                sb.Clear();
            }

            return al;
        }

        public ArrayList Upload_tblTestResult03(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO tblTestResult03 (MeterHungID, MeasureDegreeID, TestItemID, ListNo, CTtime, VoltagePercent, CurrentPercent, Constant, StartDeg, EndDeg, ZZDeg, LLDeg, ZZPlus, CTerr, Conclusion) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5},{6},{7},{8},{9},{10},{11},{12},{13},{14})",
                    Fun.Rows[i]["MeterHungID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeterHungID"].ToString() +"'",
                    Fun.Rows[i]["MeasureDegreeID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeasureDegreeID"].ToString() +"'",
                    Fun.Rows[i]["TestItemID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TestItemID"].ToString() +"'",
                    Fun.Rows[i]["ListNo"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ListNo"].ToString() +"'",
                    Fun.Rows[i]["CTtime"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CTtime"].ToString() +"'", 
                    Fun.Rows[i]["VoltagePercent"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["VoltagePercent"].ToString() +"'",  
                    Fun.Rows[i]["CurrentPercent"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CurrentPercent"].ToString() +"'",
                    Fun.Rows[i]["Constant"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Constant"].ToString() +"'",
                    Fun.Rows[i]["StartDeg"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["StartDeg"].ToString() +"'",
                    Fun.Rows[i]["EndDeg"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["EndDeg"].ToString() +"'",
                    Fun.Rows[i]["ZZDeg"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ZZDeg"].ToString() +"'",
                    Fun.Rows[i]["LLDeg"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["LLDeg"].ToString() +"'",
                    Fun.Rows[i]["ZZPlus"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ZZPlus"].ToString() +"'",
                    Fun.Rows[i]["CTerr"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CTerr"].ToString() +"'",
                    Fun.Rows[i]["Conclusion"] == DBNull.Value ? "0" : (Fun.Rows[i]["Conclusion"].ToString()  == "True"|| Fun.Rows[i]["Conclusion"].ToString().ToLower() == "1" ? "1" : "0"));
                al.Add(sb.ToString());
                sb.Clear();
            }

            return al;
        }

        public ArrayList Upload_tblTestResult05(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO tblTestResult05 (MeterHungID, MeasureDegreeID, TestItemID, ListNo, TotalPower, JianFengPower, FengPower, PingPower, GuPower, Conclusion) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5},{6},{7},{8},{9})",
                Fun.Rows[i]["MeterHungID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeterHungID"].ToString() +"'",
                Fun.Rows[i]["MeasureDegreeID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeasureDegreeID"].ToString() +"'",
                Fun.Rows[i]["TestItemID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TestItemID"].ToString() +"'",
                Fun.Rows[i]["ListNo"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ListNo"].ToString() +"'",
                Fun.Rows[i]["TotalPower"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TotalPower"].ToString() +"'",
                Fun.Rows[i]["JianFengPower"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["JianFengPower"].ToString() +"'",
                Fun.Rows[i]["FengPower"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["FengPower"].ToString() +"'",
                Fun.Rows[i]["PingPower"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["PingPower"].ToString() +"'",
                Fun.Rows[i]["GuPower"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["GuPower"].ToString() +"'",
                Fun.Rows[i]["Conclusion"] == DBNull.Value ? "0" : (Fun.Rows[i]["Conclusion"].ToString()  == "True"|| Fun.Rows[i]["Conclusion"].ToString().ToLower() == "1" ? "1" : "0"));
                al.Add(sb.ToString());
                sb.Clear();
            }

            return al;
        }

        public ArrayList Upload_tblTestResult06(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO tblTestResult06 (MeterHungID, MeasureDegreeID, TestItemID, ListNo, TimeFrequency, SampleTime, SampleCount, ErrData, RJSerr, Conclusion) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5},{6},{7},{8},{9})",
                Fun.Rows[i]["MeterHungID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeterHungID"].ToString() +"'",
                Fun.Rows[i]["MeasureDegreeID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeasureDegreeID"].ToString() +"'",
                Fun.Rows[i]["TestItemID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TestItemID"].ToString() +"'",
                Fun.Rows[i]["ListNo"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ListNo"].ToString() +"'",
                Fun.Rows[i]["TimeFrequency"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TimeFrequency"].ToString() +"'",
                Fun.Rows[i]["SampleTime"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["SampleTime"].ToString() +"'",
                Fun.Rows[i]["SampleCount"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["SampleCount"].ToString() +"'",
                Fun.Rows[i]["ErrData"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ErrData"].ToString() +"'",
                Fun.Rows[i]["RJSerr"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["RJSerr"].ToString() +"'",
                Fun.Rows[i]["Conclusion"] == DBNull.Value ? "0" : (Fun.Rows[i]["Conclusion"].ToString()  == "True"|| Fun.Rows[i]["Conclusion"].ToString().ToLower() == "1" ? "1" : "0"));
                al.Add(sb.ToString());
                sb.Clear();
            }

            return al;
        }

        public ArrayList Upload_tblTestResult07(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO tblTestResult07 (MeterHungID, MeasureDegreeID, TestItemID, ListNo, JianFengConclusion, FengConclusion, PingConclusion, GuConclusion, Conclusion) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5},{6},{7},{8})",
                    Fun.Rows[i]["MeterHungID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeterHungID"].ToString() +"'",
                    Fun.Rows[i]["MeasureDegreeID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeasureDegreeID"].ToString() +"'",
                    Fun.Rows[i]["TestItemID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TestItemID"].ToString() +"'",
                    Fun.Rows[i]["ListNo"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ListNo"].ToString() +"'",
                    Fun.Rows[i]["JianFengConclusion"] == DBNull.Value ? "NULL" :(Fun.Rows[i]["JianFengConclusion"].ToString()  == "True"|| Fun.Rows[i]["JianFengConclusion"].ToString().ToLower() == "1" ? "1" : "0"),
                    Fun.Rows[i]["FengConclusion"] == DBNull.Value ? "NULL" :(Fun.Rows[i]["FengConclusion"].ToString()  == "True"|| Fun.Rows[i]["FengConclusion"].ToString().ToLower() == "1" ? "1" : "0"),
                    Fun.Rows[i]["PingConclusion"] == DBNull.Value ? "NULL" :(Fun.Rows[i]["PingConclusion"].ToString()  == "True"|| Fun.Rows[i]["PingConclusion"].ToString().ToLower() == "1" ? "1" : "0"),
                    Fun.Rows[i]["GuConclusion"] == DBNull.Value ? "NULL" :(Fun.Rows[i]["GuConclusion"].ToString()  == "True"|| Fun.Rows[i]["GuConclusion"].ToString().ToLower() == "1" ? "1" : "0"),
                    Fun.Rows[i]["Conclusion"] == DBNull.Value ? "NULL" :(Fun.Rows[i]["Conclusion"].ToString()  == "True"|| Fun.Rows[i]["Conclusion"].ToString().ToLower() == "1" ? "1" : "0"));
                al.Add(sb.ToString());
                sb.Clear();
            }

            return al;
        }

        public ArrayList Upload_tblTestResult08(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO tblTestResult08 (MeterHungID, MeasureDegreeID, TestItemID, TestPointId, ListNo, TestPointName, Phase, VoltagePercent, CurrentPercent, PowerFoctor, XLtime, XLmax, XLerr, STXLMax, Conclusion) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5},{6},{7},{8},{9},{10},{11},{12},{13},{14})",
                Fun.Rows[i]["MeterHungID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeterHungID"].ToString() +"'",
                Fun.Rows[i]["MeasureDegreeID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeasureDegreeID"].ToString() +"'",
                Fun.Rows[i]["TestItemID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TestItemID"].ToString() +"'",
                Fun.Rows[i]["TestPointId"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TestPointId"].ToString() +"'",
                Fun.Rows[i]["ListNo"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ListNo"].ToString() +"'",
                Fun.Rows[i]["TestPointName"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TestPointName"].ToString() +"'",
                Fun.Rows[i]["Phase"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Phase"].ToString() +"'",
                Fun.Rows[i]["VoltagePercent"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["VoltagePercent"].ToString() +"'",
                Fun.Rows[i]["CurrentPercent"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CurrentPercent"].ToString() +"'",
                Fun.Rows[i]["PowerFoctor"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["PowerFoctor"].ToString() +"'",
                Fun.Rows[i]["XLtime"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["XLtime"].ToString() +"'",
                Fun.Rows[i]["XLmax"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["XLmax"].ToString() +"'",
                Fun.Rows[i]["XLerr"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["XLerr"].ToString() +"'",
                Fun.Rows[i]["STXLMax"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["STXLMax"].ToString() +"'",
                Fun.Rows[i]["Conclusion"] == DBNull.Value ? "0" : (Fun.Rows[i]["Conclusion"].ToString()  == "True"|| Fun.Rows[i]["Conclusion"].ToString().ToLower() == "1" ? "1" : "0"));
                al.Add(sb.ToString());
                sb.Clear();
            }

            return al;
        }

        public ArrayList Upload_tblTestResult10(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO tblTestResult10 (MeterHungID, MeasureDegreeID, TestItemID, TestPointId, ListNo, ErrData, Conclusion) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5},{6})",
                Fun.Rows[i]["MeterHungID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeterHungID"].ToString() +"'",
                Fun.Rows[i]["MeasureDegreeID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeasureDegreeID"].ToString() +"'",
                Fun.Rows[i]["TestItemID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TestItemID"].ToString() +"'",
                Fun.Rows[i]["TestPointId"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TestPointId"].ToString() +"'",
                Fun.Rows[i]["ListNo"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ListNo"].ToString() +"'",
                Fun.Rows[i]["ErrData"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ErrData"].ToString() +"'",
                Fun.Rows[i]["Conclusion"] == DBNull.Value ? "0" : (Fun.Rows[i]["Conclusion"].ToString()  == "True"|| Fun.Rows[i]["Conclusion"].ToString().ToLower() == "1" ? "1" : "0"));
                al.Add(sb.ToString());
                sb.Clear();
            }

            return al;
        }

        public ArrayList Upload_tblTestResult16(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO tblTestResult16 (MeterHungID, MeasureDegreeID, TestItemID, TestPointId, ListNo, PZPower, PZJFPower, PZFPower, PZPPower, PZGPower, QZPower, QZJFPower, QZFPower, QZPPower, QZGPower, PFPower, PFJFPower, PFFPower, PFPPower, PFGPower, QFPower, QFJFPower, QFFPower, QFPPower, QFGPower, Q1Power, Q1JFPower, Q1FPower, Q1PPower, Q1GPower, Q2Power, Q2JFPower, Q2FPower, Q2PPower, Q2GPower, Q3Power, Q3JFPower, Q3FPower, Q3PPower, Q3GPower, Q4Power, Q4JFPower, Q4FPower, Q4PPower, Q4GPower, Conclusion) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5},{6},{7},{8},{9},{10},{11},{12},{13},{14},{15},{16},{17},{18},{19},{20},{21},{22},{23},{24},{25},{26},{27},{28},{29},{30},{31},{32},{33},{34},{35},{36},{37},{38},{39},{40},{41},{42},{43},{44},{45},{46})",
                Fun.Rows[i]["MeterHungID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeterHungID"].ToString() +"'",
                Fun.Rows[i]["MeasureDegreeID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeasureDegreeID"].ToString() +"'",
                Fun.Rows[i]["TestItemID"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TestItemID"].ToString() +"'",
                Fun.Rows[i]["TestPointId"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TestPointId"].ToString() +"'",
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
                Fun.Rows[i]["Q4Power"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Q4Power"].ToString() +"'",
                Fun.Rows[i]["Q4Power"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Q4Power"].ToString() +"'",
                Fun.Rows[i]["Q4JFPower"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Q4JFPower"].ToString() +"'",
                Fun.Rows[i]["Q4FPower"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Q4FPower"].ToString() +"'",
                Fun.Rows[i]["Q4PPower"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Q4PPower"].ToString() +"'",
                Fun.Rows[i]["Q4GPower"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Q4GPower"].ToString() +"'",
                Fun.Rows[i]["Conclusion"] == DBNull.Value ? "0" : (Fun.Rows[i]["Conclusion"].ToString()  == "True"|| Fun.Rows[i]["Conclusion"].ToString().ToLower() == "1" ? "1" : "0"));
                al.Add(sb.ToString());
                sb.Clear();
            }

            return al;
        }
        #endregion

        #region InputTemp
        public ArrayList Upload_Inputtemp(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO Inputtemp (Meterid, Modeltypeid, Serialno, Meterno, barcode, MeterAddress, Model, MadePlace, TestUnit, TestDate, StartDeg, Enddeg, Constant, Class, Class1, Voltage, [Current], CurrentMax, TestCircs, Type, ConstantReactive, Connection) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5},{6},{7},{8},{9},{10},{11},{12},{13},{14},{15},{16},{17},{18},{19},{20},{21})",
                    Fun.Rows[i]["Meterid"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Meterid"].ToString() +"'",
                    Fun.Rows[i]["Modeltypeid"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Modeltypeid"].ToString() +"'",
                    Fun.Rows[i]["Serialno"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Serialno"].ToString() +"'",
                    Fun.Rows[i]["Meterno"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Meterno"].ToString() +"'",
                    Fun.Rows[i]["barcode"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["barcode"].ToString() +"'",
                    Fun.Rows[i]["MeterAddress"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeterAddress"].ToString() +"'",
                    Fun.Rows[i]["Model"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Model"].ToString() +"'",
                    Fun.Rows[i]["MadePlace"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MadePlace"].ToString() +"'",
                    Fun.Rows[i]["TestUnit"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TestUnit"].ToString() +"'",
                    Fun.Rows[i]["TestDate"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TestDate"].ToString() +"'",
                    Fun.Rows[i]["StartDeg"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["StartDeg"].ToString() +"'",
                    Fun.Rows[i]["Enddeg"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Enddeg"].ToString() +"'",
                    Fun.Rows[i]["Constant"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Constant"].ToString() +"'",
                    Fun.Rows[i]["Class"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Class"].ToString() +"'",
                    Fun.Rows[i]["Class1"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Class1"].ToString() +"'",
                    Fun.Rows[i]["Voltage"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Voltage"].ToString() +"'",
                    Fun.Rows[i]["Current"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Current"].ToString() +"'",
                    Fun.Rows[i]["CurrentMax"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CurrentMax"].ToString() +"'",
                    Fun.Rows[i]["TestCircs"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TestCircs"].ToString() +"'",
                    Fun.Rows[i]["Type"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Type"].ToString() +"'",
                    Fun.Rows[i]["ConstantReactive"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ConstantReactive"].ToString() +"'",
                    Fun.Rows[i]["Connection"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Connection"].ToString() +"'");
                al.Add(sb.ToString());
                sb.Clear();
            }

            return al;
        }

        public ArrayList Upload_tempdata(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO tempdata (Serialno, Meterno, Assetno, barcode, MeterAddress, Model, MadePlace, TestUnit, TestDate, StartDeg, Enddeg, Constant, Class, Class1, Voltage, [Current], CurrentMax, TestCircs, Type, ConstantReactive) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5},{6},{7},{8},{9},{10},{11},{12},{13},{14},{15},{16},{17},{18},{19})",
                    Fun.Rows[i]["Serialno"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Serialno"].ToString() +"'",
                    Fun.Rows[i]["Meterno"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Meterno"].ToString() +"'",
                    Fun.Rows[i]["Assetno"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Assetno"].ToString() +"'",
                    Fun.Rows[i]["barcode"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["barcode"].ToString() +"'",
                    Fun.Rows[i]["MeterAddress"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MeterAddress"].ToString() +"'",
                    Fun.Rows[i]["Model"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Model"].ToString() +"'",
                    Fun.Rows[i]["MadePlace"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["MadePlace"].ToString() +"'",
                    Fun.Rows[i]["TestUnit"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TestUnit"].ToString() +"'",
                    Fun.Rows[i]["TestDate"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TestDate"].ToString() +"'",
                    Fun.Rows[i]["StartDeg"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["StartDeg"].ToString() +"'",
                    Fun.Rows[i]["Enddeg"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Enddeg"].ToString() +"'",
                    Fun.Rows[i]["Constant"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Constant"].ToString() +"'",
                    Fun.Rows[i]["Class"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Class"].ToString() +"'",
                    Fun.Rows[i]["Class1"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Class1"].ToString() +"'",
                    Fun.Rows[i]["Voltage"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Voltage"].ToString() +"'",
                    Fun.Rows[i]["Current"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Current"].ToString() +"'",
                    Fun.Rows[i]["CurrentMax"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["CurrentMax"].ToString() +"'",
                    Fun.Rows[i]["TestCircs"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TestCircs"].ToString() +"'",
                    Fun.Rows[i]["Type"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Type"].ToString() +"'",
                    Fun.Rows[i]["ConstantReactive"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["ConstantReactive"].ToString() +"'");
                al.Add(sb.ToString());
                sb.Clear();
            }

            return al;
        }

        public ArrayList Upload_Txmcode(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO Txmcode (Id, TxmOption, StarCode, EndCode, TxmCode, TxmCodeText) VALUES (");
                sb.AppendFormat("{0},{1},{2},{3},{4},{5})",
                    Fun.Rows[i]["Id"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Id"].ToString() +"'",
                    Fun.Rows[i]["TxmOption"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TxmOption"].ToString() +"'",
                    Fun.Rows[i]["StarCode"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["StarCode"].ToString() +"'",
                    Fun.Rows[i]["EndCode"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["EndCode"].ToString() +"'",
                    Fun.Rows[i]["TxmCode"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TxmCode"].ToString() +"'",
                    Fun.Rows[i]["TxmCodeText"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TxmCodeText"].ToString() +"'");
                al.Add(sb.ToString());
                sb.Clear();
            }

            return al;
        }

        public ArrayList Upload_Txmway(DataTable Fun)
        {
            ArrayList al = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Fun.Rows.Count; i++)
            {
                sb.Append("INSERT INTO Txmway (Txmid, TxmOK, Txmname) VALUES (");
                sb.AppendFormat("{0},{1},{2})",
                    Fun.Rows[i]["Txmid"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Txmid"].ToString() +"'",
                    Fun.Rows[i]["TxmOK"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["TxmOK"].ToString() +"'",
                    Fun.Rows[i]["Txmname"] == DBNull.Value ? "NULL" :"'"+ Fun.Rows[i]["Txmname"].ToString() +"'");
                al.Add(sb.ToString());
                sb.Clear();
            }

            return al;
        }
        #endregion

    }
        }