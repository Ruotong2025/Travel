package com.travel.ssm.blog.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * @author travel
 */
@Data
public class Article implements Serializable{

    private static final long serialVersionUID = 5207865247400761539L;

    private Integer articleId;

    private Integer articleUserId;

    private String articleTitle;

    private Integer articleViewCount;

    private Integer articleCommentCount;

    private Integer articleLikeCount;

    private Date articleCreateTime;

    private Date articleUpdateTime;

    private Integer articleIsComment;

    private Integer articleStatus;

    private Integer articleOrder;

    private String articleContent;

    private String articleSummary;

    private String articleThumbnail;

    private User user;

    private List<Tag> tagList;

    private List<Category> categoryList;

    private String articleDestination;

    private Date articleStartdate;  // 格式: yyyy/MM/dd
    
    private Date articleEnddate;    // 格式: yyyy/MM/dd


}