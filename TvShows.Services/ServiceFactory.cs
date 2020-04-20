using System;
using System.Collections.Generic;
using System.Text;
using TvShows.Services.Base;
using TvShows.Services.Domain;

namespace TvShows.Services
{
    public interface IServiceFactory
    {
        ISecurityService SecurityService { get; }
    }

    public class ServiceFactory : IServiceFactory
    {
        private readonly IServiceProvider _provider;

        public ServiceFactory(IServiceProvider provider)
        {
            _provider = provider;
        }

        public T GetInstance<T>() where T : IService => (T)_provider.GetService(typeof(T));

        public ISecurityService SecurityService => GetInstance<ISecurityService>();
    }
}
