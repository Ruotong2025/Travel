package com.travel.ssm.blog.enums;

/**
 * @author Laura
 * @date 2025/4/17 下午4:47
 */

public enum ArticleCommentStatus {

    ALLOW(1, "允许"),
    NOT_ALLOW(0, "不允许");

    private Integer value;

    private String message;

    ArticleCommentStatus(Integer value, String message) {
        this.value = value;
        this.message = message;
    }

    public Integer getValue() {
        return value;
    }

    public void setValue(Integer value) {
        this.value = value;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
