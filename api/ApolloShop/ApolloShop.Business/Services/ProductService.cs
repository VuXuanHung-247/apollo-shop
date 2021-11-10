using ApolloShop.Core;
using ApolloShop.Core.Entities;
using ApolloShop.Core.Repository;
using System;
using System.Collections.Generic;
using System.Text;

namespace ApolloShop.Business.Services
{
    /// <summary>
    /// IProductService
    /// </summary>
    public interface IProductService : IBaseService<Product>
    {

    }

    /// <summary>
    /// ProductService
    /// </summary>
    public class ProductService : BaseService<Product>, IProductService
    {
        IProductRepository _productRepository;
        ServiceResult _serviceResult;

        #region Constructor
        public ProductService(IProductRepository productRepository) : base(productRepository)
        {
            _productRepository = productRepository;
            _serviceResult = new ServiceResult();
        }
        #endregion
    }
}
