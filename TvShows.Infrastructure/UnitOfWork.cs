using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using TvShows.Common;
using TvShows.Infrastructure.Entities;

namespace TvShows.Infrastructure
{
    public class UnitOfWork : IUnitOfWork
    {
        /// <summary>
        /// The session
        /// </summary>
        private readonly TvShowsDbContext _context;

        public UnitOfWork(TvShowsDbContext context)
        {
            _context = context ?? throw new ArgumentNullException("context");
        }

        public void Commit()
        {
            _context.SaveChanges();
        }

        public async Task CommitAsync()
        {
            await _context.SaveChangesAsync();
        }
    }
}
