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

class Program
{
    static void Maindd()
    {
        // 创建示例DataTable aTable
        DataTable aTable = new DataTable();
        aTable.Columns.Add("ID", typeof(int));
        aTable.Rows.Add(1);
        aTable.Rows.Add(2);
        aTable.Rows.Add(3);

        // 创建示例DataTable bTable
        DataTable bTable = new DataTable();
        bTable.Columns.Add("ID", typeof(int));
        bTable.Rows.Add(2);

        // 使用LINQ查询找出aTable中ID在bTable中没有的行
        var missingIDs = aTable.AsEnumerable()
            .Where(rowA => !bTable.AsEnumerable().Any(rowB => rowB.Field<int>("ID") == rowA.Field<int>("ID")))
            .CopyToDataTable();

        // 输出结果
        foreach (DataRow row in missingIDs.Rows)
        {
            Console.WriteLine("Missing ID: " + row["ID"]);
        }
    }
}