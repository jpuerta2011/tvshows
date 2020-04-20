using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace TvShows.Common
{
    /// <summary>
    /// Interface for UnitOfWork
    /// </summary>
    public interface IUnitOfWork
    {
        /// <summary>
        /// Commit the changes to the database and rollback if anything goes wrong.
        /// </summary>
        void Commit();

        /// <summary>
        /// Commit the changes to the database and rollback if anything goes wrong.
        /// </summary>
        Task CommitAsync();
    }
}
