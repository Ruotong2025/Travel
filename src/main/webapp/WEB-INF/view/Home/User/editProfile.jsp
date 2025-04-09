<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>

<rapid:override name="title">
    - 编辑个人信息
</rapid:override>
<rapid:override name="header-style">
    <style>
        .layui-form-item .layui-input-inline {
            width: 300px;
        }
        .layui-form-label {
            width: 120px;
        }
        .layui-word-aux {
            color: #FF5722 !important;
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
        <i class="fa fa-angle-right"></i>
        编辑个人信息
    </nav>
    <%--面包屑导航 end--%>
</rapid:override>




<rapid:override name="left">
    <div id="primary" class="content-area">
        <main id="main" class="site-main" role="main">
            <article class="post" style="min-height: 500px;">
                <header class="entry-header">
                    <h1 class="entry-title">
                        编辑个人信息
                    </h1>
                </header><!-- .entry-header -->
                <form class="layui-form" action="/home/profile/save" id="userForm"
                      method="post">
                    <input type="hidden" name="userId" id="userId" value="${user.userId}">
                    <div class="layui-form-item">
                        <label class="layui-form-label">头像</label>
                        <div class="layui-input-inline">
                            <div class="layui-upload">
                                <div class="layui-upload-list" style="">
                                    <img class="layui-upload-img" src="${user.userAvatar}" id="demo1" width="100"
                                         height="100">
                                    <p id="demoText"></p>
                                </div>
                                <button type="button" class="layui-btn" id="test1">上传图片</button>
                                <input type="hidden" name="userAvatar" id="userAvatar" value="${user.userAvatar}">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">用户名 <span style="color: #FF5722; ">*</span></label>
                        <div class="layui-input-inline">
                            <input type="text" value="${user.userName}" name="userName" id="userName" required
                                   lay-verify="userName"
                                   autocomplete="off" class="layui-input" onblur="checkUserName()">
                        </div>
                        <div class="layui-form-mid layui-word-aux" id="userNameTips"></div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">密码 <span style="color: #FF5722; ">*</span></label>
                        <div class="layui-input-inline">
                            <input type="password" name="userPass" lay-verify="userPass" value="${user.userPass}" id="userPass" required
                                   autocomplete="off" class="layui-input" min="3" max="20">
                        </div>
                        <div class="layui-form-mid layui-word-aux"></div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">昵称 <span style="color: #FF5722; ">*</span></label>
                        <div class="layui-input-inline">
                            <input type="text" name="userNickname" lay-verify="userNickname" value="${user.userNickname}" required
                                   placeholder="" autocomplete="off" min="2" max="10"
                                   class="layui-input">
                        </div>
                        <div class="layui-form-mid layui-word-aux"></div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">Email <span style="color: #FF5722; ">*</span></label>
                        <div class="layui-input-inline">
                            <input type="email" name="userEmail" lay-verify="userEmail" value="${user.userEmail}" id="userEmail" required
                                   class="layui-input" onblur="checkUserEmail()">
                        </div>
                        <div class="layui-form-mid layui-word-aux" id="userEmailTips"></div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">URL </label>
                        <div class="layui-input-inline">
                            <input type="url" name="userUrl" value="${user.userUrl}" placeholder="" autocomplete="off"
                                   class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">状态</label>
                        <div class="layui-input-block">
                            <input type="radio" name="userStatus" value="1" title="正常" <c:if test="${user.userStatus==1}">checked</c:if>>
                            <input type="radio" name="userStatus" value="0" title="禁用" <c:if test="${user.userStatus==0}">checked</c:if>>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button class="layui-btn" lay-submit lay-filter="demo1" id="submit-btn">保存</button>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
                    </div>
                </form>
            </article>>
        </main>>
    </div>>



</rapid:override>

<%--侧边栏 start--%>
<rapid:override name="right">
    <%@include file="../Public/part/sidebar-3.jsp" %>
</rapid:override>
<%--侧边栏 end--%>

<rapid:override name="footer-script">

    <script>
        //上传图片
        layui.use('upload', function () {
            var $ = layui.jquery,
                upload = layui.upload;
            var uploadInst = upload.render({
                elem: '#test1',
                url: '/admin/upload/img',
                before: function (obj) {
                    obj.preview(function (index, file, result) {
                        $('#demo1').attr('src', result);
                    });
                },
                done: function (res) {
                    $("#userAvatar").attr("value", res.data.src);
                    if (res.code > 0) {
                        return layer.msg('上传失败');
                    }
                },
                error: function () {
                    var demoText = $('#demoText');
                    demoText.html('' +
                        '<span style="color: #FF5722;">上传失败</span>' +
                        ' <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                    demoText.find('.demo-reload').on('click', function () {
                        uploadInst.upload();
                    });
                }
            });

        });

    layui.use(['form'], function () {
        var form = layui.form;
        var $ = layui.jquery;

        // 自定义验证规则
        form.verify({
            userName: function (value) {
                if (!value.trim()) {
                    return '用户名不能为空';
                }
                if (value.length < 3 || value.length > 20) {
                    return '用户名长度必须在3到20个字符之间';
                }
            },
            userPass: function (value) {
                if (!value.trim()) {
                    return '密码不能为空';
                }
                if (value.length < 3 || value.length > 20) {
                    return '密码长度必须在3到20个字符之间';
                }
            },
            userNickname: function (value) {
                if (!value.trim()) {
                    return '昵称不能为空';
                }
                if (value.length < 2 || value.length > 10) {
                    return '昵称长度必须在2到10个字符之间';
                }
            },
            userEmail: function (value) {
                if (!value.trim()) {
                    return 'Email 不能为空';
                }
                // 邮箱格式正则校验
                var emailPattern = /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
                if (!emailPattern.test(value)) {
                    return 'Email 格式不正确';
                }
            }
        });
    });

    </script>
</rapid:override>

<%@ include file="../Public/framework.jsp" %>
