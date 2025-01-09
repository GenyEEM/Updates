using Microsoft.International.Converters.PinYinConverter;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
namespace GenyDataUploadTool
{
    public static class PinYinHelper
    {
        /// <summary>
        /// 返回字符串的简拼
        /// </summary>
        /// <param name="inputTxt"></param>
        /// <returns></returns>
        public static string GetShortPinYin(string inputTxt)
        {
            string shortPinYin = "";
            foreach (char c in inputTxt.Trim())
            {
                if (ChineseChar.IsValidChar(c))
                {
                    ChineseChar chineseChar = new ChineseChar(c);
                    shortPinYin += chineseChar.Pinyins[0].Substring(0, 1).ToUpper();
                    continue;
                }

                if (Regex.IsMatch(c.ToString(), @"^[a-zA-Z]$"))
                {
                    shortPinYin += c.ToString().ToUpper();
                    continue;
                }

                shortPinYin += "?";
            }
            return shortPinYin;
        }

        /// <summary>
        /// 返回字符串全拼
        /// </summary>
        /// <param name="inputTxt"></param>
        /// <returns></returns>
        public static string GetAllPinYin(string inputTxt)
        {
            string allPinYin = "";
            foreach (char c in inputTxt.Trim())
            {
                ChineseChar chineseChar = new ChineseChar(c);
                allPinYin += chineseChar.Pinyins[0].Substring(0, chineseChar.Pinyins[0].Length - 1).ToLower();
            }
            return allPinYin;
        }
    }
}
