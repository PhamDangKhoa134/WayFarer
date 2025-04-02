using Core.ApplicationService.CoreModule.Abstracts;
using Core.Dtos.UserDtos;
using Microsoft.AspNetCore.Mvc;

namespace WebAPI.WayFarer.Controllers
{
    [Route("api/core")]
    [ApiController]
    public class CoreController : ControllerBase
    {
        private readonly ICoreService _coreService;
        public CoreController(ICoreService coreService)
        {
            _coreService = coreService;
        }

        [HttpPost("login-auth")]
        public IActionResult LoginUser(LoginDto input)
        {
            try
            {

                var result = _coreService.LoginUser(input);
                if (result == null)
                {
                    return Unauthorized(new { message = "Thông tin đăng nhập không hợp lệ" });
                }
                return Ok(new { message = "Đăng nhập thành công", data = result });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { message = "Email và mật khẩu không đúng", error = ex.Message });
            }
        }

        [HttpPost("login")]
        public IActionResult Login(LoginDto input)
        {
            var isPasswordValid = _coreService.VerifyPassword(input.Email, input.Password);

            if (!isPasswordValid)
            {
                return Unauthorized(new { message = "Mật khẩu hoặc tài khoản không chính xác" });
            }

            return Ok(new { message = "Đăng nhập thành công" });
        }

        [HttpPost("create-user")]
        public IActionResult RegisterUser (RegisterDto input)
        {
            try
            {

                var result = _coreService.RegisterUser(input);
                if (result == null)
                {
                    return BadRequest(new { message = "Thêm người dùng không thành công" });
                }
                return Ok(new { message = "Thêm thành công", data = result });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { message = "Vui lòng điền đầy đủ thông tin", error = ex.Message });
            }
        }
    }
}
