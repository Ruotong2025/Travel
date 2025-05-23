<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>


<rapid:override name="breadcrumb">
    <nav class="breadcrumb">
        <div class="bull"><i class="fa fa-volume-up"></i></div>
        <div id="scrolldiv">
            <div class="scrolltext">
                <ul style="margin-top: 0px;">
                    <c:forEach items="${noticeList}" var="n">
                        <li class="scrolltext-title">
                            <a href="/notice/${n.noticeId}" rel="bookmark">${n.noticeTitle}</a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </nav>
</rapid:override>

<rapid:override name="left">
    <div id="primary" class="content-area">

        <main id="main" class="site-main" role="main">
            <c:forEach items="${pageInfo.list}" var="a">

                <article class="post type-post">

                    <figure class="thumbnail">
                        <a href="/article/${a.articleId}">
                            <img width="280" height="210"
                                 src="${a.articleThumbnail}"
                                 class="attachment-content size-content wp-post-image"
                                 alt="${a.articleTitle}">
                        </a>
                        <span class="cat">
                                <a href="/category/${a.categoryList[a.categoryList.size()-1].categoryId}">
                                        ${a.categoryList[a.categoryList.size()-1].categoryName}
                                </a>
                            </span>
                    </figure>

                    <header class="entry-header">
                        <div style="display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap;">
                            <!-- 标题左对齐 -->
                            <div style="flex: 1; text-align: left;">
                                <h2 class="entry-title" style="margin: 0; font-weight: bold;">
                                    <a href="/article/${a.articleId}" rel="bookmark">
                                            ${a.articleTitle}
                                    </a>
                                </h2>
                            </div>
                        </div>
                    </header>

                    <div style="display: flex; justify-content: space-between; align-items: center; font-size: 14px; color: #666; white-space: nowrap; font-weight: bold;">
                        <!-- 目的地居中 -->
                        <div style="text-align: left; flex: 1;">
                            Destination：${a.articleDestination}
                        </div>

                        <!-- 日期右对齐，不换行 -->
                        <div style="text-align: right; flex: 1;">
                            <fmt:formatDate value="${a.articleStartdate}" pattern="MM/yyyy" /> - <fmt:formatDate value="${a.articleEnddate}" pattern="MM/yyyy" />
                        </div>
                    </div>

                    <div class="entry-content">
                        <div class="archive-content" style="display: -webkit-box;
                                                            -webkit-line-clamp: 3;
                                                            -webkit-box-orient: vertical;
                                                            overflow: hidden;
                                                            text-overflow: ellipsis;
                                                            height: 4.5em;
                                                            line-height: 1.5em;">
                                ${a.articleSummary}
                        </div>
                        <span class="title-l"></span>
                        <span class="new-icon">
                            <c:choose>
                                <c:when test="${a.articleStatus == 2}">
                                    <i class="fa fa-bookmark-o"></i>
                                </c:when>
                                <c:otherwise>
                                    <jsp:useBean id="nowDate" class="java.util.Date"/>
                                    <c:set var="interval"
                                           value="${nowDate.time - a.articleCreateTime.time}"/><%--时间差毫秒数--%>
                                    <fmt:formatNumber value="${interval/1000/60/60/24}" pattern="#0"
                                                      var="days"/>
                                    <c:if test="${days <= 7}">NEW</c:if>
                                </c:otherwise>
                            </c:choose>
                        </span>
                        <span class="entry-meta">
                            <span class="date">
                                <fmt:formatDate value="${a.articleCreateTime}" pattern="yyyy/MM/dd"/>
                            &nbsp;&nbsp;
                            </span>
                            <span class="views">
                                <i class="fa fa-eye"></i>
                                    ${a.articleViewCount} views
                            </span>
                            <span class="comment">&nbsp;&nbsp;
                                <a href="/article/${a.articleId}#comments" rel="external nofollow">
                                  <i class="fa fa-comment-o"></i>
                                    <c:choose>
                                        <c:when test="${a.articleCommentCount == 0}">
                                            Comment
                                        </c:when>
                                        <c:otherwise>
                                            ${a.articleCommentCount}
                                        </c:otherwise>
                                    </c:choose>

                                </a>
                            </span>
                        </span>
                        <div class="clear"></div>
                    </div><!-- .entry-content -->

                    <span class="entry-more">
                        <a href="/article/${a.articleId}"
                           rel="bookmark">
                            Whole Text
                        </a>
                    </span>
                </article>
            </c:forEach>
        </main>
        <%@ include file="Public/part/paging.jsp" %>

    </div>
</rapid:override>
<%--左侧区域 end--%>

<%--侧边栏 start--%>
<rapid:override name="right">
    <%@include file="Public/part/sidebar-2.jsp" %>
</rapid:override>
<%--侧边栏 end--%>

<%@ include file="Public/framework.jsp" %>