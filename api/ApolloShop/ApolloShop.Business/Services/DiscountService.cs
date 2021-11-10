using ApolloShop.Core;
using ApolloShop.Core.Entities;
using ApolloShop.Core.Repository;
using System;
using System.Collections.Generic;
using System.Text;

namespace ApolloShop.Business.Services
{
    public interface IDiscountService : IBaseService<Discount>
    {

    }

    /// <summary>
    /// DiscountService
    /// </summary>
    public class DiscountService : BaseService<Discount>, IDiscountService
    {
        IDiscountRepository _discountRepository;
        ServiceResult _serviceResult;

        #region Constructor
        public DiscountService(IDiscountRepository discountRepository) : base(discountRepository)
        {
            _discountRepository = discountRepository;
            _serviceResult = new ServiceResult();
        }
        #endregion
    }
}
