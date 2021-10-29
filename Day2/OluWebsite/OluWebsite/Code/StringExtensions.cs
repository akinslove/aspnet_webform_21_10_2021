using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OluWebsite
{
    public static class StringExtensions
    {
        public static bool IsADecimal(this string text)
        {
            return text == null || decimal.TryParse(text, out _);
        }


        public static bool IsANumber(this string text)
        {
            return text == null || int.TryParse(text, out _);
        }
    }
}