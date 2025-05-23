package com.travel.ssm.blog.enums;

/**
 * @author Laura
 * @date 2025/4/17 下午4:47
 */

public enum LinkStatus {

    NORMAL(1, "显示"),
    HIDDEN(0, "隐藏");

    private Integer value;

    private String message;

    LinkStatus(Integer value, String message) {
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
