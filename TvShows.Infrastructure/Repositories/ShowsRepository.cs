using System;
using System.Collections.Generic;
using System.Text;
using TvShows.Infrastructure.Entities;

namespace TvShows.Infrastructure.Repositories
{
    public interface IShowsRepository : Base.IBaseRepository<long, Shows>
    {

    }

    public class ShowsRepository : Base.BaseRepository<long, Shows>, IShowsRepository
    {
        public ShowsRepository(TvShowsDbContext context) : base(context) { }
    }
}
