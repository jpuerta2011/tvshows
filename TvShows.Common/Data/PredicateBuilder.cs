using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using System.Text;

namespace TvShows.Common.Data
{
    public static class PredicateBuilder
    {
        /// <summary>
        ///     Perform a "and" lambda expression based on <paramref name="b" /> expression
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="a"></param>
        /// <param name="b"></param>
        /// <returns></returns>
        public static Expression<Func<T, bool>> And<T>(this Expression<Func<T, bool>> a, Expression<Func<T, bool>> b)
        {
            var p = a.Parameters[0];

            var visitor = new SubstExpressionVisitor { Subst = { [b.Parameters[0]] = p } };

            Expression body = Expression.AndAlso(a.Body, visitor.Visit(b.Body));
            return Expression.Lambda<Func<T, bool>>(body, p);
        }

        /// <summary>
        ///     Perform a "or" lambda expression based on <paramref name="b" /> expression
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="a"></param>
        /// <param name="b"></param>
        /// <returns></returns>
        public static Expression<Func<T, bool>> Or<T>(this Expression<Func<T, bool>> a, Expression<Func<T, bool>> b)
        {
            var p = a.Parameters[0];

            var visitor = new SubstExpressionVisitor { Subst = { [b.Parameters[0]] = p } };

            Expression body = Expression.OrElse(a.Body, visitor.Visit(b.Body));
            return Expression.Lambda<Func<T, bool>>(body, p);
        }

        /// <summary>
        ///     Sort the elements of a sequence according to orders list
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="query"></param>
        /// <param name="orders">List with orders definitions</param>
        /// <returns></returns>
        public static IQueryable<T> OrderBy<T>(this IQueryable<T> query, IEnumerable<OrderBy> orders)
        {
            var firstIteration = true;

            foreach (var order in orders)
            {
                switch (order.Type)
                {
                    case OrderByType.Descending:
                        query = firstIteration
                            ? query.OrderByDescending(order.SortField)
                            : query.ThenByDescending(order.SortField);
                        break;
                    case OrderByType.Ascending:
                    default:
                        query = firstIteration ? query.OrderBy(order.SortField) : query.ThenBy(order.SortField);

                        break;
                }

                firstIteration = false;
            }

            return query;
        }

        public static IQueryable<T> OrderBy<T>(this IQueryable<T> items, string propertyName)
        {
            var typeOfT = typeof(T);
            var parameter = Expression.Parameter(typeOfT, "parameter");
            var propertyType = typeOfT.GetNestedProperty(propertyName)?.PropertyType;
            var propertyAccess = propertyName.Split('.')
                .Aggregate<string, Expression>(parameter, Expression.PropertyOrField);
            var orderExpression = Expression.Lambda(propertyAccess, parameter);

            var expression = Expression.Call(typeof(Queryable), "OrderBy", new[] { typeOfT, propertyType },
                items.Expression, Expression.Quote(orderExpression));
            return items.Provider.CreateQuery<T>(expression);
        }

        public static IQueryable<T> OrderByDescending<T>(this IQueryable<T> items, string propertyName)
        {
            var typeOfT = typeof(T);
            var parameter = Expression.Parameter(typeOfT, "parameter");
            var propertyType = typeOfT.GetNestedProperty(propertyName)?.PropertyType;
            var propertyAccess = propertyName.Split('.')
                .Aggregate<string, Expression>(parameter, Expression.PropertyOrField);
            var orderExpression = Expression.Lambda(propertyAccess, parameter);

            var expression = Expression.Call(typeof(Queryable), "OrderByDescending", new[] { typeOfT, propertyType },
                items.Expression, Expression.Quote(orderExpression));
            return items.Provider.CreateQuery<T>(expression);
        }

        public static IQueryable<T> ThenBy<T>(this IQueryable<T> items, string propertyName)
        {
            var typeOfT = typeof(T);
            var parameter = Expression.Parameter(typeOfT, "parameter");
            var propertyType = typeOfT.GetNestedProperty(propertyName)?.PropertyType;
            var propertyAccess = propertyName.Split('.')
                .Aggregate<string, Expression>(parameter, Expression.PropertyOrField);
            var orderExpression = Expression.Lambda(propertyAccess, parameter);

            var expression = Expression.Call(typeof(Queryable), "ThenBy", new[] { typeOfT, propertyType },
                items.Expression, Expression.Quote(orderExpression));
            return items.Provider.CreateQuery<T>(expression);
        }

        public static IQueryable<T> ThenByDescending<T>(this IQueryable<T> items, string propertyName)
        {
            var typeOfT = typeof(T);
            var parameter = Expression.Parameter(typeOfT, "parameter");
            var propertyType = typeOfT.GetNestedProperty(propertyName)?.PropertyType;
            var propertyAccess = propertyName.Split('.')
                .Aggregate<string, Expression>(parameter, Expression.PropertyOrField);
            var orderExpression = Expression.Lambda(propertyAccess, parameter);

            var expression = Expression.Call(typeof(Queryable), "ThenByDescending", new[] { typeOfT, propertyType },
                items.Expression, Expression.Quote(orderExpression));
            return items.Provider.CreateQuery<T>(expression);
        }

        private static PropertyInfo GetNestedProperty(this Type type, string propertyName)
        {
            var properties = propertyName.Split(new[] { '.' }, 2);
            var propertyInfo = type.GetProperty(properties[0]);
            if (propertyInfo == null)
                throw new ArgumentException($"{properties[0]} is not a property of {type.FullName}.");
            // ReSharper disable once TailRecursiveCall
            return properties.Length == 1 ? propertyInfo : propertyInfo.PropertyType.GetNestedProperty(properties[1]);
        }

        internal class SubstExpressionVisitor : ExpressionVisitor
        {
            public Dictionary<Expression, Expression> Subst = new Dictionary<Expression, Expression>();

            protected override Expression VisitParameter(ParameterExpression node)
            {
                return Subst.TryGetValue(node, out var newValue) ? newValue : node;
            }
        }
    }

    public enum OrderByType
    {
        /// <summary>
        ///     Ascending order
        /// </summary>
        Ascending = 0,

        /// <summary>
        ///     Descending order
        /// </summary>
        Descending = 1
    }

    /// <summary>
    ///     Define an order with a function to extract a key from an element and order type
    /// </summary>
    public class OrderBy
    {
        /// <summary>
        ///     Sort field. It must matched the property name of the entity
        /// </summary>
        public string SortField { get; set; }

        /// <summary>
        ///     Order type (Ascending or Descending)
        /// </summary>
        public OrderByType Type { get; set; }
    }
}
