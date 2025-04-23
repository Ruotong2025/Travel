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
            <i class="fa fa-home"></i>Home Page
        </a>
        <i class="fa fa-angle-right"></i>
        Create Travels
        <i class="fa fa-angle-right"></i>
        Contents
    </nav>
    <%--面包屑导航 end--%>
</rapid:override>


<rapid:override name="left">

<div id="primary" class="content-area">
    <main id="main" class="site-main" role="main">
        <article class="post" style="min-height: 500px;">
            <header class="entry-header">
                <h1 class="entry-title">
                    Create Travels
                </h1>
            </header><!-- .entry-header -->
            <form class="layui-form layui-form-pane" method="post" id="myForm" action="/admin/article/editSubmit">
                <input type="hidden" name="articleId" value="${article.articleId}">
                <div class="layui-form-item">
                    <label class="layui-form-label">Title <span style="color: #FF5722; ">*</span></label>
                    <div class="layui-input-block">
                        <input type="text" name="articleTitle" lay-verify="title" id="title" value="${article.articleTitle}"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">Destination <span style="color: #FF5722; ">*</span></label>
                    <div class="layui-input-block">
                        <input type="text" name="articleDestination" lay-verify="articleDestination" id="destination" autocomplete="off" placeholder="Please type in destinations" class="layui-input" value="${article.articleDestination}">
                    </div>
                </div>

                <div class="layui-form-item" style="display: flex; justify-content: space-between;">
                    <div style="flex: 1; margin-right: 10px;">
                        <label class="layui-form-label">Start <span style="color: #FF5722;">*</span></label>
                        <div class="layui-input-block">
                            <input type="text" name="articleStartdate" lay-verify="articleStartdate" id="startDate" autocomplete="off" placeholder="Choose start date..." class="layui-input" value="<fmt:formatDate value="${article.articleStartdate}" pattern="yyyy-MM-dd"/>">
                        </div>
                    </div>
                    <div style="flex: 1;">
                        <label class="layui-form-label">End <span style="color: #FF5722;">*</span></label>
                        <div class="layui-input-block">
                            <input type="text" name="articleEnddate" lay-verify="articleEnddate" id="endDate" autocomplete="off" placeholder="Choose end date.." class="layui-input" value="<fmt:formatDate value="${article.articleEnddate}" pattern="yyyy-MM-dd"/>">
                        </div>
                    </div>
                </div>

                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">Contents <span style="color: #FF5722; ">*</span></label>
                    <div class="layui-input-block">
                <textarea class="layui-textarea layui-hide" name="articleContent"
                          id="article_content" lay-verify="content">${article.articleContent}</textarea>
                    </div>
                </div>


                <div class="layui-form-item">
                    <label class="layui-form-label">Claasification <span style="color: #FF5722; ">*</span></label>
                    <div class="layui-input-inline">
                        <select name="articleParentCategoryId" id="articleParentCategoryId"
                                lay-filter="articleParentCategoryId" lay-verify="articleParentCategoryId">
                            <option value="">First class</option>
                            <c:forEach items="${categoryList}" var="c">
                                <c:if test="${c.categoryPid == 0}">
                                    <option value="${c.categoryId}"
                                            <c:if test="${article.categoryList[0].categoryId == c.categoryId}">
                                                selected
                                            </c:if>
                                    >${c.categoryName}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="layui-input-inline">
                        <select name="articleChildCategoryId" id="articleChildCategoryId" lay-filter="articleChildCategoryId" >
                            <c:forEach items="${categoryList}" var="c">
                                <c:if test="${c.categoryPid == article.categoryList[0].categoryId}">
                                    <option value="${c.categoryId}"
                                            <c:if test="${article.categoryList[1].categoryId == c.categoryId}">selected</c:if>>${c.categoryName}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                <div class="layui-form-item" pane="">
                    <label class="layui-form-label">Label<span style="color: #FF5722;">*</span></label>
                    <div class="layui-input-block">
                        <c:forEach items="${tagList}" var="t">
                            <input type="checkbox" name="articleTagIds" lay-verify="articleTagIds" lay-skin="primary" title="${t.tagName}"
                                   value="${t.tagId}"
                            <c:forEach items="${article.tagList}" var="t2">
                                   <c:if test="${t.tagId == t2.tagId}">checked</c:if>
                            </c:forEach>>
                        </c:forEach>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">order</label>
                    <div class="layui-input-inline">
                        <input type="number" name="articleOrder" value="${article.articleOrder}" autocomplete="off"
                               class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux">输入1-10的数字,order越大排序越前</div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">缩略图<span style="color: #FF5722;">*</span></label>
                    <div class="layui-input-inline">
                        <div class="layui-upload">
                            <div class="layui-upload-list" style="">
                                <img class="layui-upload-img"  id="demo1" width="100" src="${article.articleThumbnail}"
                                     height="100">
                                <p id="demoText"></p>
                            </div>
                            <button type="button" class="layui-btn" id="test1">Upload images</button>
                            <input type="hidden" name="articleThumbnail" id="articleThumbnail" lay-verify="articleThumbnail" value="${article.articleThumbnail}" >
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">State</label>
                    <div class="layui-input-block">
                        <input type="radio" name="articleStatus" value="1" title="Publish"
                               <c:if test="${article.articleStatus==1}">checked</c:if>>
                        <input type="radio" name="articleStatus" value="0" title="Draft"
                               <c:if test="${article.articleStatus==0}">checked</c:if>>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit="" lay-filter="demo1">Save</button>
                        <button type="reset" class="layui-btn layui-btn-primary">Reset</button>
                    </div>
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


