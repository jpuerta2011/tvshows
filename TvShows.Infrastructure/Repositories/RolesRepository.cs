using TvShows.Infrastructure.Entities;

namespace TvShows.Infrastructure.Repositories
{
    public interface IRolesRepository : Base.IBaseRepository<long, Roles>
    {

    }

    public class RolesRepository : Base.BaseRepository<long, Roles>, IRolesRepository
    {
        public RolesRepository(TvShowsDbContext context) : base(context) { }
    }
}
