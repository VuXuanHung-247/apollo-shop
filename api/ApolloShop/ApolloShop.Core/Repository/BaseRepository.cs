using ApolloShop.Core.Entities;
using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Text;

namespace ApolloShop.Core.Repository
{
    public interface IBaseRepository<Entity>
    {
        IEnumerable<Entity> GetEntities();
        Entity GetById(int entityId);
        int Insert(Entity entity);
        int Update(Entity entity, int entityId);
        int Delete(int entityId);
        Entity GetEntityByProperty(Entity entity, PropertyInfo property);
    }
    public class BaseRepository<Entity> : IBaseRepository<Entity> where Entity : BaseEntity
    {
        #region Declare
        private readonly string _connectionString = @"Data Source=.\SQLEXPRESS;Initial Catalog=ApolloShop;User Id=hung;password=hung1999";
        protected string _tableName = string.Empty;
        #endregion

        #region Contructor
        public BaseRepository()
        {
            _tableName = typeof(Entity).Name;
        }
        #endregion

        #region Method

        /// <summary>
        /// Lấy toàn bộ dữ liệu
        /// </summary>
        /// <returns></returns>
        public IEnumerable<Entity> GetEntities()
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var entities = connection.Query<Entity>($"Proc_Get{_tableName}s", commandType: CommandType.StoredProcedure);
                return entities;
            }    
        }

        /// <summary>
        /// Lấy dữ liệu theo EntityId
        /// </summary>
        /// <param name="entityId"></param>
        /// <returns></returns>
        public Entity GetById(int entityId)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var storeName = $"Proc_Get{_tableName}ById";
                DynamicParameters dynamicParameters = new DynamicParameters();
                var storeGetByIdInputParamName = $"@{_tableName}Id";
                dynamicParameters.Add(storeGetByIdInputParamName, entityId.ToString());

                var entity = connection.Query<Entity>(storeName, param: dynamicParameters, commandType: CommandType.StoredProcedure).FirstOrDefault();
                return entity;
            }
        }

        /// <summary>
        /// Thêm dữ liệu 
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public int Insert(Entity entity)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var storeName = $"Proc_Insert{_tableName}";
                // Id mới
                //typeof(Entity).GetProperty($"{_tableName}Id").SetValue(entity, Guid.NewGuid());
                var storeParam = MappingInsertDbType(entity);
                var rowAffects = connection.Execute(storeName, param: storeParam, commandType: CommandType.StoredProcedure);
                return rowAffects;
            }
        }

        /// <summary>
        /// Cập nhật dữ liệu
        /// </summary>
        /// <param name="entity"></param>
        /// <param name="entityId"></param>
        /// <returns></returns>
        public int Update(Entity entity, int entityId)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var storeName = $"Proc_Update{_tableName}";
                var storeParam = MappingDbType(entity);
                var rowAffects = connection.Execute(storeName, param: storeParam, commandType: CommandType.StoredProcedure);
                return rowAffects;
            }
        }

        /// <summary>
        /// Xóa dữ liệu
        /// </summary>
        /// <param name="entityId"></param>
        /// <returns></returns>
        public int Delete(int entityId)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var storeName = $"Proc_Delete{_tableName}ById";
                DynamicParameters dynamicParameters = new DynamicParameters();
                var storeGetByIdInputParamName = $"@{_tableName}Id";
                dynamicParameters.Add(storeGetByIdInputParamName, entityId.ToString());

                var result = connection.Execute(storeName, param: dynamicParameters, commandType: CommandType.StoredProcedure);
                return result;
            }

        }

        /// <summary>
        /// Lấy dữ liệu theo thuộc tính của Entity
        /// </summary>
        /// <param name="entity"></param>
        /// <param name="property"></param>
        /// <returns></returns>
        public Entity GetEntityByProperty(Entity entity, PropertyInfo property)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var propertyName = property.Name;
                var propertyValue = property.GetValue(entity);
                var keyValue = entity.GetType().GetProperty($"{_tableName}Id").GetValue(entity);
                var query = string.Empty;
                //if (entity.EntityState == EntityState.AddNew)
                //    query = $"SELECT * FROM {_tableName} WHERE {propertyName} = '{propertyValue}'";
                //else if (entity.EntityState == EntityState.Update)
                //    query = $"SELECT * FROM {_tableName} WHERE {propertyName} = '{propertyValue}' AND {_tableName}Id <> '{keyValue}'";
                //else
                //    return null;
                var entityReturn = connection.Query<Entity>(query, commandType: CommandType.Text).FirstOrDefault();
                return entityReturn;
            }
        }

        /// <summary>
        /// Truyền dữ liệu cho Store Procdure theo kiểu dữ  liệu tương ứng _ update
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        private DynamicParameters MappingDbType(Entity entity)
        {
            var properties = entity.GetType().GetProperties();
            var parameters = new DynamicParameters();
            foreach (var property in properties)
            {
                var propertyName = property.Name;
                var propertyValue = property.GetValue(entity);
                var propertyType = property.PropertyType;
                if (propertyType == typeof(Guid) || propertyType == typeof(Guid?))
                {
                    parameters.Add($"@{propertyName}", propertyValue, DbType.String);
                }
                else if (propertyType == typeof(bool) || propertyType == typeof(bool?))
                {
                    var dbValue = ((bool)propertyValue == true ? 1 : 0);
                    parameters.Add($"@{propertyName}", dbValue, DbType.Int32);
                }
                else
                {
                    parameters.Add($"@{propertyName}", propertyValue);
                }
            }
            return parameters;
        }
        /// <summary>
        /// Truyền dữ liệu cho Store Procdure theo kiểu dữ  liệu tương ứng _ insert
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        private DynamicParameters MappingInsertDbType(Entity entity)
        {
            var properties = entity.GetType().GetProperties();
            var parameters = new DynamicParameters();
            foreach (var property in properties)
            {
                var propertyName = property.Name;
                if (propertyName != $"{_tableName}Id")
                {
                    var propertyValue = property.GetValue(entity);
                    var propertyType = property.PropertyType;
                    if (propertyType == typeof(Guid) || propertyType == typeof(Guid?))
                    {
                        parameters.Add($"@{propertyName}", propertyValue, DbType.String);
                    }
                    else if (propertyType == typeof(bool) || propertyType == typeof(bool?))
                    {
                        var dbValue = ((bool)propertyValue == true ? 1 : 0);
                        parameters.Add($"@{propertyName}", dbValue, DbType.Int32);
                    }
                    else
                    {
                        parameters.Add($"@{propertyName}", propertyValue);
                    }
                }
            }
            return parameters;
        }
        #endregion
    }
}
