using ApolloShop.Core.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace ApolloShop.Core.Repository
{
    public interface IDiscountRepository : IBaseRepository<Discount>
    {
    }

    public class DiscountRepository : BaseRepository<Discount>, IDiscountRepository
    {
    }
}
