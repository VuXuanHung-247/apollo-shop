using ApolloShop.Core.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace ApolloShop.Core.Repository
{
    public interface IBrandRepository : IBaseRepository<Brand>
    {
    }

    public class BrandRepository : BaseRepository<Brand>, IBrandRepository
    {
    }
}
