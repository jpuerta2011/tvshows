using System.Collections.Generic;

namespace TvShows.Infrastructure.Entities
{
    public partial class Roles
    {
        public Roles()
        {
            Users = new HashSet<Users>();
        }

        public int RoleId { get; set; }
        public string RoleName { get; set; }
        public bool? State { get; set; }

        public virtual ICollection<Users> Users { get; set; }
    }
}
