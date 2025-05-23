package com.travel.ssm.blog.dto;

import lombok.Data;

import java.util.Date;
import java.util.List;

/**
 * @author Laura
 * @date 2025/4/25 下午3:56
 */
@Data
public class ArticleParam {

    private Integer articleId;

    private String articleTitle;

    private String articleContent;

    private Integer articleParentCategoryId;

    private Integer articleChildCategoryId;

    private Integer articleOrder;

    private Integer articleStatus;

    private String articleThumbnail;

    private List<Integer> articleTagIds;

    private String articleDestination;

    private Date articleStartdate;  // 格式: yyyy/MM/dd

    private Date articleEnddate;    // 格式: yyyy/MM/dd


}
