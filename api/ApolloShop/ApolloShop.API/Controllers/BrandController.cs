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
    public class BrandController : BaseController<Brand>
    {
        #region Declare
        IBrandService _brandService;
        #endregion

        #region Constructor
        public BrandController(IBrandService brandService) : base(brandService)
        {
            _brandService = brandService;
        }
        #endregion


        #region Method

        #endregion
    }
}
