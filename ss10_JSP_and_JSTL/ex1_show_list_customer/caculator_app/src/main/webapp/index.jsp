<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
</head>
<body>
<h1>Simple Calculator</h1>
<form method="post" action="/calculate">
    <fieldset>
        <legend>Calculator</legend>
        First operand:
        <input name="operand_1" type="text" placeholder="Input first operand">
        Operator:

        <select name="operator">
            <option value="+">+</option>
            <option value="-">-</option>
            <option value="*">*</option>
            <option value="/">/</option>
        </select>
        Second operand:
        <input name="operand_2" type="text" placeholder="Input second operand">
        <input type="submit" value="Calculate">
    </fieldset>
</form>
</body>
</html>