package com.travel.ssm.blog.controller.admin;

import com.travel.ssm.blog.entity.Article;
import com.travel.ssm.blog.entity.Comment;
import com.travel.ssm.blog.entity.User;
import com.travel.ssm.blog.enums.UserRole;
import com.travel.ssm.blog.service.ArticleService;
import com.travel.ssm.blog.service.CommentService;
import com.travel.ssm.blog.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author travel
 */
@Controller
public class AdminController {
    @Autowired
    private UserService userService;

    @Autowired
    private ArticleService articleService;

    @Autowired
    private CommentService commentService;

    /**
     * 后台首页
     *
     * @return
     */
    @RequestMapping("/admin")
    public String index(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        Integer userId = null;
        if (!UserRole.ADMIN.getValue().equals(user.getUserRole())) {
            // 用户查询自己的文章, 管理员查询所有的
            userId = user.getUserId();
        }
        //文章列表
        List<Article> articleList = articleService.listRecentArticle(userId, 5);
        model.addAttribute("articleList", articleList);

        //评论列表
        List<Comment> commentList = commentService.listRecentComment(userId, 5);
        model.addAttribute("commentList", commentList);
        return "Admin/index";
    }

    /**
     * 退出登录
     *
     * @param session
     * @return
     */
    @RequestMapping(value = "/admin/logout")
    public String adminLogout(HttpSession session) {
        session.removeAttribute("user");
        session.invalidate();
        return "redirect:/login";
    }
}
