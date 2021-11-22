<%-- 
    Document   : update
    Created on : May 18, 2021, 3:42:12 PM
    Author     : ADMIN
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cập nhật</title>
    </head>
    <script>
        var image = $('input[type=file]').val().replace(/C:\\fakepath\\/i, '');
    </script>
    <body>
        <%@include file="header.jsp" %>
        <h1>Cập nhật</h1>
        <c:set var="p" value="${requestScope.product}"/>    
        <form action="update" method="post">
            Nhập id:<input type="text" name="id" value="${p.id}"/><br/>
            Tải hình ảnh:<input type="file" name="image" value="${p.image}"/><br/>
            Nhập tên sản phẩm:<input type="text" name="title" value="${p.title}"/><br/>
            Mô tả:<input type="text" name="description" value="${p.description}"/><br/>
            Giá tiền:<input type="text" name="price" value="${p.price}"/><br/>
            Số lượng:<input type="text" name="quantity" value="${p.quantity}"/><br/> 
            Nhập cateid:<input type="text" name="cid" value="${p.cateid}"/><br/>
            <input type="submit" value="Update"/>
        </form>
            
            <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
