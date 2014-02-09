<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <%--<tiles:insertAttribute name="header" ignore="true"/>--%>
</head>
<body>
<%--<tiles:insertAttribute name="menu" ignore="true"/>--%>
<%--<tiles:insertAttribute name="body" ignore="true"/>--%>

<form:form>
    <h1 style="font: caption; font-size: 25px; color:#000000;margin-left:30px; margin-top:30px; margin-bottom:10px;">
        <c:out value="Список доступных интерфейсов для администратора '${id}' "/>
    </h1>
    <ul>
        <c:if test="${(cdr) != null}">
            <li><a href="/waptele2/adminweb/cdr/select.html" style="margin-left:40px">Интерфейс контент провайдера</a>
            </li>
        </c:if>

    </ul>
    <p style="margin-top: 20px; margin-left: 50px">
        <input name="exit" style="border: 1px solid #0066CC" type="submit" value="Выход" id="exit">
    </p>
</form:form>

</body>
</html>
