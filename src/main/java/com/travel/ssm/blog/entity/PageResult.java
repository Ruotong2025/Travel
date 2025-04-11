package com.travel.ssm.blog.entity;

import lombok.Data;

import java.io.Serializable;

@Data
public class PageResult implements Serializable {
    private static final long serialVersionUID = 1L;
    private Object[] data;
    private Integer currentPage;
    private Integer pageSize;
    private Integer totalItems;
    private Integer totalPages;

    public PageResult(Object[] data, Integer currentPage, Integer pageSize, Integer totalItems, Integer totalPages) {
        this.data = data;
        this.currentPage = currentPage;
        this.pageSize = pageSize;
        this.totalItems = totalItems;
        this.totalPages = totalPages;
    }

    public Object[] getData() {
        return data;
    }

    public void setData(Object[] data) {
        this.data = data;
    }

    public Integer getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(Integer currentPage) {
        this.currentPage = currentPage;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getTotalItems() {
        return totalItems;
    }

    public void setTotalItems(Integer totalItems) {
        this.totalItems = totalItems;
    }

    public Integer getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(Integer totalPages) {
        this.totalPages = totalPages;
    }
} 