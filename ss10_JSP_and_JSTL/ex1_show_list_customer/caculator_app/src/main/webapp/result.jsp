<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Result</title>
</head>
<body>
<h3>Result:</h3>
<c:choose>
    <c:when test="${param.operator == '+'}">
        <h4>${firstOperand} + ${secondOperand} = ${addition}</h4>
    </c:when>

    <c:when test="${param.operator == '-'}">
        <h4>${param.operand_1} - ${param.operand_2} = ${subtraction}</h4>
    </c:when>

    <c:when test="${param.operator == '*'}">
        <h4>${param.operand_1} * ${param.operand_2} = ${multiplication}</h4>
    </c:when>

    <c:when test="${param.operator == '/'}">
        <c:if test="${param.operand_2 == 0}">
            <h4>Can't divide by zero!</h4>
        </c:if>

        <c:if test="${param.operand_1 != 0}">
            <h4>${param.operand_1} / ${param.operand_2} = ${division}</h4>
        </c:if>
    </c:when>
</c:choose>
</body>
</html>