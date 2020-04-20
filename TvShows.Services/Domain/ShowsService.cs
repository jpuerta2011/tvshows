using System;
using System.Collections.Generic;
using System.Text;
using AutoMapper;
using TvShows.Common;
using TvShows.Infrastructure;
using TvShows.Services.Base;

namespace TvShows.Services.Domain
{
    public interface IShowsService : IService
    {

    }

    public class ShowsService : Service, IShowsService
    {
        public ShowsService(IRepositoryFactory repositoryFactory, IUnitOfWork unitOfWork, IMapper mapper) : base(repositoryFactory, unitOfWork, mapper)
        {
        }


    }
}
