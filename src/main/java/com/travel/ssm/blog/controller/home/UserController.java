package com.travel.ssm.blog.controller.home;


import com.travel.ssm.blog.entity.Article;
import com.travel.ssm.blog.entity.User;
import com.travel.ssm.blog.enums.UserRole;
import com.travel.ssm.blog.service.ArticleService;
import com.travel.ssm.blog.service.UserService;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * @author travel
 */
@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private ArticleService articleService;


    /**
     * 基本信息页面显示
     *
     * @return
     */
    @RequestMapping(value = "/home/profile")
    public ModelAndView userProfileView(HttpSession session) {

        ModelAndView modelAndView = new ModelAndView();
        User sessionUser = (User) session.getAttribute("user");
        User user = userService.getUserById(sessionUser.getUserId());
        modelAndView.addObject("user", user);
        modelAndView.setViewName("Home/User/profile");

        //侧边栏显示
        //获得热评文章
        List<Article> mostCommentArticleList = articleService.listArticleByCommentCount(8);
        modelAndView.addObject("mostCommentArticleList", mostCommentArticleList);

        return modelAndView;
    }

    /**
     * 编辑个人信息页面显示
     *
     * @param session
     * @return
     */
    @RequestMapping(value = "/home/profile/edit")
    public ModelAndView editUserView(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();
        User loginUser = (User) session.getAttribute("user");
        User user = userService.getUserById(loginUser.getUserId());
        modelAndView.addObject("user", user);

        //侧边栏显示
        //获得热评文章
        List<Article> mostCommentArticleList = articleService.listArticleByCommentCount(8);
        modelAndView.addObject("mostCommentArticleList", mostCommentArticleList);


        modelAndView.setViewName("Home/User/editProfile");
        return modelAndView;
    }


    /**
     * 编辑用户提交
     *
     * @param user
     * @return
     */
    @RequestMapping(value = "/home/profile/save", method = RequestMethod.POST)
    public String saveProfile(User user, HttpSession session) {
        User dbUser = (User) session.getAttribute("user");

        user.setUserId(dbUser.getUserId());
        userService.updateUser(user);
        return "redirect:/home/profile";
    }

    /**
     * 检查用户名是否存在
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/checkUserName", method = RequestMethod.POST, produces = {"text/plain;charset=UTF-8"})
    @ResponseBody
    public String checkUserName(HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        String username = request.getParameter("username");
        User user = userService.getUserByName(username);
        int id = Integer.valueOf(request.getParameter("id"));
        //用户名已存在,但不是当前用户(编辑用户的时候，不提示)
        if (user != null) {
            if (user.getUserId() != id) {
                map.put("code", 1);
                map.put("msg", "用户名已存在！");
            }
        } else {
            map.put("code", 0);
            map.put("msg", "");
        }
        String result = new JSONObject(map).toString();
        return result;
    }

    /**
     * 检查Email是否存在
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/checkUserEmail", method = RequestMethod.POST, produces = {"text/plain;charset=UTF-8"})
    @ResponseBody
    public String checkUserEmail(HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        String email = request.getParameter("email");
        User user = userService.getUserByEmail(email);
        int id = Integer.valueOf(request.getParameter("id"));
        //用户名已存在,但不是当前用户(编辑用户的时候，不提示)
        if (user != null) {
            if (user.getUserId() != id) {
                map.put("code", 1);
                map.put("msg", "电子邮箱已存在！");
            }
        } else {
            map.put("code", 0);
            map.put("msg", "");
        }
        String result = new JSONObject(map).toString();
        return result;
    }

    /**
     * 删除用户
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/delete/{id}")
    public String deleteUser(@PathVariable("id") Integer id) {
        userService.deleteUser(id);
        return "redirect:/home/user";
    }

    /**
     * 编辑用户页面显示
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/edit/{id}")
    public ModelAndView editUserView(@PathVariable("id") Integer id) {
        ModelAndView modelAndView = new ModelAndView();

        User user = userService.getUserById(id);
        modelAndView.addObject("user", user);

        modelAndView.setViewName("Home/User/edit");
        return modelAndView;
    }


    /**
     * 编辑用户提交
     *
     * @param user
     * @return
     */
    @RequestMapping(value = "/editSubmit", method = RequestMethod.POST)
    public String editUserSubmit(User user) {
        userService.updateUser(user);
        return "redirect:/home/user";
    }

}
