using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;


/// <summary>
/// Summary description for Hasher
/// </summary>
public sealed class Hasher
{
    public Hasher() { }

    private static byte[] ConvertStringToByteArray(string data)
    {
        return (new System.Text.UnicodeEncoding()).GetBytes(data);
    }

    private static System.IO.FileStream GetFileStream(string pathName)
    {
        return (new System.IO.FileStream(pathName, System.IO.FileMode.Open, System.IO.FileAccess.Read, System.IO.FileShare.ReadWrite));
    }

    public static string GetSHA1Hash(string pathName)
    {
        string strResult = "";
        string strHashData = "";

        byte[] arrbytHashValue;
        System.IO.FileStream oFileStream = null;

        System.Security.Cryptography.SHA1CryptoServiceProvider oSHA1Hasher = new System.Security.Cryptography.SHA1CryptoServiceProvider();

        try
        {
            oFileStream = GetFileStream(pathName);
            arrbytHashValue = oSHA1Hasher.ComputeHash(oFileStream);
            oFileStream.Close();

            strHashData = System.BitConverter.ToString(arrbytHashValue);
            strHashData = strHashData.Replace("-", "");
            strResult = strHashData;
        }
        catch (System.Exception ex)
        {
            
        }

        return (strResult);
    }

    public static string GetMD5Hash(string pathName)
    {
        string strResult = "";
        string strHashData = "";

        byte[] arrbytHashValue;
        System.IO.FileStream oFileStream = null;

        System.Security.Cryptography.MD5CryptoServiceProvider oMD5Hasher = new System.Security.Cryptography.MD5CryptoServiceProvider();

        try
        {
            oFileStream = GetFileStream(pathName);
            arrbytHashValue = oMD5Hasher.ComputeHash(oFileStream);
            oFileStream.Close();

            strHashData = System.BitConverter.ToString(arrbytHashValue);
            strHashData = strHashData.Replace("-", "");
            strResult = strHashData;
        }
        catch (System.Exception ex)
        {
            
        }

        return (strResult);
    }
}

