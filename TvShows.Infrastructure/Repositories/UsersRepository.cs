using TvShows.Infrastructure.Entities;

namespace TvShows.Infrastructure.Repositories
{
    public interface IUsersRepository : Base.IBaseRepository<long, Users>
    {

    }

    public class UsersRepository : Base.BaseRepository<long, Users>, IUsersRepository
    {
        public UsersRepository(TvShowsDbContext context) : base(context) { }
    }
}
