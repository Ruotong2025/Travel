package com.travel.ssm.blog.controller.home;

import com.travel.ssm.blog.dto.JsonResult;
import com.travel.ssm.blog.entity.User;
import com.travel.ssm.blog.enums.UserRole;
import com.travel.ssm.blog.service.UserService;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import static com.travel.ssm.blog.util.MyUtils.getIpAddr;

/**
 * 处理前台登录和注册的控制器
 */
@Controller
public class HomeLoginController {

    @Autowired
    private UserService userService;

    /**
     * 登录页面显示
     *
     * @return
     */
    @RequestMapping(value = {"/", "/login"})
    public String loginPage() {
        return "Home/User/login";
    }

    /**
     * 注册页面显示
     *
     * @return
     */
    @RequestMapping("/register")
    public String registerPage() {
        return "Home/User/register";
    }

    /**
     * 登录验证
     *
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/loginVerify", method = RequestMethod.POST, produces = {"text/plain;charset=UTF-8"})
    @ResponseBody
    public String loginVerify(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> map = new HashMap<String, Object>();

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String rememberme = request.getParameter("rememberme");
        User user = userService.getUserByNameOrEmail(username);
        if (user == null || !user.getUserPass().equals(password) || user.getUserStatus() == 0) {
            map.put("code", 0);
            map.put("msg", "The email address or password is incorrect");
        } else {
            //登录成功
            map.put("code", 1);
            map.put("msg", "");
            //添加session
            request.getSession().setAttribute("user", user);
            //添加cookie
            if (rememberme != null) {
                //创建两个Cookie对象
                Cookie nameCookie = new Cookie("username", username);
                //设置Cookie的有效期为3天
                nameCookie.setMaxAge(60 * 60 * 24 * 3);
                Cookie pwdCookie = new Cookie("password", password);
                pwdCookie.setMaxAge(60 * 60 * 24 * 3);
                response.addCookie(nameCookie);
                response.addCookie(pwdCookie);
            }
            user.setUserLastLoginTime(new Date());
            user.setUserLastLoginIp(getIpAddr(request));
            userService.updateUser(user);

        }
        String result = new JSONObject(map).toString();
        return result;
    }

    /**
     * 注册验证
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/registerSubmit", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult registerSubmit(HttpServletRequest request) {
        String username = request.getParameter("username");
        String nickname = request.getParameter("nickname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        User checkUserName = userService.getUserByName(username);
        if (checkUserName != null) {
            return new JsonResult().fail("The user name already exists");
        }
        User checkEmail = userService.getUserByEmail(email);
        if (checkEmail != null) {
            return new JsonResult().fail("The email address already exists");
        }

        // 添加用户
        User user = new User();
        user.setUserAvatar("/img/avatar/avatar.png");
        user.setUserName(username);
        user.setUserNickname(nickname);
        user.setUserPass(password);
        user.setUserEmail(email);
        user.setUserStatus(1);
        user.setArticleCount(0);
        user.setUserRole(UserRole.USER.getValue());
        try {
            userService.insertUser(user);
        } catch (Exception e) {
            e.printStackTrace();
            return new JsonResult().fail("System exception");
        }
        return new JsonResult().ok("Registered successfully");
    }

    /**
     * 退出登录
     *
     * @param session
     * @return
     */
    @RequestMapping(value = "/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("user");
        session.invalidate();
        return "redirect:/login";
    }
} 