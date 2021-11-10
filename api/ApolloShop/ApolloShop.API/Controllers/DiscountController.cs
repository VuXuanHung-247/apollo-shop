using ApolloShop.Business.Services;
using ApolloShop.Core.Entities;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ApolloShop.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DiscountController : BaseController<Discount>
    {
        #region Declare
        IDiscountService _discountService;
        #endregion

        #region Constructor
        public DiscountController(IDiscountService discountService) : base(discountService)
        {
            _discountService = discountService;
        }
        #endregion


        #region Method

        #endregion
    }
}
