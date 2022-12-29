<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Discount Calculator!" %>
</h1>
<br/>
<form action="/Discount-Calculator" method="post" style="border: 2px">
    <div><p>Tên sản Phẩm</p><input name="Product Description" ></div>
    <div><p>Giá niêm yết</p><input name="List Price"></div>
    <div><p>Tỷ lệ chiết khấu</p><input name="Discount Percent"></div>
    <button type="submit"> Calculate Discount</button>
</form>
</body>
</html>