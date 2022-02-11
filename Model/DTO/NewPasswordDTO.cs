using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace karcis_API.Model.DTO
{
    public class NewPasswordDTO 
    {
        public string Token { get; set; }
        public string NewPassword { get; set; }
    }
}
