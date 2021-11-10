using System;
using System.Collections.Generic;
using System.Text;

namespace ApolloShop.Core.Entities
{
    public class ProductType: BaseEntity
    {
        public int ProductTypeId { get; set; }
        public string ProductTypeName { get; set; }
        public string Description { get; set; }
        public string ProductTypeImage { get; set; }
    }
}
