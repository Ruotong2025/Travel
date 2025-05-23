<%--
    一般用于首页侧边栏：
    包括 关于本站，网站概况，热评文章，所有标签，随机文章 等小工具

--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%--旅游网站主体-右侧侧边栏 start--%>
<div id="sidebar" class="widget-area all-sidebar"
     style="position: relative; overflow: visible; box-sizing: border-box; min-height: 1px;">

    <%--网站概况 start--%>
    <aside id="php_text-22" class="widget php_text">
        <h3 class="widget-title">
            <i class="fa fa-bars"></i>Overview
        </h3>
        <div class="textwidget widget-text">
            <ul class="site-profile">
                <li><i class="fa fa-file-o"></i> Articles：${siteBasicStatistics[0]} </li>
                <li><i class="fa fa-commenting-o"></i> Comments：${siteBasicStatistics[1]} </li>
                <li><i class="fa fa-folder-o"></i> Classifications：${siteBasicStatistics[2]} </li>
                <li><i class="fa fa-tags"></i> Labels：${siteBasicStatistics[3]} </li>
                <li><i class="fa fa-link"></i> Links：${siteBasicStatistics[4]} </li>
                <li><i class="fa fa-eye"></i> Views：${siteBasicStatistics[5]} </li>
                <li><i class="fa fa-pencil-square-o"></i> Latest Update：
                    <span style="color:#2F889A">
                                        <fmt:formatDate value="${lastUpdateArticle.articleUpdateTime}" pattern="yyyy/MM/dd"/>

                                   </span>
                </li>
            </ul>
        </div>
        <div class="clear"></div>
    </aside>
    <%--网站概况 end--%>

    <%--搜索框--%>
    <aside class="widget widget_search">
        <div class="searchbar">
            <form method="get" id="searchform1" action="/search">
                <span> <input type="text" name="keywords" id="s1" placeholder="Type your destination..." required="" value="${param.keywords}">
                    <button type="submit" id="searchsubmit1">Search</button>
                </span>
            </form>
        </div>
        <div class="clear"></div>
    </aside>
    <%--搜索框--%>

    <%--所有标签 start--%>
    <aside class="widget">
        <h3 class="widget-title">
            <i class="fa fa-bars"></i>Tags
        </h3>
        <div class="tagcloud">
            <c:forEach items="${allTagList}" var="tag">
                <a href="/tag/${tag.tagId}"
                   class="tag-link-129 tag-link-position-1"
                   style="font-size: 14px;">
                        ${tag.tagName}
                </a>
            </c:forEach>
            <div class="clear"></div>
        </div>
        <div class="clear"></div>
    </aside>
    <%--所有标签 end--%>


    <%--最新评论 start--%>
    <aside id="recent_comments-2" class="widget recent_comments wow fadeInUp" data-wow-delay="0.3s"><h3
            class="widget-title"><i class="fa fa-bars"></i>Recent Comments</h3>
        <div id="message" class="message-widget">
            <ul>
                <c:forEach items="${recentCommentList}" var="r">
                <li style="border: none;">
                    <a href="/article/${r.commentArticleId}/#anchor-comment-${r.commentId}"  rel="external nofollow">
                        <%--<img alt="" src="${r.commentAuthorAvatar}" class="avatar avatar-64 photo" height="64" width="64">--%>
                        <span class="comment_author">
                            <strong>${r.commentAuthorName}</strong>
                        </span>
                            ${r.commentContent}
                    </a>
                </li>
                </c:forEach>
            </ul>
        </div>
        <div class="clear"></div>
    </aside>
    <%--最新评论 end--%>

</div>



<%--旅游网站主体-右侧侧边栏 end--%>
