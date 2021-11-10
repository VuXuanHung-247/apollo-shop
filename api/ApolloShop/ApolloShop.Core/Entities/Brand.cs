using System;
using System.Collections.Generic;
using System.Text;

namespace ApolloShop.Core.Entities
{
    public class Brand : BaseEntity
    {
        public int BrandId { get; set; }
        public string BrandName { get; set; }
    }
}
