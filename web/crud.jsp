<%-- 
    Document   : crud
    Created on : Jun 30, 2021, 10:41:13 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.Product"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lí</title>
        <style>
            .container_crud{
                padding-top: 100px;
            }
        </style>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="container_crud">
            <h2><a href="check?action=add" >Thêm mới</a></h2>
            <table class="table table-striped table-bordered ">
                <thead>
                    <tr class="bg-primary text-white">
                        <th>ID</th>
                        <th>Hình ảnh</th>
                        <th>Tên sản phẩm</th>
                        <th>Chi tiết</th>
                        <th>Giá tiền</th>
                        <th>Số lượng</th>
                        <th>Phân loại</th>
                        <th>Thực thi</th>
                    </tr>
                </thead>
                <c:forEach items="${requestScope.admin}" var="p">
                    <tr>
                        <td>${p.id}</td>
                        <td><img class="card-img-top" src="images/${p.image}" width="50px"/></td>                    
                        <td>${p.title}</td>
                        <td >${p.description}</td>

                        <td><fmt:formatNumber pattern="#.##" value="${p.price}"/>đ</td>
                        <td>${p.quantity}</td>
                        <td>${p.cateid}</td>
                        <td>
                            <a href="check?action=update&id=${p.id}"><i class="fa fa-fw fa-edit">Cập nhật</i></a>&nbsp;&nbsp;&nbsp;
                            <a href="check?action=delete&id=${p.id}"><i class="fa fa-fw fa-trash">Xóa</i></a>
                        </td>
                    </tr>
                </c:forEach>          
            </table>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
