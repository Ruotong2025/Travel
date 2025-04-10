<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>

<rapid:override name="title">
    <title>${article.articleTitle}</title>
</rapid:override>

<rapid:override name="header-style">
    <rapid:override name="header-style">
        <link rel="stylesheet" href="/css/highlight.css">
        <style>
            .entry-title {
                background: #f8f8f8;
            }
            .entry-content {
                min-height: 300px;
            }
        </style>
    </rapid:override>
</rapid:override>

<rapid:override name="breadcrumb">
    <%--面包屑导航 start--%>
    <nav class="breadcrumb">
        <a class="crumbs" href="/">
            <i class="fa fa-home"></i>首页
        </a>
        <c:choose>
            <c:when test="${article.categoryList != null && article.categoryList.size() > 0}">
                <c:forEach items="${article.categoryList}" var="c">
                    <i class="fa fa-angle-right"></i>
                    <a href="/category/${c.categoryId}">
                            ${c.categoryName}
                    </a>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <i class="fa fa-angle-right"></i>
                <a>未分类</a>
            </c:otherwise>
        </c:choose>
        <i class="fa fa-angle-right"></i>
        正文
    </nav>
    <%--面包屑导航 end--%>
</rapid:override>


<rapid:override name="left">
    <%--旅游网站主体-左侧文章正文 start--%>
    <div id="primary" class="content-area">
        <main id="main" class="site-main" role="main">
            <article class="post" id="articleDetail" data-id="${article.articleId}">
                <header class="entry-header">
                    <h1 class="entry-title">
                            ${article.articleTitle}
                    </h1>
                </header><!-- .entry-header -->
                <!-- 目的地、开始日期和结束日期放在标题下面 -->
                <div style="display: flex; justify-content: space-between; font-size: 14px; color: #666; margin-top: 10px;">
                    <!-- 目的地居左 -->
                    <div style="flex: 1; text-align: left;">
                        目的地：${article.articleDestination}
                    </div>

                    <!-- 日期居右 -->
                    <div style="flex: 1; text-align: right;">
                        <fmt:formatDate value="${article.articleStartdate}" pattern="MM/yyyy" /> - <fmt:formatDate value="${article.articleEnddate}" pattern="MM/yyyy" />
                    </div>
                </div>

                <!-- 增加一行空的div来隔开目的地和文章内容 -->
                <div style="margin-top: 20px;"></div>

                <div class="entry-content">
                    <div class="single-content">
                            ${article.articleContent}
                    </div>
                    <div class="clear"></div>

                    <footer class="single-footer">
                        <ul class="single-meta">
                            <c:if test="${sessionScope.user!=null && (sessionScope.user.userId == article.articleUserId || sessionScope.user.userRole == 'admin')}">
                                <li class="edit-link">
                                    <a target="_blank" class="post-edit-link"
                                       href="/admin/article/edit/${article.articleId}">编辑</a>
                                </li>
                            </c:if>
                            <li class="comment">
                                <a href="/article/${article.articleId}#comments"
                                   rel="external nofollow">
                                    <i class="fa fa-comment-o"></i>
                                    <i class="comment-count">${commentList.size()}</i>
                                </a>
                            </li>
                            <li class="views">
                                <i class="fa fa-eye"></i> <span
                                    class="articleViewCount">${article.articleViewCount}</span>
                                views
                            </li>
                            <li class="r-hide">
                                <a href="javascript:pr()" title="侧边栏">
                                    <i class="fa fa-caret-left"></i>
                                    <i class="fa fa-caret-right"></i>
                                </a>
                            </li>
                        </ul>
                        <ul id="fontsize">
                            <li>A+</li>
                        </ul>
                        <div class="single-cat-tag">
                            <div class="single-cat">所属分类：
                                <c:forEach items="${article.categoryList}" var="c">
                                    <a href="/category/${c.categoryId}">
                                            ${c.categoryName}
                                    </a>
                                </c:forEach>
                            </div>
                        </div>
                    </footer><!-- .entry-footer -->


                    <div class="clear"></div>
                </div><!-- .entry-content -->
            </article><!-- #post -->


                <%--所属标签 start--%>
            <div class="single-tag">
                <ul class="" data-wow-delay="0.3s">
                    <c:forEach items="${article.tagList}" var="t">
                        <li>
                            <a href="/tag/${t.tagId}" rel="tag"
                               style="background:#666666">
                                    ${t.tagName}
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
                <%--所属标签 end--%>


                <%--版权声明 start--%>
            <div class="authorbio wow fadeInUp">
                <img alt="${article.user.userNickname}" src="${article.user.userAvatar}"
                     class="avatar avatar-64 photo" height="64" width="64">
                <ul class="postinfo">
                    <li></li>
                    <li><strong>版权声明：</strong>本站原创文章，于<fmt:formatDate
                            value="${article.articleCreateTime}"
                            pattern="yyyy-MM-dd"/>，由
                        <strong>
                                ${article.user.userNickname}
                        </strong>
                        发表。
                    </li>
                    <li class="reprinted"><strong>转载请注明：</strong>
                        <a href="/article/${article.articleId}"
                           rel="bookmark"
                           title="本文固定链接 /article/${article.articleId}">
                                ${article.articleTitle} | ${options.optionSiteTitle}</a>
                    </li>
                </ul>
                <div class="clear"></div>
            </div>
                <%--版权声明 end--%>

                <%--相关文章 start--%>
            <div id="single-widget">
                <div class="wow fadeInUp" data-wow-delay="0.3s">
                    <aside id="related_post-2" class="widget">
                        <h3 class="widget-title">
                            <span class="s-icon"></span>相关文章
                        </h3>
                        <div id="related_post_widget">
                            <ul>
                                <c:forEach items="${similarArticleList}" var="s">
                                    <li>
                                        <a href="/article/${s.articleId}">${s.articleTitle}</a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                        <div class="clear"></div>
                    </aside>
                        <%--猜你喜欢 start--%>
                    <aside id="hot_post-8" class="widget hot_post">
                        <h3 class="widget-title"><span class="s-icon"></span>猜你喜欢</h3>
                        <div id="hot_post_widget">
                            <ul>
                                <c:forEach items="${mostViewArticleList}" var="m">
                                    <li>
                                        <a href="/article/${m.articleId}">
                                                ${m.articleTitle}
                                        </a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                        <div class="clear"></div>
                    </aside>
                        <%--猜你喜欢 end--%>
                </div>
                <div class="clear"></div>
            </div>
                <%--相关文章 end--%>

                <%--上一篇下一篇 start--%>
            <nav class="nav-single">
                <c:choose>
                    <c:when test="${preArticle!=null}">
                        <a href="/article/${preArticle.articleId}" rel="next">
                            <span class="meta-nav">
                                <span class="post-nav">上一篇
                                 <i class="fa fa-angle-left"></i>
                                </span>
                                <br>${preArticle.articleTitle}
                            </span>
                        </a>
                    </c:when>
                    <c:otherwise>
                              <span class="meta-nav">
                                    <span class="post-nav">
                                        没有了<br>
                                    </span>已是第一篇文章
                                </span>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${afterArticle!=null}">
                        <a href="/article/${afterArticle.articleId}" rel="next">
                            <span class="meta-nav">
                                <span class="post-nav">下一篇
                                 <i class="fa fa-angle-right"></i>
                                </span>
                                <br>${afterArticle.articleTitle}
                            </span>
                        </a>
                    </c:when>
                    <c:otherwise>
                            <span class="meta-nav">
                                <span class="post-nav">
                                    没有了<br>
                                </span>已是最后文章
                             </span>
                    </c:otherwise>
                </c:choose>

                <div class="clear"></div>
            </nav>
                <%--上一篇下一篇 end--%>

                <%--评论区域 start--%>
            <div class="scroll-comments"></div>
            <div id="comments" class="comments-area">
                <div id="respond" class="comment-respond">
                    <h3 id="reply-title" class="comment-reply-title"><span id="reply-title-word">发表评论</span>
                        <a rel="nofollow" id="cancel-comment-reply-link"
                           href="/article/${article.articleId}#respond"
                           style="">取消回复</a>
                        <c:if test="${sessionScope.user == null}">
                            <span style="color:red" >您未登录，登录后才能评论，<a href="/login" target="_blank">前往登录</a></span>
                        </c:if>
                    </h3>

                    <form id="comment_form" onsubmit="return false;">
                        <c:if test="${sessionScope.user!=null}">
                            <div class="user_avatar">
                                <img src="${sessionScope.user.userAvatar}"
                                     class="avatar avatar-64 photo" height="64" width="64">
                                登录者：${sessionScope.user.userNickname}
                                <br> <a href="javascript:void(0)" onclick="logout()">登出</a>
                            </div>
                        </c:if>
                        <p class="comment-form-comment">
                            <textarea id="comment" name="commentContent" rows="4" tabindex="1" required></textarea>
                        </p>
                        <div id="comment-author-info">
                            <input type="hidden" name="commentPid" value="0">
                            <input type="hidden" name="commentPname" value="">
                        </div>
                        <div class="clear"></div>
                        <p class="form-submit">
                            <input id="submit" name="submit" type="button" tabindex="5" value="提交评论" onclick="javascript:$('#submit').prop('disabled',true);$.ajax({type:'POST',url:'/comment',contentType:'application/x-www-form-urlencoded; charset=utf-8',data:$('#comment_form').serialize(),success:function(data){if(data.code==0){layer.msg('评论成功！');$('#comment').val('');$('#cancel-comment-reply-link').hide();$('input[name=commentPid]').attr('value',0);$('input[name=commentPname]').attr('value','');$('#reply-title-word').html('发表评论');}else{layer.msg(data.msg||'评论提交失败！');}$('#submit').prop('disabled',false);},error:function(){layer.msg('评论提交失败，请稍后再试！');$('#submit').prop('disabled',false);}});">
                            <input type="hidden" name="commentArticleId"
                                   value="${article.articleId}" id="article_id">
                            <input type="hidden" name="commentPid" id="comment_pid" value="0">
                        </p>
                    </form>
                </div>

                <ol class="comment-list">
                    <c:forEach items="${commentList}" var="c">
                        <c:if test="${c.commentPid == 0}">
                            <li class="comments-anchor">
                                <ul id="anchor-comment-${c.commentId}"></ul>
                            </li>
                            <li class="comment">
                                <div id="div-comment-${c.commentId}" class="comment-body">
                                    <div class="comment-author vcard">
                                        <img class="avatar" src="${c.commentAuthorAvatar}" alt="avatar"
                                             style="display: block;">
                                        <strong>${c.commentAuthorName} </strong>
                                        <c:if test="${c.commentRole == 1}">
                                            <i class="fa fa-black-tie" style="color: #c40000;"></i>
                                            <span class=""
                                                  style="margin-top: 2px!important;color: #c40000;font-size: 13px;;"><b>博主</b></span>
                                        </c:if>
                                        <span class="comment-meta commentmetadata">
                                            <span class="ua-info" style="display: inline;">
                                                <br>
                                                <span class="comment-aux">
                                                    <span class="reply">
                                                        <a rel="nofollow" class="comment-reply-link" href="javascript:void(0)" onclick="var commentBody=$(this).closest('.comment-body');var commentId=commentBody.attr('id').replace('div-comment-','');var commentAuthorName=commentBody.find('strong').first().text().trim();$('#reply-title-word').html('回复给 '+commentAuthorName);$('#comment_pid').val(commentId);$('input[name=commentPid]').attr('value',commentId);$('input[name=commentPname]').attr('value',commentAuthorName);$('#cancel-comment-reply-link').show();$('html,body').animate({scrollTop:$('#respond').offset().top},500);return false;">回复</a>
                                                    </span>
                                                    <fmt:formatDate value="${c.commentCreateTime}"
                                                                    pattern="yyyy年MM月dd日 HH:mm:ss"/>&nbsp;
                                                    <c:if test="${sessionScope.user != null && sessionScope.user.userId == article.articleUserId}">
                                                        <a href="javascript:void(0)"
                                                           onclick="deleteComment(${c.commentId})">删除</a>
                                                        <a class="comment-edit-link"
                                                           href="/admin/comment/edit/${c.commentId}"
                                                           target="_blank">编辑</a>
                                                    </c:if>
                                                    <span class="floor"> &nbsp;${c.commentFloor}楼 </span>
                                                </span>
                                            </span>
                                        </span>
                                        <p>
                                            <c:if test="${c.commentPid!=0}">
                                                <span class="at">@ ${c.commentPname}</span>
                                            </c:if>
                                                ${c.commentContent}
                                        </p>
                                    </div>
                                </div>
                                <ul class="children">
                                    <c:forEach items="${commentList}" var="c2">
                                        <c:if test="${c.commentId == c2.commentPid}">
                                            <li class="comments-anchor">
                                                <ul id="anchor-comment-${c2.commentId}"></ul>
                                            </li>
                                            <li class="comment">
                                                <div id="div-comment-${c2.commentId}" class="comment-body">
                                                    <div class="comment-author vcard">
                                                        <img class="avatar" src="${c2.commentAuthorAvatar}" alt="avatar"
                                                             style="display: block;">
                                                        <strong>${c2.commentAuthorName} </strong>
                                                        <c:if test="${c2.commentRole==1}">
                                                            <i class="fa fa-black-tie" style="color: #c40000;"></i>
                                                            <span class=""
                                                                  style="margin-top: 2px!important;color: #c40000;font-size: 13px;;"><b>博主</b></span>
                                                        </c:if>
                                                        <span class="comment-meta">
                                                    <span class="ua-info" style="display: inline;">
                                                    <br>
                                                    <span class="comment-aux">
                                                        <span class="reply">
                                                            <a rel="nofollow" class="comment-reply-link" href="javascript:void(0)" onclick="var commentBody=$(this).closest('.comment-body');var commentId=commentBody.attr('id').replace('div-comment-','');var commentAuthorName=commentBody.find('strong').first().text().trim();$('#reply-title-word').html('回复给 '+commentAuthorName);$('#comment_pid').val(commentId);$('input[name=commentPid]').attr('value',commentId);$('input[name=commentPname]').attr('value',commentAuthorName);$('#cancel-comment-reply-link').show();$('html,body').animate({scrollTop:$('#respond').offset().top},500);return false;">回复</a>
                                                        </span>
                                                        <fmt:formatDate value="${c2.commentCreateTime}"
                                                                        pattern="yyyy年MM月dd日 HH:mm:ss"/>&nbsp;
                                                        <c:if test="${sessionScope.user != null}">
                                                            <a href="javascript:void(0)"
                                                               onclick="deleteComment(${c2.commentId})">删除</a>
                                                            <a class="comment-edit-link"
                                                               href="/admin/comment/edit/${c2.commentId}"
                                                               target="_blank">编辑</a>
                                                        </c:if>
                                                        <span class="floor"> &nbsp;${c2.commentFloor}层 </span>
                                                    </span>
                                                </span>
                                                    </span>
                                                        <p>
                                                            <c:if test="${c2.commentPid!=0}">
                                                                <span class="at">@ ${c2.commentPname}</span>
                                                            </c:if>
                                                                ${c2.commentContent}
                                                        </p>
                                                    </div>
                                                </div>
                                            </li>
                                        </c:if>
                                    </c:forEach>
                                </ul>
                            </li>
                        </c:if>
                    </c:forEach>
                </ol>
            </div>
                <%--评论框 end--%>

        </main>
        <!-- .site-main -->
    </div>
    <%--旅游网站主体-左侧文章正文end--%>
