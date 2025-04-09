<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>

<rapid:override name="header-style">
    <style>
        .entry-title {
            background: #f8f8f8;
        }
    </style>
    <link rel="stylesheet" href="/plugin/layui/css/layui.css">
</rapid:override>


<rapid:override name="breadcrumb">
    <%--面包屑导航 start--%>
    <nav class="breadcrumb">
        <a class="crumbs" href="/">
            <i class="fa fa-home"></i>首页
        </a>
        <i class="fa fa-angle-right"></i>
        创建游记
        <i class="fa fa-angle-right"></i>
        正文
    </nav>
    <%--面包屑导航 end--%>
</rapid:override>


<rapid:override name="left">

<div id="primary" class="content-area">
    <main id="main" class="site-main" role="main">
        <article class="post" style="min-height: 500px;">
            <header class="entry-header">
                <h1 class="entry-title">
                    创建游记
                </h1>
            </header><!-- .entry-header -->
            <div class="layui-tab layui-tab-card">
                <form id="articleForm" method="post">
                    <input type="hidden" name="currentUrl" id="currentUrl" value="">
                    <table class="layui-table">
                        <colgroup>
                            <col width="100">
                            <col width="100">
                            <col width="150">
                            <col width="100">
                            <col width="50">
                        </colgroup>
                        <thead>
                        <tr>
                            <th>标题</th>
                            <th>状态</th>
                            <th>发布时间</th>
                            <th>操作</th>
                            <th>id</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${pageInfo.list}" var="a">
                            <tr>
                                <td>
                                    <a href="/article/${a.articleId}"
                                       target="_blank">
                                            ${a.articleTitle}

                                    </a>
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${a.articleStatus == 1}">
                                            <a href="/admin/article?status=1">
                                                <span style="color:#5FB878;">已发布</span>
                                            </a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="/admin/article?status=0">
                                                <span style="color:#FF5722;">草稿</span>
                                            </a>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <fmt:formatDate value="${a.articleCreateTime}"
                                                    pattern="yyyy-MM-dd HH:mm:ss"/>
                                </td>
                                <td>
                                    <div style="display: flex; gap: 6px;">
                                        <a href="/admin/article/edit/${a.articleId}"
                                           class="layui-btn layui-btn-mini">编辑</a>
                                        <a href="javascript:void(0)"
                                           onclick="deleteArticle(${a.articleId})"
                                           class="layui-btn layui-btn-danger layui-btn-mini">删除</a>
                                    </div>
                                </td>
                                <td>${a.articleId}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </form>
                <%@ include file="../Public/paging.jsp" %>
            </div>

        </form>
        </article>>
    </main>
</div>

</rapid:override>

<%--侧边栏 start--%>
<rapid:override name="right">
    <%@include file="../Public/part/sidebar-3.jsp" %>
</rapid:override>
<%--侧边栏 end--%>


<%@ include file="../Public/framework.jsp" %>