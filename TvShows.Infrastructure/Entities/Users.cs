using System;
using System.Collections.Generic;

namespace TvShows.Infrastructure.Entities
{
    public partial class Users
    {
        public long UserId { get; set; }
        public int RoleId { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public string Name { get; set; }
        public string LastName { get; set; }
        public bool? State { get; set; }
    }
}
