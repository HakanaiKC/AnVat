<%-- 
    Document   : details
    Created on : Jul 7, 2021, 11:40:28 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>
        <link rel='stylesheet' href='details.css' type='text/css' media='all'>
        <title>Chi tiết sản phẩm</title>
    </head>
    <body>
        <%@include file="header.jsp" %>

        <main class="mt-5 pt-4">
            <div class="container dark-grey-text mt-5">
                <div class="row wow fadeIn">
                    <div class="col-md-6 mb-4">
                        <img src="images/${requestScope.product.image}" class="img-fluid" alt="">
                    </div>
                    <div class="col-md-6 mb-4">
                        <div class="p-4">                            
                            <h1>${requestScope.product.title}</h1>
                            <p class="lead font-weight-bold">Chi tiết</p>
                            <p>${requestScope.product.description}</p>
                            <form class="d-flex justify-content-left" action="addcart">
                                <input type="text" name="id" readonly value="${requestScope.product.id}">                        
                                <input name="price" readonly value="${requestScope.product.price*1.2}VND">                                
                                <input min="1" max="${requestScope.product.quantity}" name="quantity" type="number" value="1" aria-label="Search" class="form-control" style="width: 100px">
                                <input type="submit" class="round-black-btn" value="Add to Cart">
                            </form>                                
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
