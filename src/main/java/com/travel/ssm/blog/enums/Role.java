package com.travel.ssm.blog.enums;

/**
 * @author Laura
 * @date 2025/4/17 下午4:47
 */

public enum Role {

    OWNER(1, "博主"),
    VISITOR(0, "其他用户");

    private Integer value;

    private String message;

    Role(Integer value, String message) {
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