</rapid:override>


<%--侧边栏 start--%>
<rapid:override name="right">
    <%@include file="../Public/part/sidebar-1.jsp" %>
</rapid:override>
<%--侧边栏 end--%>

<rapid:override name="footer-script">
    <script src="/js/jquery.cookie.js"></script>

    <script type="text/javascript">
        // 声明所有关键函数为全局函数
        window.submitComment = submitComment;
        window.replyComment = replyComment;
        window.deleteComment = deleteComment;
        window.isSubmitting = false;
        
        var articleId = $("#articleDetail").attr("data-id");
        increaseViewCount(articleId);
        layui.code({
            elem: 'pre',//默认值为.layui-code
            // skin: 'notepad', //如果要默认风格，不用设定该key。
            about: false
        });

        // 全局变量，跟踪最大评论ID
        var lastCommentId = 0;
        var commentPolling = false;
        var pollingInterval = null;

        // 页面加载后初始化评论监听
        $(document).ready(function() {
            console.log("页面加载完成，初始化评论系统");
            
            // 绑定取消回复链接
            $("#cancel-comment-reply-link").click(function(e) {
                e.preventDefault();
                $(this).hide();
                $("#reply-title-word").html("发表评论");
                $("input[name=commentPid]").attr("value", 0);
                $("input[name=commentPname]").attr("value", "");
                return false;
            });
            
            // 找出当前页面最大的评论ID
            $('.comment').each(function() {
                var commentBody = $(this).find('.comment-body');
                var commentBodyId = commentBody.attr('id');
                if (commentBodyId) {
                    var commentId = parseInt(commentBodyId.replace('div-comment-', ''));
                    if (!isNaN(commentId) && commentId > lastCommentId) {
                        lastCommentId = commentId;
                    }
                }
            });
            
            console.log("初始化最大评论ID: " + lastCommentId);
            
            // 启动轮询检查新评论
            startCommentPolling();
            
            // 确保页面关闭时清除轮询
            $(window).on('beforeunload', function() {
                stopCommentPolling();
            });
        });
        
        // 提交评论函数
        function submitComment() {
            console.log("提交评论函数被调用");
            if (window.isSubmitting) {
                return;
            }

            // 验证表单内容
            var commentContent = $("#comment").val();
            if (!commentContent || commentContent.trim() === "") {
                layer.msg("评论内容不能为空！");
                return;
            }
            
            // 设置提交状态
            window.isSubmitting = true;
            $("#submit").prop("disabled", true);
            
            // 提交评论
            $.ajax({
                type: "POST",
                url: '/comment',
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                data: $("#comment_form").serialize(),
                success: function(data) {
                    if (data.code == 0) {
                        layer.msg("评论成功！");
                        // 清空评论框
                        $("#comment").val("");
                        // 取消回复状态
                        $("#cancel-comment-reply-link").hide();
                        $("input[name=commentPid]").attr("value", 0);
                        $("input[name=commentPname]").attr("value", "");
                        $("#reply-title-word").html("发表评论");
                        
                        // 手动触发一次评论刷新
                        setTimeout(fetchNewComments, 500);
                    } else {
                        layer.msg(data.msg || "评论提交失败！");
                    }
                },
                error: function() {
                    layer.msg("评论提交失败，请稍后再试！");
                },
                complete: function() {
                    // 重置提交状态
                    window.isSubmitting = false;
                    $("#submit").prop("disabled", false);
                }
            });
        }

        // 回复评论函数
        function replyComment(element) {
            // 防止重复提交
            if (window.isSubmitting) {
                return false; 
            }
            
            var commentBody = $(element).closest('.comment-body');
            var commentId = commentBody.attr('id').replace('div-comment-', '');
            var commentAuthorName = commentBody.find('strong').first().text().trim();
            
            // 设置回复状态
            $("#reply-title-word").html("回复给 " + commentAuthorName);
            $("#comment_pid").val(commentId);
            $("input[name=commentPname]").attr("value", commentAuthorName);
            $("#cancel-comment-reply-link").show();
            
            // 滚动到评论表单
            $('html, body').animate({
                scrollTop: $('#respond').offset().top
            }, 500);
            
            return false; // 阻止默认行为和冒泡
        }

        // 删除评论函数
        function deleteComment(id) {
            if (confirm("确认要删除这条评论吗？")) {
                $.ajax({
                    async: false,
                    type: "POST",
                    url: '/admin/comment/delete/' + id,
                    contentType: "application/x-www-form-urlencoded; charset=utf-8",
                    dataType: "text",
                    success: function() {
                        // 移除评论
                        $("#div-comment-" + id).closest('li.comment').prev('.comments-anchor').remove();
                        $("#div-comment-" + id).closest('li.comment').fadeOut(300, function() {
                            $(this).remove();
                            // 更新评论计数
                            $(".comment-count").text($(".comment").length);
                        });
                        
                        layer.msg("评论已删除");
                    },
                    error: function() {
                        layer.msg("删除评论失败，请稍后再试");
                    }
                });
            }
        }

        // 开始轮询检查新评论
        function startCommentPolling() {
            if (!commentPolling) {
                commentPolling = true;
                
                // 先立即执行一次
                fetchNewComments();
                
                // 然后每3秒检查一次新评论 (缩短时间提高实时性)
                pollingInterval = setInterval(fetchNewComments, 3000);
                console.log("开始评论轮询");
            }
        }
        
        // 停止轮询
        function stopCommentPolling() {
            if (commentPolling && pollingInterval) {
                clearInterval(pollingInterval);
                commentPolling = false;
                console.log("停止评论轮询");
            }
        }

        // 获取新评论
        function fetchNewComments() {
            // 确保获取到articleId
            var currentArticleId = $("#articleDetail").attr("data-id");
            if (!currentArticleId) {
                console.error("无法获取文章ID");
                return;
            }
            
            console.log("正在获取新评论，文章ID: " + currentArticleId + ", 最后评论ID: " + lastCommentId);
            
            // 发起AJAX请求获取新评论
            $.ajax({
                type: "GET",
                url: '/comment/new',
                data: {
                    articleId: currentArticleId,
                    lastCommentId: lastCommentId,
                    _: new Date().getTime() // 添加时间戳防止缓存
                },
                dataType: 'json',
                cache: false, // 禁用缓存
                timeout: 5000, // 设置超时
                success: function(data) {
                    if (data && data.length > 0) {
                        console.log("收到" + data.length + "条新评论", data);
                        updateComments(data);
                    }
                },
                error: function(xhr, status, error) {
                    console.error("获取评论出错: " + error);
                    // 出错时不停止轮询，让它继续尝试
                }
            });
        }

        // 更新评论区域
        function updateComments(newComments) {
            for (var i = 0; i < newComments.length; i++) {
                var comment = newComments[i];
                
                // 检查评论是否已存在
                if ($("#div-comment-" + comment.commentId).length > 0) {
                    console.log("评论已存在，跳过: " + comment.commentId);
                    continue;
                }
                
                console.log("添加新评论: " + comment.commentId);
                
                // 更新最大评论ID
                if (comment.commentId > lastCommentId) {
                    lastCommentId = comment.commentId;
                }
                
                // 根据评论类型（顶级评论或回复）添加到正确位置
                if (comment.commentPid == 0) {
                    addTopLevelComment(comment);
                } else {
                    addReplyComment(comment);
                }
            }
            
            // 更新评论计数
            $(".comment-count").text($(".comment").length);
        }

        // 添加顶级评论
        function addTopLevelComment(comment) {
            var authorHTML = '';
            if (comment.commentRole == 1) {
                authorHTML = '<i class="fa fa-black-tie" style="color: #c40000;"></i>' +
                             '<span class="" style="margin-top: 2px!important;color: #c40000;font-size: 13px;;"><b>博主</b></span>';
            }
            
            var commentHtml = '<li class="comments-anchor">' +
                '<ul id="anchor-comment-' + comment.commentId + '"></ul>' +
                '</li>' +
                '<li class="comment">' +
                '<div id="div-comment-' + comment.commentId + '" class="comment-body">' +
                '<div class="comment-author vcard">' +
                '<img class="avatar" src="' + comment.commentAuthorAvatar + '" alt="avatar" style="display: block;">' +
                '<strong>' + comment.commentAuthorName + ' </strong>' + authorHTML +
                '<span class="comment-meta commentmetadata">' +
                '<span class="ua-info" style="display: inline;">' +
                '<br>' +
                '<span class="comment-aux">' +
                '<span class="reply">' +
                '<a rel="nofollow" class="comment-reply-link" href="javascript:void(0)" onclick="var commentBody=$(this).closest(\'.comment-body\');var commentId=commentBody.attr(\'id\').replace(\'div-comment-\',\'\');var commentAuthorName=commentBody.find(\'strong\').first().text().trim();$(\'#reply-title-word\').html(\'回复给 \'+commentAuthorName);$(\'#comment_pid\').val(commentId);$(\'input[name=commentPid]\').attr(\'value\',commentId);$(\'input[name=commentPname]\').attr(\'value\',commentAuthorName);$(\'#cancel-comment-reply-link\').show();$(\'html,body\').animate({scrollTop:$(\'#respond\').offset().top},500);return false;">回复</a>' +
                '</span>' +
                new Date(comment.commentCreateTime).toLocaleString() + '&nbsp;' +
                '<a href="javascript:void(0)" onclick="deleteComment(' + comment.commentId + ')">删除</a>' +
                '<a class="comment-edit-link" href="/admin/comment/edit/' + comment.commentId + '" target="_blank">编辑</a>' +
                '<span class="floor"> &nbsp;' + comment.commentFloor + '楼 </span>' +
                '</span>' +
                '</span>' +
                '</span>' +
                '<p>' + comment.commentContent + '</p>' +
                '</div>' +
                '</div>' +
                '<ul class="children"></ul>' +
                '</li>';
            
            // 添加到评论列表的顶部（新评论在前）
            $(".comment-list").prepend(commentHtml);
            
            // 应用高亮效果
            $("#div-comment-" + comment.commentId).closest('li.comment').hide().fadeIn(1000);
        }

        // 添加回复评论
        function addReplyComment(comment) {
            // 找到父评论
            var parentComment = $("#div-comment-" + comment.commentPid).closest('li.comment');
            if (parentComment.length > 0) {
                var authorHTML = '';
                if (comment.commentRole == 1) {
                    authorHTML = '<i class="fa fa-black-tie" style="color: #c40000;"></i>' +
                                 '<span class="" style="margin-top: 2px!important;color: #c40000;font-size: 13px;;"><b>博主</b></span>';
                }
                
                var commentHtml = '<li class="comments-anchor">' +
                    '<ul id="anchor-comment-' + comment.commentId + '"></ul>' +
                    '</li>' +
                    '<li class="comment">' +
                    '<div id="div-comment-' + comment.commentId + '" class="comment-body">' +
                    '<div class="comment-author vcard">' +
                    '<img class="avatar" src="' + comment.commentAuthorAvatar + '" alt="avatar" style="display: block;">' +
                    '<strong>' + comment.commentAuthorName + ' </strong>' + authorHTML +
                    '<span class="comment-meta">' +
                    '<span class="ua-info" style="display: inline;">' +
                    '<br>' +
                    '<span class="comment-aux">' +
                    '<span class="reply">' +
                    '<a rel="nofollow" class="comment-reply-link" href="javascript:void(0)" onclick="var commentBody=$(this).closest(\'.comment-body\');var commentId=commentBody.attr(\'id\').replace(\'div-comment-\',\'\');var commentAuthorName=commentBody.find(\'strong\').first().text().trim();$(\'#reply-title-word\').html(\'回复给 \'+commentAuthorName);$(\'#comment_pid\').val(commentId);$(\'input[name=commentPid]\').attr(\'value\',commentId);$(\'input[name=commentPname]\').attr(\'value\',commentAuthorName);$(\'#cancel-comment-reply-link\').show();$(\'html,body\').animate({scrollTop:$(\'#respond\').offset().top},500);return false;">回复</a>' +
                    '</span>' +
                    new Date(comment.commentCreateTime).toLocaleString() + '&nbsp;' +
                    '<a href="javascript:void(0)" onclick="deleteComment(' + comment.commentId + ')">删除</a>' +
                    '<a class="comment-edit-link" href="/admin/comment/edit/' + comment.commentId + '" target="_blank">编辑</a>' +
                    '<span class="floor"> &nbsp;' + comment.commentFloor + '层 </span>' +
                    '</span>' +
                    '</span>' +
                    '</span>' +
                    '<p>' +
                    '<span class="at">@ ' + comment.commentPname + '</span>' +
                    comment.commentContent +
                    '</p>' +
                    '</div>' +
                    '</div>' +
                    '</li>';
                
                // 添加到父评论的子评论列表中
                parentComment.find('.children').prepend(commentHtml);
                
                // 应用高亮效果
                $("#div-comment-" + comment.commentId).closest('li.comment').hide().fadeIn(1000);
            } else {
                console.error("找不到父评论: " + comment.commentPid);
            }
        }
    </script>

</rapid:override>


<%@ include file="../Public/framework.jsp" %>