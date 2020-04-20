using AutoMapper;
using System;
using System.Collections.Generic;
using System.Text;
using TvShows.Common;
using TvShows.Infrastructure;

namespace TvShows.Services.Base
{
    public interface IService
    {

    }

    public class Service : IService
    {
        public Service(IRepositoryFactory repositoryFactory, IUnitOfWork unitOfWork, IMapper mapper)
        {
            Repositories = repositoryFactory;
            UnitOfWork = unitOfWork;
            Mapper = mapper;
        }

        public IRepositoryFactory Repositories { get; }

        public IUnitOfWork UnitOfWork { get; }

        public IMapper Mapper { get; }
    }
}
