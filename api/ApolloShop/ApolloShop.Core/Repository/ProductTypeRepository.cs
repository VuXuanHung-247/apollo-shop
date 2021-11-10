using ApolloShop.Core.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace ApolloShop.Core.Repository
{
    public interface IProductTypeRepository : IBaseRepository<ProductType>
    {
    }

    public class ProductTypeRepository : BaseRepository<ProductType>, IProductTypeRepository
    {
    }
}
