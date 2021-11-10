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
    public class ProductTypeController : BaseController<ProductType>
    {
        #region Declare
        IProductTypeService _productTypeService;
        #endregion

        #region Constructor
        public ProductTypeController(IProductTypeService productTypeService) : base(productTypeService)
        {
            _productTypeService = productTypeService;
        }
        #endregion


        #region Method

        #endregion
    }
}
