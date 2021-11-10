using System;
using System.Collections.Generic;
using System.Text;

namespace ApolloShop.Core.Entities
{
    public class Product :BaseEntity
    {
        public int ProductId { get; set; }
        public int BrandId { get; set; }
        public int ProductTypeId { get; set; }
        public int DiscountId { get; set; }
        public string ProductName { get; set; }
        public string Description { get; set; }
        public string ProductImage { get; set; }
        public int Size { get; set; }
        public string Color { get; set; }
        public double Price { get; set; }
        /// <summary>
        /// Giá sau khi giảm giá
        /// </summary>
        public double DiscountPrice { get; set; } 
        public int InventoryQuantity { get; set; }
        public int IsNewProduct { get; set; }

    }
}
