namespace TvShows.Services.Models
{
    public class Users
    {
        public long? UserId { get; set; }
        public string Name { get; set; }
        public string LastName { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public string VerifyPassword { get; set; }
        public int RoleId { get; set; }
        public string Role { get; set; }
        public bool? State { get; set; }
        public bool NewPassword { get; set; }
    }
}
