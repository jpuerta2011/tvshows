using System;
using System.Collections.Generic;
using System.Text;

namespace TvShows.Services.Models
{
    public class Show
    {
        public long ShowId { get; set; }
        public string Name { get; set; }
        public string Genres { get; set; }
        public IList<string> GenresList => Genres?.Split(",");
        public string Language { get; set; }
        public string Channel { get; set; }
        public TimeSpan? ScheduleTime { get; set; }
        public string Thumbnail { get; set; }
    }
}
