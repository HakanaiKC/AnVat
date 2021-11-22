<%-- 
    Document   : addNew
    Created on : May 18, 2021, 1:53:32 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thêm sản phẩm</title>

    </head>
    <body>
        <h1>Thêm sản phẩm</h1>        
        <h2 style="color: red">${requestScope.error}</h2>        
        <form action="add" method="get">
            Nhập id:<input type="text" name="id"/><br/>
            Tải hình ảnh:<input type="file" name="image"/><br/>
            Nhập giá tiền:<input type="text" name="price"/><br/>
            Nhập số lượng:<input type="text" name="quantity"/><br/>
            Nhập tên sản phẩm:<input type="text" name="title"/><br/>            
            Miêu tả:<input type="text" name="description"/><br/>            
            Nhập cateId:<input type="text" name="cateid"/><br/>
            <input type="submit" value="Add"/>
        </form>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
