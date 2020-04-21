using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using TvShows.Infrastructure.Entities;
using TvShows.Infrastructure.Specifications;
using TvShows.Common.Data;

namespace TvShows.Infrastructure.Repositories.Base
{
    public interface IBaseRepository<in TIdType, T> : IRepository
    {
        Task<T> GetSingleByIdAsync(TIdType id);
        Task<IEnumerable<T>> GetAllAsync();
        Task<T> GetSingleAsync(Expression<Func<T, bool>> expression, List<string> includes = null);
        Task<IEnumerable<T>> ListAsync(Expression<Func<T, bool>> expression, List<string> includes = null);
        T Save(T entity);
        T Update(T entity);
        void Attach(T entity);
        void Remove(T entity);
        IQueryable<T> GetIQueryable(Expression<Func<T, bool>> expression, List<string> includes = null);
        Task<T> GetSingleAsync(Specification<T> specification);
        Task<IEnumerable<T>> ListAsync(Specification<T> specification);
        Task<int> CountAsync(Specification<T> specification);


    }

    public class BaseRepository<TIdType, T> : IBaseRepository<TIdType, T>
        where T : class
    {
        /// <summary>
        ///     Initializes a new instance of the <see cref="BaseRepository{TIdType,T}" /> class.
        /// </summary>
        /// <param name="context">The session.</param>
        protected BaseRepository(TvShowsDbContext context)
        {
            Context = context;
        }

        /// <summary>
        ///     Gets the session.
        /// </summary>
        protected TvShowsDbContext Context { get; }

        /// <summary>
        ///     Gets the entity collection.
        /// </summary>
        protected DbSet<T> DbSet => Context.Set<T>();

        /// <inheritdoc />
        /// <summary>
        ///     Gets the IQueryOver for the .
        /// </summary>
        /// <returns>An IQueryOver for the repository's entity.</returns>
        public virtual IQueryable<T> GetIQueryable(Expression<Func<T, bool>> expression, List<string> includes = null)
        {
            var queryableResultWithIncludes = DbSet.AsQueryable();
            if (includes != null)
            {
                // fetch a Queryable that includes all expression-based includes
                queryableResultWithIncludes = includes
                .Aggregate(DbSet.AsQueryable(),
                    (current, include) => current.Include(include));
            }

            // return the query using the specification's criteria expression
            return queryableResultWithIncludes.Where(expression);
        }

        /// <summary>
        ///     Gets the IQueryOver for the .
        /// </summary>
        /// <returns>An IQueryOver for the repository's entity.</returns>
        public virtual IQueryable<T> GetIQueryable(Specification<T> specification)
        {
            // fetch a Queryable that includes all expression-based includes
            var queryableResultWithIncludes = specification.Includes
                .Aggregate(DbSet.AsQueryable(),
                    (current, include) => current.Include(include));

            // modify the IQueryable to include any string-based include statements
            var secondaryResult = specification.IncludeStrings
                .Aggregate(queryableResultWithIncludes,
                    (current, include) => current.Include(include));

            // return the query using the specification's criteria expression
            return secondaryResult
                .Where(specification.ToExpression());
        }

        /// <summary>
        /// </summary>
        /// <param name="specification"></param>
        /// <returns></returns>
        public IQueryable<T> GetPaginatedIQueryable(Specification<T> specification)
        {
            var queryable = GetIQueryable(specification)
                .OrderBy(specification.Orders);

            if (specification.ItemsPerPage >= 0)
                queryable = queryable.Skip((specification.Page - 1) * specification.ItemsPerPage)
                    .Take(specification.ItemsPerPage);

            return queryable;
        }

        /// <inheritdoc />
        /// <summary>
        ///     Gets an entity by its id.
        /// </summary>
        /// <param name="id">The entity id.</param>
        /// <returns>An entity</returns>
        public virtual async Task<T> GetSingleByIdAsync(TIdType id)
        {
            var entity = await DbSet.FindAsync(id);
            return entity;
        }

        /// <inheritdoc />
        /// <summary>
        ///     Gets all instances of the entity type.
        /// </summary>
        /// <returns>An Enumerable with the list of entities.</returns>
        public virtual async Task<IEnumerable<T>> GetAllAsync()
        {
            var results = DbSet;
            return await results.ToListAsync();
        }

        /// <inheritdoc />
        /// <summary>
        ///     Gets an entity by expression parameter
        /// </summary>
        /// <param name="expression"></param>
        /// <returns></returns>
        public async Task<T> GetSingleAsync(Expression<Func<T, bool>> expression, List<string> includes = null)
        {
            return await GetIQueryable(expression, includes).FirstOrDefaultAsync(expression);
        }

        /// <inheritdoc />
        /// <summary>
        ///     Gets an entity by specification parameter
        /// </summary>
        /// <param name="specification"></param>
        /// <returns></returns>
        public async Task<T> GetSingleAsync(Specification<T> specification)
        {
            var queryable = GetIQueryable(specification)
                .OrderBy(specification.Orders);

            return await queryable.FirstOrDefaultAsync();
        }

        /// <inheritdoc />
        /// <summary>
        ///     Gets all instances of the entity type by expression parameter
        /// </summary>
        /// <returns></returns>
        public async Task<IEnumerable<T>> ListAsync(Expression<Func<T, bool>> expression, List<string> includes = null)
        {
            return await GetIQueryable(expression, includes).ToListAsync();
        }

        /// <inheritdoc />
        /// <summary>
        ///     Gets all instances of the entity type by specification parameter
        /// </summary>
        /// <returns></returns>
        public async Task<IEnumerable<T>> ListAsync(Specification<T> specification)
        {
            var queryable = GetPaginatedIQueryable(specification);

            return await queryable.ToListAsync();
        }

        /// <inheritdoc cref="" />
        /// <summary>
        ///     Gets the IQueryable list count by <paramref name="specification" />
        /// </summary>
        /// <param name="specification"></param>
        /// <returns></returns>
        public async Task<int> CountAsync(Specification<T> specification)
        {
            return await GetIQueryable(specification).CountAsync();
        }

        /// <inheritdoc />
        /// <summary>
        ///     Saves the current state of the specified entity.
        /// </summary>
        /// <param name="entity">The entity to persist.</param>
        /// <returns>An entity</returns>
        public virtual T Save(T entity)
        {
            DbSet.Add(entity);
            return entity;
        }

        /// <inheritdoc />
        /// <summary>
        ///     Set a state modified to the specified entity
        /// </summary>
        /// <param name="entity"></param>
        /// <returns>An entity with modified state</returns>
        public virtual T Update(T entity)
        {
            Context.Entry(entity).State = EntityState.Modified;
            return entity;
        }

        /// <inheritdoc />
        /// <summary>
        ///     Attaching an existing entity to the context before the update
        ///     <see
        ///         cref="https://docs.microsoft.com/en-us/ef/ef6/saving/change-tracking/entity-state#attaching-an-existing-entity-to-the-context" />
        /// </summary>
        /// <param name="entity"></param>
        public void Attach(T entity)
        {
            Context.Set<T>().Attach(entity);
        }

        /// <inheritdoc />
        /// <summary>
        ///     Removes the specified entity.
        /// </summary>
        /// <param name="entity">The entity to be deleted.</param>
        public virtual void Remove(T entity)
        {
            DbSet.Remove(entity);
        }
    }
}
