package com.travel.ssm.blog.entity;

public class Result {
    private int code;
    private String message;
    private Object data;

    public static Result create(int code, String message) {
        return new Result(code, message, null);
    }

    public static Result create(int code, String message, Object data) {
        return new Result(code, message, data);
    }

    private Result(int code, String message, Object data) {
        this.code = code;
        this.message = message;
        this.data = data;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
} 