package com.travel.ssm.blog.controller.home;

import cn.hutool.http.HtmlUtil;
import com.travel.ssm.blog.dto.JsonResult;
import com.travel.ssm.blog.entity.Article;
import com.travel.ssm.blog.entity.Comment;
import com.travel.ssm.blog.entity.User;
import com.travel.ssm.blog.enums.ArticleStatus;
import com.travel.ssm.blog.enums.Role;
import com.travel.ssm.blog.service.ArticleService;
import com.travel.ssm.blog.service.CommentService;
import com.travel.ssm.blog.util.MyUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.concurrent.ConcurrentHashMap;
import java.util.logging.Logger;

/**
 * @author Laura
 * @date 2025/4/10
 */

@Controller
@RestController
public class CommentController {
    private static final Logger logger = Logger.getLogger(CommentController.class.getName());
    
    @Autowired
    private CommentService commentService;

    @Autowired
    private ArticleService articleService;
    
    // 用于跟踪最近的评论提交，防止重复提交
    // 键是"用户ID_文章ID"，值是提交时间
    private static final Map<String, Long> recentUserComments = new ConcurrentHashMap<>();
    // 防止重复提交的时间间隔（毫秒）
    private static final long COMMENT_INTERVAL = 3000; // 3秒

    /**
     * 添加评论
     *
     * @param request
     * @param comment
     */
    @RequestMapping(value = "/comment", method = {RequestMethod.POST})
    public JsonResult insertComment(HttpServletRequest request, Comment comment, HttpSession session) {
        logger.info("收到评论提交请求: " + comment.getCommentArticleId());
        
        User user = (User) session.getAttribute("user");
        if (user == null) {
            logger.warning("未登录用户尝试评论");
            return new JsonResult().fail("请先登录");
        }
        
        Article article = articleService.getArticleByStatusAndId(ArticleStatus.PUBLISH.getValue(), comment.getCommentArticleId());
        if (article == null) {
            logger.warning("评论的文章不存在: " + comment.getCommentArticleId());
            return new JsonResult().fail("文章不存在");
        }
        
        // 检查评论内容是否为空
        if (comment.getCommentContent() == null || comment.getCommentContent().trim().isEmpty()) {
            logger.warning("评论内容为空");
            return new JsonResult().fail("评论内容不能为空");
        }

        // 检查是否是重复提交（同一用户对同一文章在短时间内的评论）
        String commentKey = user.getUserId() + "_" + comment.getCommentArticleId();
        Long lastSubmitTime = recentUserComments.get(commentKey);
        long currentTime = System.currentTimeMillis();
        
        logger.info("用户: " + user.getUserId() + " 评论文章: " + comment.getCommentArticleId() + 
                   " 上次评论时间: " + (lastSubmitTime != null ? new Date(lastSubmitTime) : "无"));
        
        if (lastSubmitTime != null && (currentTime - lastSubmitTime) < COMMENT_INTERVAL) {
            logger.warning("用户评论提交过于频繁: " + user.getUserId());
            return new JsonResult().fail("提交太频繁，请稍后再试");
        }
        
        // 更新最近评论提交记录
        recentUserComments.put(commentKey, currentTime);

        // 限制评论内容长度为255个字符
        if (comment.getCommentContent() != null && comment.getCommentContent().length() > 255) {
            comment.setCommentContent(comment.getCommentContent().substring(0, 255));
            logger.info("评论内容超长，已截断至255字符");
        }

        // 计算评论楼层
        Integer commentFloor = 1;
        List<Comment> existingComments = commentService.listCommentByArticleId(comment.getCommentArticleId());

        if (comment.getCommentPid() != null && comment.getCommentPid() > 0) {
            // 如果是回复评论，找出同一父评论下的所有回复，计算楼层
            int maxChildFloor = 0;
            for (Comment existingComment : existingComments) {
                if (existingComment.getCommentPid() != null && 
                    existingComment.getCommentPid().equals(comment.getCommentPid()) && 
                    existingComment.getCommentFloor() != null) {
                    maxChildFloor = Math.max(maxChildFloor, existingComment.getCommentFloor());
                }
            }
            commentFloor = maxChildFloor + 1;
        } else {
            // 如果是顶级评论，找出所有顶级评论，计算楼层
            int maxRootFloor = 0;
            for (Comment existingComment : existingComments) {
                if ((existingComment.getCommentPid() == null || existingComment.getCommentPid() == 0) && 
                    existingComment.getCommentFloor() != null) {
                    maxRootFloor = Math.max(maxRootFloor, existingComment.getCommentFloor());
                }
            }
            commentFloor = maxRootFloor + 1;
        }
        comment.setCommentFloor(commentFloor);
        logger.info("计算评论楼层: " + commentFloor);

        //添加评论
        comment.setCommentUserId(user.getUserId());
        comment.setCommentCreateTime(new Date());
        comment.setCommentIp(MyUtils.getIpAddr(request));
        if (Objects.equals(user.getUserId(), article.getArticleUserId())) {
            comment.setCommentRole(Role.OWNER.getValue());
        } else {
            comment.setCommentRole(Role.VISITOR.getValue());
        }
        comment.setCommentAuthorAvatar(user.getUserAvatar());

        //过滤字符，防止XSS攻击
        comment.setCommentContent(HtmlUtil.escape(comment.getCommentContent()));

        comment.setCommentAuthorName(user.getUserNickname());
        comment.setCommentAuthorEmail(user.getUserEmail());
        comment.setCommentAuthorUrl(user.getUserUrl());
        try {
            logger.info("保存评论到数据库");
            commentService.insertComment(comment);
            //更新文章的评论数
            articleService.updateCommentCount(article.getArticleId());
            logger.info("评论保存成功，ID: " + comment.getCommentId());
        } catch (Exception e) {
            logger.severe("评论保存失败: " + e.getMessage());
            e.printStackTrace();
            return new JsonResult().fail("评论保存失败");
        }
        return new JsonResult().ok();
    }

    /**
     * 获取新评论
     *
     * @param articleId    文章ID
     * @param lastCommentId 最后一条评论的ID
     * @return 新评论列表
     */
    @RequestMapping(value = "/comment/new", method = {RequestMethod.GET})
    public List<Comment> getNewComments(@RequestParam("articleId") Integer articleId,
                                      @RequestParam("lastCommentId") Integer lastCommentId,
                                      HttpServletResponse response) {
        logger.info("获取新评论请求: 文章ID=" + articleId + ", 最后评论ID=" + lastCommentId);
        
        // 设置响应头，防止浏览器缓存
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
        
        // 获取文章的所有评论
        List<Comment> commentList = commentService.listCommentByArticleId(articleId);
        List<Comment> newComments = new ArrayList<>();

        // 过滤出比lastCommentId新的评论
        if (commentList != null && commentList.size() > 0) {
            for (Comment comment : commentList) {
                if (comment.getCommentId() > lastCommentId) {
                    newComments.add(comment);
                }
            }
        }
        
        // 按照评论ID倒序排列（最新的评论在前）
        Collections.sort(newComments, (c1, c2) -> c2.getCommentId().compareTo(c1.getCommentId()));
        
        logger.info("找到 " + newComments.size() + " 条新评论");
        return newComments;
    }
}
