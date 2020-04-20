using System;
using System.Collections.Generic;
using System.Text;
using TvShows.Infrastructure.Repositories;
using TvShows.Infrastructure.Repositories.Base;

namespace TvShows.Infrastructure
{
    public interface IRepositoryFactory
    {
        T GetInstance<T>() where T : IRepository;

        IUsersRepository UsersRepository { get; }
        IRolesRepository RolesRepository { get; }
    }

    public class RepositoryFactory : IRepositoryFactory
    {
        private readonly IServiceProvider _provider;

        public RepositoryFactory(IServiceProvider provider)
        {
            _provider = provider;
        }

        public T GetInstance<T>() where T : IRepository => (T)_provider.GetService(typeof(T));

        public IUsersRepository UsersRepository => GetInstance<IUsersRepository>();

        public IRolesRepository RolesRepository => GetInstance<IRolesRepository>();
    }
}
