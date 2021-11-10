using System;
using System.Collections.Generic;
using System.Text;

namespace ApolloShop.Core.Entities
{
    public class Discount : BaseEntity
    {
        public int DiscountId { get; set; }
        public string DiscountName { get; set; }
        public double? DiscountRate { get; set; }
        public DateTime? CreateDate { get; set; }
        public DateTime? CreateEnd { get; set; }
    }
}
