using System;
using TvShows.Services.Base;
using TvShows.Services.Domain;

namespace TvShows.Services
{
    public interface IServiceFactory
    {
        IUsersService UsersService { get; }
        IShowsService ShowsService { get; }
    }

    public class ServiceFactory : IServiceFactory
    {
        private readonly IServiceProvider _provider;

        public ServiceFactory(IServiceProvider provider)
        {
            _provider = provider;
        }

        public T GetInstance<T>() where T : IService => (T)_provider.GetService(typeof(T));

        public IUsersService UsersService => GetInstance<IUsersService>();
        public IShowsService ShowsService => GetInstance<IShowsService>();
    }
}
