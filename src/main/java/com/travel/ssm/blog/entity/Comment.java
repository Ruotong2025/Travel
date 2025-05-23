package com.travel.ssm.blog.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 文章评论
 *
 * @author travel
 */
@Data
public class Comment implements Serializable {

    private static final long serialVersionUID = -1038897351672911219L;
    private Integer commentId;

    private Integer commentPid;

    private String commentPname;

    private Integer commentArticleId;

    private String commentAuthorName;

    private String commentAuthorEmail;

    private String commentAuthorUrl;

    private String commentAuthorAvatar;

    private String commentContent;

    private String commentAgent;

    private String commentIp;

    private Date commentCreateTime;

    /**
     * 评论楼层数
     */
    private Integer commentFloor;

    /**
     * 角色(管理员1，访客0)
     */
    private Integer commentRole;

    /**
     * 评论用户ID
     */
    private Integer commentUserId;

    /**
     * 非数据库字段
     */
    private Article article;
}