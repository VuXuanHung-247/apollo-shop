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
    public class ProductController : BaseController<Product>
    {
        #region Declare
        IProductService _productService;
        #endregion

        #region Constructor
        public ProductController(IProductService productService) : base(productService)
        {
            _productService = productService;
        }
        #endregion


        #region Method

        #endregion
    }
}
