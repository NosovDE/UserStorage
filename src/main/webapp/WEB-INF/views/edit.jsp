<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title></title>
</head>
<body>
<form:form method="POST" commandName="user" action="${pageContext.request.contextPath}/add">
    <table cellspacing="2" class="table1" border="1">
        <tr class="panel-title">
            <td class="h">id</td>
            <td class="h">Имя</td>
            <td class="h">Фамилия</td>
            <td class="h">Зарплата, руб</td>
        </tr>


        <tr>
            <td class="td2"> ${id}</td>
            <td class="td2"> <form:input path="name">${name}</form:input></td>
            <td class="td2"> <form:input path="lastname">${lastname}</form:input>  </td>
            <td class="td2"> ${salary} </td>
        </tr>
    </table>
    <input value="Сохранить" type="submit"/>
</form:form>
</body>
</html>