<rapid:override name="footer-script">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
    <script src="/js/article/upload.js"></script>
    <script src="/js/article/datepicker-init.js"></script>
    <script>
        layui.use(['form', 'layedit', 'laydate'], function() {
            var form = layui.form
                , layer = layui.layer
                , layedit = layui.layedit
                , laydate = layui.laydate;


            //上传图片,必须放在 创建一个编辑器前面
            layedit.set({
                uploadImage: {
                    url: '/admin/upload/img' //接口url
                    ,type: 'post' //默认post
                }
            });

            // 创建编辑器
            var editIndex = layedit.build('article_content', {
                height: 350
            });

            // 自定义验证规则
            form.verify({
                title: function(value) {
                    if (!value.trim()) {
                        return '标题不能为空';
                    }
                },
                content: function(value) {
                    layedit.sync(editIndex);
                    var content = layedit.getContent(editIndex).trim();
                    if (content.length < 20) {
                        return '内容至少需要20个字符';
                    }
                },
                // 添加自定义验证规则
                articleParentCategoryId: function(value) {
                    if (!value) {
                        return '请选择一级分类';
                    }
                },
                articleTagIds: function(value) {
                    var tagChecked = $('input[name="articleTagIds"]:checked').length;
                    if (tagChecked === 0) {
                        return '请至少选择一个标签';
                    }
                },
                articleThumbnail: function(value) {
                    if (!value) {
                        return '请上传缩略图';
                    }
                },
                articleDestination: function(value) {
                    if (!value.trim()) {
                        return '目的地不能为空';
                    }
                },
                articleStartdate: function(value) {
                    if (!value.trim()) {
                        return '请选择开始日期';
                    }
                },
                articleEnddate: function(value) {
                    if (!value.trim()) {
                        return '请选择结束日期';
                    }
                    var startDate = $('#startDate').val().trim();
                    if (startDate && value < startDate) {
                        return '结束日期不能早于开始日期';
                    }
                }
            });

            // 二级联动
            form.on("select(articleParentCategoryId)", function() {
                var optionstring = "";
                var articleParentCategoryId = $("#articleParentCategoryId").val();
                <c:forEach items="${categoryList}" var="c">
                if(articleParentCategoryId==${c.categoryPid}) {
                    optionstring += "<option name='childCategory' value='${c.categoryId}'>${c.categoryName}</option>";
                }
                </c:forEach>
                $("#articleChildCategoryId").html("<option value=''selected>二级分类</option>"+optionstring);
                form.render('select');
            });
        });
    </script>

</rapid:override>

<%@ include file="../Public/framework.jsp" %>