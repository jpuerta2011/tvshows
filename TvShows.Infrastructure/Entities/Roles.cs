using System;
using System.Collections.Generic;

namespace TvShows.Infrastructure.Entities
{
    public partial class Roles
    {
        public int RoleId { get; set; }
        public string RoleName { get; set; }
        public bool? State { get; set; }
    }
}
