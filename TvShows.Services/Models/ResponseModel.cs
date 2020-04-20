using System;
using System.Collections.Generic;
using System.Text;

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
