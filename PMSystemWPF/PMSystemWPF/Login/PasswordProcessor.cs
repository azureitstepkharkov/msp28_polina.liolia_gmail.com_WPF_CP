using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DevOne.Security.Cryptography.BCrypt;

namespace PMSystemWPF.Login
{
    public class PasswordProcessor
    {
        public static string EncryptPassword(string password)
        {
            string salt = BCryptHelper.GenerateSalt();
            //mySalt == "$2a$10$rBV2JDeWW3.vKyeQcM8fFO"
            string hash = BCryptHelper.HashPassword(password, salt);
            //myHash == "$2a$10$rBV2JDeWW3.vKyeQcM8fFO4777l4bVeQgDL6VIkxqlzQ7TCalQvla"
            return hash;  
        }

        public static bool CheckPasswordsMatch(string hash, string passwordInputed)
        {
            return BCryptHelper.CheckPassword(passwordInputed, hash);
        }
    }
}
