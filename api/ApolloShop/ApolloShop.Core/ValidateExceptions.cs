using System;
using System.Collections.Generic;
using System.Text;

namespace ApolloShop.Core
{
    public class ValidateExceptions: Exception
    {
        public string UserMessenger = string.Empty;
        public ValidateExceptions(string msg, object data = null) : base(msg, new Exception())
        {
            this.UserMessenger = msg;
        }
    }
}
