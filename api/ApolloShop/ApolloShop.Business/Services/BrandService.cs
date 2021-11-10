using ApolloShop.Core;
using ApolloShop.Core.Entities;
using ApolloShop.Core.Repository;
using System;
using System.Collections.Generic;
using System.Text;

namespace ApolloShop.Business.Services
{
    /// <summary>
    /// IBrandService
    /// </summary>
    public interface IBrandService : IBaseService<Brand>
    {

    }

    /// <summary>
    /// BrandService
    /// </summary>
    public class BrandService : BaseService<Brand>, IBrandService
    {
        IBrandRepository _brandRepository;
        ServiceResult _serviceResult;

        #region Constructor
        public BrandService(IBrandRepository brandRepository) : base(brandRepository)
        {
            _brandRepository = brandRepository;
            _serviceResult = new ServiceResult();
        }
        #endregion
    }
}
