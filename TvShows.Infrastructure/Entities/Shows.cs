using System;
using System.Collections.Generic;

namespace TvShows.Infrastructure.Entities
{
    public partial class Shows
    {
        public long ShowId { get; set; }
        public string Name { get; set; }
        public string Genres { get; set; }
        public string Language { get; set; }
        public string Channel { get; set; }
        public TimeSpan? ScheduleTime { get; set; }
        public string Thumbnail { get; set; }
    }
}
