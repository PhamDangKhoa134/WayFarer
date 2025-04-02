using Core.ApplicationService.Common;
using Core.ApplicationService.CoreModule.Abstracts;
using Core.Domain;
using Core.Dtos.UserDtos;
using Core.Infrastructure;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace Core.ApplicationService.CoreModule.Implements
{
    public class CoreService : CoreServiceBase, ICoreService
    {
        private IConfiguration _configuration;
        private readonly Jwtsettings _jwtsettings;
        public CoreService(
            IConfiguration configuration, 
            Jwtsettings jwtsettings,
            ILogger<CoreService> logger,
            CoreDbContext dbContext
        ) : base(logger, dbContext)
        {
        }

        public UserDto RegisterUser (RegisterDto dto)
        {
            var existUser = _dbContext.Users.FirstOrDefault(u => u.Email.ToLower() == dto.Email.ToLower());
            if (existUser == null) 
            {
                var passwordHasher = new PasswordHasher<User>();

                var user = new User()
                {
                    Email = dto.Email,
                    FullName = dto.FullName,
                    Password = passwordHasher.HashPassword(null, dto.Password),
                    DateOfBirth = dto.DateOfBirth,
                    Sex = dto.Sex,
                };

                _dbContext.Users.Add(user);
                _dbContext.SaveChanges();

                return new UserDto
                {
                    Id = user.Id,
                    FullName= user.FullName,
                    Email = user.Email,
                    Password = user.Password,
                    DateOfBirth = user.DateOfBirth,
                    Sex = user.Sex,
                };
            }
            else
            {
                throw new Exception("Email này đã tồn tại!!!");
            }
        }

        public string LoginUser(LoginDto input)
        {
            try
            {
                var user = CheckUser(input);
                if (user != null)
                {
                    var token = Createtokens(user);
                    return token;
                }
                throw new Exception("Không tìm thấy user");
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public bool VerifyPassword(string email, string password)
        {
            // Tìm người dùng dựa trên email hoặc số điện thoại
            var user = _dbContext.Users.FirstOrDefault(u => u.Email == email);
            if (user == null)
            {
                return false; // Không tìm thấy người dùng
            }

            var passwordHasher = new PasswordHasher<User>();

            // Kiểm tra mật khẩu
            var verificationResult = passwordHasher.VerifyHashedPassword(user, user.Password, password);

            return verificationResult == PasswordVerificationResult.Success;
        }

        private UserDto CheckUser(LoginDto userLogin)
        {
            var user = _dbContext.Users.FirstOrDefault(u => u.Email.ToLower() == userLogin.Email.ToLower());
            if (user == null || !VerifyPassword(user.Email, userLogin.Password))
                return null;

            // Mapping AuthUser to UserDto
            return new UserDto
            {
                Id = user.Id,
                FullName = user.FullName,
                Email = user.Email,
                Password = user.Password,
                DateOfBirth = user.DateOfBirth,
                Sex = user.Sex,
            };
        }

        private string Createtokens(UserDto user)
        {

            var claims = new[]
            {
                new Claim("Id", user.Id.ToString()),
                new Claim(JwtRegisteredClaimNames.Name, user.FullName),
                new Claim(JwtRegisteredClaimNames.Email, user.Email),
            };
            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("yourSecretKey123456789scretkeyfordemo"));
            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            var token = new JwtSecurityToken(
                issuer: "YourIssuer",
                audience: "YourAudience",
                claims: claims,
                expires: DateTime.Now.AddMinutes(130403),
                signingCredentials: creds
            );

            return new JwtSecurityTokenHandler().WriteToken(token);
        }

    }
}
