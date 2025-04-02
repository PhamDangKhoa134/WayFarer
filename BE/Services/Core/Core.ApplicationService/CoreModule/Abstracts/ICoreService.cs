using Core.Dtos.UserDtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.ApplicationService.CoreModule.Abstracts
{
    public interface ICoreService
    {
        UserDto RegisterUser(RegisterDto dto);
        string LoginUser(LoginDto input);
        bool VerifyPassword(string email, string password);
    }
}
