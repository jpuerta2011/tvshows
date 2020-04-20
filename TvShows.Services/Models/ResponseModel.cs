using System.Collections.Generic;

namespace TvShows.Services.Models
{
    public class ResponseModel<T>
    {
        public bool Success { get; set; }
        public List<string> Messages { get; set; }
        public T Data { get; set; }

        public ResponseModel()
        {
            Messages = new List<string>();
            Success = false;
        }
    }
}
