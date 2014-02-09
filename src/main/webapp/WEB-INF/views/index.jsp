<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <%--<link rel="stylesheet" type="text/css" href="css/content.css"/>--%>
    <%--<link rel="stylesheet" type="text/css" href="css/index.css"/>--%>

    <!-- Bootstrap -->
    <%--<link href="/bootstrap/css/bootstrap.css" rel="stylesheet">--%>

    <!-- Bootstrap core CSS -->
    <%--<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">--%>
    <!-- Bootstrap theme -->
    <%--<link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">--%>
    <style media="screen" type="text/css">


        .btn-default, .btn-primary, .btn-success, .btn-info, .btn-warning, .btn-danger {
            text-shadow: 0 -1px 0 rgba(0, 0, 0, .2);
            -webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, .15), 0 1px 1px rgba(0, 0, 0, .075);
            box-shadow: inset 0 1px 0 rgba(255, 255, 255, .15), 0 1px 1px rgba(0, 0, 0, .075)
        }

        .btn-default:active, .btn-primary:active, .btn-success:active, .btn-info:active, .btn-warning:active, .btn-danger:active, .btn-default.active, .btn-primary.active, .btn-success.active, .btn-info.active, .btn-warning.active, .btn-danger.active {
            -webkit-box-shadow: inset 0 3px 5px rgba(0, 0, 0, .125);
            box-shadow: inset 0 3px 5px rgba(0, 0, 0, .125)
        }

        .btn:active, .btn.active {
            background-image: none
        }

        .btn-default {
            background-image: -webkit-linear-gradient(top, #fff 0, #e0e0e0 100%);
            background-image: linear-gradient(to bottom, #fff 0, #e0e0e0 100%);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffffff', endColorstr='#ffe0e0e0', GradientType=0);
            filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
            background-repeat: repeat-x;
            border-color: #dbdbdb;
            text-shadow: 0 1px 0 #fff;
            border-color: #ccc
        }

        .btn-default:hover, .btn-default:focus {
            background-color: #e0e0e0;
            background-position: 0 -15px
        }

        .btn-default:active, .btn-default.active {
            background-color: #e0e0e0;
            border-color: #dbdbdb
        }

        .btn-primary {
            background-image: -webkit-linear-gradient(top, #428bca 0, #2d6ca2 100%);
            background-image: linear-gradient(to bottom, #428bca 0, #2d6ca2 100%);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff428bca', endColorstr='#ff2d6ca2', GradientType=0);
            filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
            background-repeat: repeat-x;
            border-color: #2b669a
        }

        .btn-primary:hover, .btn-primary:focus {
            background-color: #2d6ca2;
            background-position: 0 -15px
        }

        .btn-primary:active, .btn-primary.active {
            background-color: #2d6ca2;
            border-color: #2b669a
        }

        .btn-success {
            background-image: -webkit-linear-gradient(top, #5cb85c 0, #419641 100%);
            background-image: linear-gradient(to bottom, #5cb85c 0, #419641 100%);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff5cb85c', endColorstr='#ff419641', GradientType=0);
            filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
            background-repeat: repeat-x;
            border-color: #3e8f3e
        }

        .btn-success:hover, .btn-success:focus {
            background-color: #419641;
            background-position: 0 -15px
        }

        .btn-success:active, .btn-success.active {
            background-color: #419641;
            border-color: #3e8f3e
        }

        .btn-info {
            background-image: -webkit-linear-gradient(top, #5bc0de 0, #2aabd2 100%);
            background-image: linear-gradient(to bottom, #5bc0de 0, #2aabd2 100%);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff5bc0de', endColorstr='#ff2aabd2', GradientType=0);
            filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
            background-repeat: repeat-x;
            border-color: #28a4c9
        }

        .btn-info:hover, .btn-info:focus {
            background-color: #2aabd2;
            background-position: 0 -15px
        }

        .btn-info:active, .btn-info.active {
            background-color: #2aabd2;
            border-color: #28a4c9
        }

        .btn-warning {
            background-image: -webkit-linear-gradient(top, #f0ad4e 0, #eb9316 100%);
            background-image: linear-gradient(to bottom, #f0ad4e 0, #eb9316 100%);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#fff0ad4e', endColorstr='#ffeb9316', GradientType=0);
            filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
            background-repeat: repeat-x;
            border-color: #e38d13
        }

        .btn-warning:hover, .btn-warning:focus {
            background-color: #eb9316;
            background-position: 0 -15px
        }

        .btn-warning:active, .btn-warning.active {
            background-color: #eb9316;
            border-color: #e38d13
        }

        .btn-danger {
            background-image: -webkit-linear-gradient(top, #d9534f 0, #c12e2a 100%);
            background-image: linear-gradient(to bottom, #d9534f 0, #c12e2a 100%);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffd9534f', endColorstr='#ffc12e2a', GradientType=0);
            filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
            background-repeat: repeat-x;
            border-color: #b92c28
        }

        .btn-danger:hover, .btn-danger:focus {
            background-color: #c12e2a;
            background-position: 0 -15px
        }

        .btn-danger:active, .btn-danger.active {
            background-color: #c12e2a;
            border-color: #b92c28
        }

        .thumbnail, .img-thumbnail {
            -webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .075);
            box-shadow: 0 1px 2px rgba(0, 0, 0, .075)
        }

        .dropdown-menu > li > a:hover, .dropdown-menu > li > a:focus {
            background-image: -webkit-linear-gradient(top, #f5f5f5 0, #e8e8e8 100%);
            background-image: linear-gradient(to bottom, #f5f5f5 0, #e8e8e8 100%);
            background-repeat: repeat-x;
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#fff5f5f5', endColorstr='#ffe8e8e8', GradientType=0);
            background-color: #e8e8e8
        }

        .dropdown-menu > .active > a, .dropdown-menu > .active > a:hover, .dropdown-menu > .active > a:focus {
            background-image: -webkit-linear-gradient(top, #428bca 0, #357ebd 100%);
            background-image: linear-gradient(to bottom, #428bca 0, #357ebd 100%);
            background-repeat: repeat-x;
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff428bca', endColorstr='#ff357ebd', GradientType=0);
            background-color: #357ebd
        }

        .navbar-default {
            background-image: -webkit-linear-gradient(top, #fff 0, #f8f8f8 100%);
            background-image: linear-gradient(to bottom, #fff 0, #f8f8f8 100%);
            background-repeat: repeat-x;
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffffff', endColorstr='#fff8f8f8', GradientType=0);
            filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
            border-radius: 4px;
            -webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, .15), 0 1px 5px rgba(0, 0, 0, .075);
            box-shadow: inset 0 1px 0 rgba(255, 255, 255, .15), 0 1px 5px rgba(0, 0, 0, .075)
        }

        .navbar-default .navbar-nav > .active > a {
            background-image: -webkit-linear-gradient(top, #ebebeb 0, #f3f3f3 100%);
            background-image: linear-gradient(to bottom, #ebebeb 0, #f3f3f3 100%);
            background-repeat: repeat-x;
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffebebeb', endColorstr='#fff3f3f3', GradientType=0);
            -webkit-box-shadow: inset 0 3px 9px rgba(0, 0, 0, .075);
            box-shadow: inset 0 3px 9px rgba(0, 0, 0, .075)
        }

        .navbar-brand, .navbar-nav > li > a {
            text-shadow: 0 1px 0 rgba(255, 255, 255, .25)
        }

        .navbar-inverse {
            background-image: -webkit-linear-gradient(top, #3c3c3c 0, #222 100%);
            background-image: linear-gradient(to bottom, #3c3c3c 0, #222 100%);
            background-repeat: repeat-x;
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff3c3c3c', endColorstr='#ff222222', GradientType=0);
            filter: progid:DXImageTransform.Microsoft.gradient(enabled=false)
        }

        .navbar-inverse .navbar-nav > .active > a {
            background-image: -webkit-linear-gradient(top, #222 0, #282828 100%);
            background-image: linear-gradient(to bottom, #222 0, #282828 100%);
            background-repeat: repeat-x;
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff222222', endColorstr='#ff282828', GradientType=0);
            -webkit-box-shadow: inset 0 3px 9px rgba(0, 0, 0, .25);
            box-shadow: inset 0 3px 9px rgba(0, 0, 0, .25)
        }

        .navbar-inverse .navbar-brand, .navbar-inverse .navbar-nav > li > a {
            text-shadow: 0 -1px 0 rgba(0, 0, 0, .25)
        }

        .navbar-static-top, .navbar-fixed-top, .navbar-fixed-bottom {
            border-radius: 0
        }

        .alert {
            text-shadow: 0 1px 0 rgba(255, 255, 255, .2);
            -webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, .25), 0 1px 2px rgba(0, 0, 0, .05);
            box-shadow: inset 0 1px 0 rgba(255, 255, 255, .25), 0 1px 2px rgba(0, 0, 0, .05)
        }

        .alert-success {
            background-image: -webkit-linear-gradient(top, #dff0d8 0, #c8e5bc 100%);
            background-image: linear-gradient(to bottom, #dff0d8 0, #c8e5bc 100%);
            background-repeat: repeat-x;
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffdff0d8', endColorstr='#ffc8e5bc', GradientType=0);
            border-color: #b2dba1
        }

        .alert-info {
            background-image: -webkit-linear-gradient(top, #d9edf7 0, #b9def0 100%);
            background-image: linear-gradient(to bottom, #d9edf7 0, #b9def0 100%);
            background-repeat: repeat-x;
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffd9edf7', endColorstr='#ffb9def0', GradientType=0);
            border-color: #9acfea
        }

        .alert-warning {
            background-image: -webkit-linear-gradient(top, #fcf8e3 0, #f8efc0 100%);
            background-image: linear-gradient(to bottom, #fcf8e3 0, #f8efc0 100%);
            background-repeat: repeat-x;
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#fffcf8e3', endColorstr='#fff8efc0', GradientType=0);
            border-color: #f5e79e
        }

        .alert-danger {
            background-image: -webkit-linear-gradient(top, #f2dede 0, #e7c3c3 100%);
            background-image: linear-gradient(to bottom, #f2dede 0, #e7c3c3 100%);
            background-repeat: repeat-x;
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#fff2dede', endColorstr='#ffe7c3c3', GradientType=0);
            border-color: #dca7a7
        }

        .progress {
            background-image: -webkit-linear-gradient(top, #ebebeb 0, #f5f5f5 100%);
            background-image: linear-gradient(to bottom, #ebebeb 0, #f5f5f5 100%);
            background-repeat: repeat-x;
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffebebeb', endColorstr='#fff5f5f5', GradientType=0)
        }

        .progress-bar {
            background-image: -webkit-linear-gradient(top, #428bca 0, #3071a9 100%);
            background-image: linear-gradient(to bottom, #428bca 0, #3071a9 100%);
            background-repeat: repeat-x;
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff428bca', endColorstr='#ff3071a9', GradientType=0)
        }

        .progress-bar-success {
            background-image: -webkit-linear-gradient(top, #5cb85c 0, #449d44 100%);
            background-image: linear-gradient(to bottom, #5cb85c 0, #449d44 100%);
            background-repeat: repeat-x;
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff5cb85c', endColorstr='#ff449d44', GradientType=0)
        }

        .progress-bar-info {
            background-image: -webkit-linear-gradient(top, #5bc0de 0, #31b0d5 100%);
            background-image: linear-gradient(to bottom, #5bc0de 0, #31b0d5 100%);
            background-repeat: repeat-x;
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff5bc0de', endColorstr='#ff31b0d5', GradientType=0)
        }

        .progress-bar-warning {
            background-image: -webkit-linear-gradient(top, #f0ad4e 0, #ec971f 100%);
            background-image: linear-gradient(to bottom, #f0ad4e 0, #ec971f 100%);
            background-repeat: repeat-x;
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#fff0ad4e', endColorstr='#ffec971f', GradientType=0)
        }

        .progress-bar-danger {
            background-image: -webkit-linear-gradient(top, #d9534f 0, #c9302c 100%);
            background-image: linear-gradient(to bottom, #d9534f 0, #c9302c 100%);
            background-repeat: repeat-x;
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffd9534f', endColorstr='#ffc9302c', GradientType=0)
        }

        .list-group {
            border-radius: 4px;
            -webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .075);
            box-shadow: 0 1px 2px rgba(0, 0, 0, .075)
        }

        .list-group-item.active, .list-group-item.active:hover, .list-group-item.active:focus {
            text-shadow: 0 -1px 0 #3071a9;
            background-image: -webkit-linear-gradient(top, #428bca 0, #3278b3 100%);
            background-image: linear-gradient(to bottom, #428bca 0, #3278b3 100%);
            background-repeat: repeat-x;
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff428bca', endColorstr='#ff3278b3', GradientType=0);
            border-color: #3278b3
        }

        .panel {
            -webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
            box-shadow: 0 1px 2px rgba(0, 0, 0, .05)
        }

        .panel-default > .panel-heading {
            background-image: -webkit-linear-gradient(top, #f5f5f5 0, #e8e8e8 100%);
            background-image: linear-gradient(to bottom, #f5f5f5 0, #e8e8e8 100%);
            background-repeat: repeat-x;
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#fff5f5f5', endColorstr='#ffe8e8e8', GradientType=0)
        }

        .panel-primary > .panel-heading {
            background-image: -webkit-linear-gradient(top, #428bca 0, #357ebd 100%);
            background-image: linear-gradient(to bottom, #428bca 0, #357ebd 100%);
            background-repeat: repeat-x;
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff428bca', endColorstr='#ff357ebd', GradientType=0)
        }

        .panel-success > .panel-heading {
            background-image: -webkit-linear-gradient(top, #dff0d8 0, #d0e9c6 100%);
            background-image: linear-gradient(to bottom, #dff0d8 0, #d0e9c6 100%);
            background-repeat: repeat-x;
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffdff0d8', endColorstr='#ffd0e9c6', GradientType=0)
        }

        .panel-info > .panel-heading {
            background-image: -webkit-linear-gradient(top, #d9edf7 0, #c4e3f3 100%);
            background-image: linear-gradient(to bottom, #d9edf7 0, #c4e3f3 100%);
            background-repeat: repeat-x;
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffd9edf7', endColorstr='#ffc4e3f3', GradientType=0)
        }

        .panel-warning > .panel-heading {
            background-image: -webkit-linear-gradient(top, #fcf8e3 0, #faf2cc 100%);
            background-image: linear-gradient(to bottom, #fcf8e3 0, #faf2cc 100%);
            background-repeat: repeat-x;
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#fffcf8e3', endColorstr='#fffaf2cc', GradientType=0)
        }

        .panel-danger > .panel-heading {
            background-image: -webkit-linear-gradient(top, #f2dede 0, #ebcccc 100%);
            background-image: linear-gradient(to bottom, #f2dede 0, #ebcccc 100%);
            background-repeat: repeat-x;
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#fff2dede', endColorstr='#ffebcccc', GradientType=0)
        }

        .well {
            background-image: -webkit-linear-gradient(top, #e8e8e8 0, #f5f5f5 100%);
            background-image: linear-gradient(to bottom, #e8e8e8 0, #f5f5f5 100%);
            background-repeat: repeat-x;
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffe8e8e8', endColorstr='#fff5f5f5', GradientType=0);
            border-color: #dcdcdc;
            -webkit-box-shadow: inset 0 1px 3px rgba(0, 0, 0, .05), 0 1px 0 rgba(255, 255, 255, .1);
            box-shadow: inset 0 1px 3px rgba(0, 0, 0, .05), 0 1px 0 rgba(255, 255, 255, .1)
        }
    </style>
</head>
<body>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<%--<script src="/bootstrap/js/bootstrap.js"></script>--%>


<form:form>
    <h1 style="font: caption; font-size: 25px; color:#000000;margin-left:30px; margin-top:30px; margin-bottom:10px;">
        <c:out value="Список пользователей"/>
    </h1>
    <table cellspacing="2" class="table1" border="1">
        <tr class="panel-title">
            <td class="h">id</td>
            <td class="h">Имя</td>
            <td class="h">Фамилия</td>
            <td class="h">Зарплата, руб</td>
            <td class="h"></td>
            <td class="h"></td>
        </tr>
            <%--@elvariable id="userList" type="java.util.List<User>"--%>
        <c:forEach var="user" items="${userList}" varStatus="status">
            <tr>
                <td class="td2"> ${user.id}</td>
                <td class="td2"> ${user.name}</td>
                <td class="td2"> ${user.lastname} </td>
                <td class="td2"> ${user.salary} </td>
                <td class="td2"><img src="${pageContext.request.contextPath}/img/edit.jpg">
                    <img src="<c:url value="/img/del.jpg"/>"></td>
                <td class="td2">

                    <a href="delete_question.jsp?del=1"
                       onclick="return window.confirm('Вы уверены, что хотите удалить пользователя ${user.name} ${user.lastname}?');">Удалить</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</form:form>


<div class="page-header">
    <h1>Panels</h1>
</div>
<div class="row">
    <div class="col-sm-4">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">Panel title</h3>
            </div>
            <div class="panel-body">
                Panel content
            </div>
        </div>
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">Panel title</h3>
            </div>
            <div class="panel-body">
                Panel content
            </div>
        </div>
    </div>
    <!-- /.col-sm-4 -->
    <div class="col-sm-4">
        <div class="panel panel-success">
            <div class="panel-heading">
                <h3 class="panel-title">Panel title</h3>
            </div>
            <div class="panel-body">
                Panel content
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h3 class="panel-title">Panel title</h3>
            </div>
            <div class="panel-body">
                Panel content
            </div>
        </div>
    </div>
    <!-- /.col-sm-4 -->
    <div class="col-sm-4">
        <div class="panel panel-warning">
            <div class="panel-heading">
                <h3 class="panel-title">Panel title</h3>
            </div>
            <div class="panel-body">
                Panel content
            </div>
        </div>
        <div class="panel panel-danger">
            <div class="panel-heading">
                <h3 class="panel-title">Panel title</h3>
            </div>
            <div class="panel-body">
                Panel content
            </div>
        </div>
    </div>
    <!-- /.col-sm-4 -->
</div>


</body>
</html>
