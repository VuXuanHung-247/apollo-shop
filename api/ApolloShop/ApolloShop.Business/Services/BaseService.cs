using ApolloShop.Core;
using ApolloShop.Core.Entities;
using ApolloShop.Core.Repository;
using System;
using System.Collections.Generic;
using System.Text;

namespace ApolloShop.Business.Services
{
    public interface IBaseService<Entity>
    {
        IEnumerable<Entity> GetEntities();
        Entity GetById(int entityId);
        ServiceResult Insert(Entity entity);
        ServiceResult Update(Entity entity, int entityId);
        ServiceResult Delete(int entityId);
    }
    public class BaseService<Entity> : IBaseService<Entity>  where Entity : BaseEntity
    {
        #region Declare
        IBaseRepository<Entity> _baseRepository;
        ServiceResult _serviceResult;
        #endregion

        #region Constructor
        public BaseService(IBaseRepository<Entity> baseRepository)
        {
            _baseRepository = baseRepository;
            _serviceResult = new ServiceResult();
        }
        #endregion

        #region Method
        public IEnumerable<Entity> GetEntities()
        {
            var entities = _baseRepository.GetEntities();
            return entities;
        }
        public Entity GetById(int entityId)
        {
            var entity = _baseRepository.GetById(entityId);
            return entity;
        }

        public ServiceResult Insert(Entity entity)
        {
            try
            {
                // Gắn trạng thái - phân biệt validate thêm
                //entity.EntityState = EntityState.AddNew;
                var rowEffects = _baseRepository.Insert(entity);
                if (rowEffects == 0)
                {
                    _serviceResult = new ServiceResult() { data = rowEffects, Msg = { "Thêm mới dữ liệu thất bại !!" }, Code = Code.BadRequest };
                }
                else
                {
                    _serviceResult = new ServiceResult() { data = rowEffects, Msg = { "Thêm mới dữ liệu thành công !!" }, Code = Code.Success };
                }
                return _serviceResult;
                //var isValid = ValidateObject(entity);
                //// validate thành công thì trả ra:
                //if (isValid == true)
                //{
                //    var rowEffects = _baseRepository.Insert(entity);
                //    if (rowEffects == 0)
                //    {
                //        _serviceResult = new ServiceResult() { data = rowEffects, Msg = { "Thêm mới dữ liệu thất bại !!" }, Code = Code.BadRequest };
                //    }
                //    else
                //    {
                //        _serviceResult = new ServiceResult() { data = rowEffects, Msg = { "Thêm mới dữ liệu thành công !!" }, Code = Code.Success };
                //    }
                //    return _serviceResult;
                //}
                //// nếu validate có lỗi xẩy ra
                //else
                //{
                //    return _serviceResult;
                //}
            }
            catch (Exception ex)
            {
                throw new ValidateExceptions(ex.Message);
            }
        }

        public ServiceResult Update(Entity entity, int entityId)
        {
            try
            {
                //entity.EntityState = EntityState.Update;
                var rowEffects = _baseRepository.Update(entity, entityId);
                if (rowEffects == 0)
                {
                    _serviceResult = new ServiceResult() { data = rowEffects, Msg = { "Cập nhật dữ liệu thất bại !!" }, Code = Code.BadRequest };
                }
                else
                {
                    _serviceResult = new ServiceResult() { data = rowEffects, Msg = { "Cập nhật dữ liệu thành công !!" }, Code = Code.Success };
                }
                return _serviceResult;
                //var isValid = ValidateObject(entity);
                //// validate thành công thì trả ra:
                //if (isValid == true)
                //{
                //    var rowEffects = _baseRepository.Update(entity, entityId);
                //    if (rowEffects == 0)
                //    {
                //        _serviceResult = new ServiceResult() { data = rowEffects, Msg = { "Cập nhật dữ liệu thất bại !!" }, MISACode = MISACode.BadRequest };
                //    }
                //    else
                //    {
                //        _serviceResult = new ServiceResult() { data = rowEffects, Msg = { "Cập nhật dữ liệu thành công !!" }, MISACode = MISACode.Success };
                //    }
                //    return _serviceResult;
                //}
                //// nếu validate có lỗi xẩy ra
                //else
                //{
                //    return _serviceResult;
                //}
            }
            catch (Exception ex)
            {
                throw new ValidateExceptions(ex.Message);

            }
        }

        public ServiceResult Delete(int entityId)
        {
            _serviceResult.data = _baseRepository.Delete(entityId);
            return _serviceResult;
        }
        #endregion
    }
}
