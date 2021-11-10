using System;
using System.Collections.Generic;
using System.Text;

namespace ApolloShop.Core
{
    public enum Code
    {
        /// <summary>
        /// Dữ liệu hợp lệ
        /// </summary>
        IsValid = 100,

        /// <summary>
        /// Dữ liệu không hợp lệ
        /// </summary>
        BadRequest = 400,

        /// <summary>
        /// Thành công
        /// </summary>
        Success = 200,

        /// <summary>
        /// Lỗi
        /// </summary>
        Exeption = 500,
    }

    public enum EntityState
    {
        AddNew = 1,
        Update = 2,
        Delete = 3
    }

}
