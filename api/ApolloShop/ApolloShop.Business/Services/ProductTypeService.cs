using ApolloShop.Core;
using ApolloShop.Core.Entities;
using ApolloShop.Core.Repository;
using System;
using System.Collections.Generic;
using System.Text;

namespace ApolloShop.Business.Services
{
    public interface IProductTypeService : IBaseService<ProductType>
    {

    }

    public class ProductTypeService : BaseService<ProductType>, IProductTypeService
    {
        IProductTypeRepository _productTypeRepository;
        ServiceResult _serviceResult;

        #region Constructor
        public ProductTypeService(IProductTypeRepository productTypeRepository) : base(productTypeRepository)
        {
            _productTypeRepository = productTypeRepository;
            _serviceResult = new ServiceResult();
        }
        #endregion
    }
}
