<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf8">
    <title>!!!</title>
</head>
<body>

<h1 style="font: caption; font-size: 25px; color:#000000;margin-left:30px; margin-top:30px; margin-bottom:10px;">
    <c:out value="Список пользователей"/>
</h1>

<form:form method="POST" commandName="user" action="${pageContext.request.contextPath}/add">

<table cellspacing="2" class="table1" border="1">
    <tr class="panel-title">
        <td class="h">id</td>
        <td class="h">Имя</td>
        <td class="h">Фамилия</td>
        <td class="h">Зарплата, руб</td>
        <td class="h"></td>
        <td class="h"></td>
    </tr>


    <tr>
        <td class="h"></td>
        <td class="h"><form:input path="name"/></td>
        <td class="h"><form:input path="lastname"/></td>
        <td class="h"><form:input path="salary"/></td>
        <td class="h"></td>
        <td class="h"><input value="Добавить" type="submit"/></td>
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
                <a href="delete/${contact.id}">del</a>
                <a href="delete_question.jsp?del=1"
                   onclick="return window.confirm('Вы уверены, что хотите удалить пользователя ${user.name} ${user.lastname}?');">Удалить</a>
            </td>
        </tr>
    </c:forEach>
    </form:form>
</table>


</body>
</html>
