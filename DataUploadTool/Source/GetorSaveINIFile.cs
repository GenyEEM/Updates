using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.InteropServices;

namespace GenyDataUploadTool
{
    class GetorSaveINIFile
    {
        //声明INI文件的写操作函数 WritePrivateProfileString()
        [DllImport("kernel32")]
        private static extern long WritePrivateProfileString(string section, string key, string val, string filePath);
        //声明INI文件的读操作函数 GetPrivateProfileString()
        [DllImport("kernel32")]
        private static extern int GetPrivateProfileString(string section, string key, string def, StringBuilder retVal, int size, string filePath);
        #region Read and Write inifile
        public void SaveIniinfo(string filepath, string section, string key, string value)
        {
            WritePrivateProfileString(section, key, value, filepath);
        }
        public string Getiniinfo(string filepath, string section, string key, string defvalue)
        {
            StringBuilder Strtmp = new StringBuilder(255);
            int i;
            i = GetPrivateProfileString(section, key, defvalue, Strtmp, 255, filepath);
            return Strtmp.ToString();
        }
        public string Getiniinfo(string filepath, string section, string key)
        {
            StringBuilder Strtmp = new StringBuilder(255);
            int i;
            i = GetPrivateProfileString(section, key, "", Strtmp, 255, filepath);
            return Strtmp.ToString();
        }
        public int Getiniinfo(string filepath, string section, string key, int defvalue)
        {
            StringBuilder Strtmp = new StringBuilder();
            int i;
            i = GetPrivateProfileString(section, key, defvalue.ToString(), Strtmp, 255, filepath);
            return Convert.ToInt16(Strtmp.ToString());
        }
        #endregion
    }
}
