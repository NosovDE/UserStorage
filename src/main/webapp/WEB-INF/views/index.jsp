<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf8">
    <title>Simple user storage</title>
</head>
<body>

<h1 style="font: caption; font-size: 25px; color:#000000;margin-left:30px; margin-top:30px; margin-bottom:10px;">
    <c:out value="Simple User Storage"/>
</h1>

<form:form method="POST" commandName="user" action="${pageContext.request.contextPath}/add">

    <table>
        <tr>
            <td class="h"></td>
            <td class="h">
                <form:label path="name">Имя: </form:label>
                <form:input path="name" id="name"/></td>
            <td class="h">
                <form:label path="lastname">Фамилия: </form:label>
                <form:input path="lastname" id="lastname"/></td>
            <td class="h">
                <form:label path="name">Сумма: </form:label>
                <form:input path="salary" id="salary"/></td>
            <td class="h"><input value="Добавить" type="submit"/></td>
        </tr>
    </table>

</form:form>

<table cellspacing="2" class="table1" border="1">
    <tr class="panel-title">
        <td class="h"><a href="${pageContext.request.contextPath}/index/id">id</a></td>
        <td class="h"><a href="${pageContext.request.contextPath}/index/name">Имя</a></td>
        <td class="h"><a href="${pageContext.request.contextPath}/index/lastname">Фамилия</a></td>
        <td class="h"><a href="${pageContext.request.contextPath}/index/salary">Зарплата, руб</a></td>
        <td class="h"></td>
        <td class="h"></td>
    </tr>


    <%--@elvariable id="userList" type="java.util.List<User>"--%>
    <c:forEach var="u" items="${userList}">
        <tr>
            <td class="td2"> ${u.id}</td>
            <td class="td2"> ${u.name}</td>
            <td class="td2"> ${u.lastname} </td>
            <td class="td2"> ${u.salary} </td>
            <td class="td2">
                <a href="${pageContext.request.contextPath}/edit/${u.id}"><img src="${pageContext.request.contextPath}/img/edit.jpg" alt="Редактировать"/></a>
            </td>
            <td class="td2">
                <a href="${pageContext.request.contextPath}/delete/${u.id}"
                   onclick="return window.confirm('Вы уверены, что хотите удалить пользователя ${u.name} ${u.lastname}?');">
                    <img src="${pageContext.request.contextPath}/img/del.jpg" alt="Удалить"/>
                </a>
            </td>
        </tr>
    </c:forEach>
    <%--</form:form>--%>
</table>


</body>
</html>
