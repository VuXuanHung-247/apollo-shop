using ApolloShop.Business.Services;
using ApolloShop.Core;
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
    public class BaseController<Entity> : ControllerBase
    {
        #region Declare
        IBaseService<Entity> _baseService;
        #endregion

        #region Constructor
        public BaseController(IBaseService<Entity> baseService)
        {
            _baseService = baseService;
        }
        #endregion

        #region Method

        [HttpGet]
        public IActionResult Get()
        {
            var entities = _baseService.GetEntities();
            if (entities.Count() == 0)
            {
                return NoContent();
            }
            else
            {
                return Ok(entities);
            }
        }

        [HttpGet("{entityId}")]
        public IActionResult Get(int entityId)
        {
            var entity = _baseService.GetById(entityId);
            if (entity == null)
            {
                return NoContent();
            }
            return Ok(entity);
        }

        [HttpPost]
        public IActionResult Post([FromBody] Entity entity)
        {
            var result = _baseService.Insert(entity);
            if (result.IsValid == true)
            {
                var data = (int?)result.data;
                if (data > 0)
                {
                    return Ok(result);
                }
                else
                {
                    return NoContent();
                }
            }
            else
            {
                return BadRequest(result);
            }
        }

        [HttpPut]
        public IActionResult Put([FromBody] Entity entity, int entityId)
        {
            var result = _baseService.Update(entity, entityId);
            if (result.Code == Code.BadRequest)
            {
                return BadRequest(result);
            }
            return Ok(result);
        }

        [HttpDelete("{entityId}")]
        public IActionResult Delete(int entityId)
        {
            var entity = _baseService.Delete(entityId);
            return Ok(entity);
        }
        #endregion
    }
}
