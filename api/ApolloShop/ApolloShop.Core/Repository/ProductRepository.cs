using ApolloShop.Core.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace ApolloShop.Core.Repository
{
    public interface IProductRepository : IBaseRepository<Product>
    {
    }

    public class ProductRepository : BaseRepository<Product>, IProductRepository
    {
       
    }
}
