<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>

<rapid:override name="title">
    - 编辑用户
</rapid:override>
<rapid:override name="header-style">
    <style>
        .layui-form-item .layui-input-inline {
            width: 300px;
        }

        .layui-word-aux {
            color: #FF5722 !important;
        }
        .layui-form-label {
            width: 120px;
        }
        input {
            border: 0!important;
        }
    </style>
</rapid:override>

<rapid:override name="breadcrumb">
    <%--面包屑导航 start--%>
    <nav class="breadcrumb">
        <a class="crumbs" href="/">
            <i class="fa fa-home"></i>首页
        </a>
        <i class="fa fa-angle-right"></i>
        个人信息
    </nav>
    <%--面包屑导航 end--%>
</rapid:override>

<rapid:override name="left">
    <div id="primary" class="content-area">
        <main id="main" class="site-main" role="main">
            <article class="post" style="min-height: 500px;">
                <header class="entry-header">
                    <h1 class="entry-title">
                        个人信息
                    </h1>
                </header><!-- .entry-header -->
                <form class="layui-form" action="/admin/profile/save" id="userForm"
                      method="post">
                    <div class="layui-form-item">
                        <a class="layui-btn layui-btn-primary"  href="/home/profile/edit">Edit</a>
                        <label class="layui-form-label">头像</label>
                        <div class="layui-input-inline">
                            <div class="layui-upload">
                                <div class="layui-upload-list" style="">
                                    <img class="layui-upload-img" src="${user.userAvatar}" id="demo1" width="100"
                                         height="100">
                                    <p id="demoText"></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">用户名 </label>
                        <div class="layui-input-inline">
                            <input type="text" value="${user.userName}"  id="userName" required
                                   autocomplete="off" class="layui-input" disabled>
                        </div>
                        <div class="layui-form-mid layui-word-aux" id="userNameTips"></div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">密码 </label>
                        <div class="layui-input-inline">
                            <input type="password" value="${user.userPass}" id="userPass" required
                                   autocomplete="off" class="layui-input" min="3" max="20" disabled>
                        </div>
                        <div class="layui-form-mid layui-word-aux"></div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">昵称 </label>
                        <div class="layui-input-inline">
                            <input type="text"  value="${user.userNickname}" required
                                   placeholder="" autocomplete="off" min="2" max="10"
                                   class="layui-input" disabled>
                        </div>
                        <div class="layui-form-mid layui-word-aux"></div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">Email </label>
                        <div class="layui-input-inline">
                            <input type="email"  value="${user.userEmail}" id="userEmail" required
                                   class="layui-input" disabled>
                        </div>
                        <div class="layui-form-mid layui-word-aux" id="userEmailTips"></div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">URL </label>
                        <div class="layui-input-inline">
                            <input type="url"  value="${user.userUrl}" placeholder="" autocomplete="off"
                                   class="layui-input" disabled>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">注册时间 </label>
                        <div class="layui-input-inline">
                            <input type="text"  value="<fmt:formatDate value="${user.userRegisterTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
            " placeholder="" autocomplete="off"
                                   class="layui-input" disabled>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">最后登录时间 </label>
                        <div class="layui-input-inline">
                            <input type="text"  value='<fmt:formatDate value="${user.userLastLoginTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
            ' placeholder="" autocomplete="off"
                                   class="layui-input" disabled>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">最后登录IP </label>
                        <div class="layui-input-inline">
                            <input type="text"  value="${user.userLastLoginIp}" placeholder="" autocomplete="off"
                                   class="layui-input" disabled>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">状态 </label>
                        <div class="layui-input-inline">
                            <input type="text"  value='<c:choose>
                                <c:when test="${user.userStatus==0}">禁用
                                </c:when>
                                <c:otherwise>正常
                                </c:otherwise>
                            </c:choose>' placeholder="" autocomplete="off"
                                   class="layui-input" disabled>
                        </div>
                    </div>
                </form>
            </article>
        </main>
    </div>




</rapid:override>

<%--侧边栏 start--%>
<rapid:override name="right">
    <%@include file="../Public/part/sidebar-3.jsp" %>
</rapid:override>
<%--侧边栏 end--%>

<rapid:override name="footer-script">
</rapid:override>

<%@ include file="../Public/framework.jsp" %>
