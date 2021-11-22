<%-- 
    Document   : header
    Created on : Jul 5, 2021, 11:44:24 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <link rel='stylesheet' href='homeCSS.css' type='text/css' media='all'>
    </head>
    <body>
        <nav class="navbar navbar-expand-sm bg-warning navbar-light fixed-top">
            <a href="list" class="navbar-brand">Diamond</a>
            <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                <div class="navbar-nav">
                    <a href="list" class="nav-item nav-link">Trang chủ</a>
                    <c:if test="${sessionScope.account.isAdmin == 'admin'}">
                        <a class="nav-item nav-link" href="crud"><i class="fa fa-fw fa-plus"></i></a>
                        </c:if>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Sản phẩm</a>
                        <div class="dropdown-menu">
                            <form action="cate" method="post">          
                                <a href="cate?cid=1" class="dropdown-item">Trung Quốc</a>
                                <a href="cate?cid=2" class="dropdown-item">Việt Nam</a>
                                <a href="cate?cid=3" class="dropdown-item">Nhật Bản</a>
                                <a href="cate?cid=4" class="dropdown-item">Hàn Quốc</a>
                            </form>           
                        </div>
                    </div>
                    <a href="contact.jsp" class="nav-item nav-link ">Liên hệ</a>
                </div>

                <div class="navbar-nav">
                    <form class="form-inline" action="search" method="get">
                        <input class="form-control mr-sm-2" type="text" placeholder="Tìm kiếm" name="title">            
                        <button class="btn btn-success" type="submit" value="search">Tìm kiếm</button>
                    </form>
                    <c:if test="${sessionScope.account==null}">
                        <a href="register.jsp" class="nav-item nav-link"><i class="fa fa-fw fa-sign-in"></i>Đăng ký</a>
                        <a href="login.jsp" class="nav-item nav-link"><i class="fa fa-fw fa-user"></i>Đăng nhập</a>
                    </c:if>
                    <c:if test="${sessionScope.account!=null}">
                        <a href="logout.jsp" class="nav-item nav-link"><i class="fa fa-fw fa-sign-out"></i>Đăng xuất</a>
                        <a href="profile" class="nav-item nav-link">
                            <span class="glyphicon glyiconuser"></span>
                            ${sessionScope.account.user}
                        </a> 
                    </c:if>        

                    <c:if test="${sessionScope.account!=null}">    
                        <a href="cart" class="nav-item nav-link"><i class="fa fa-fw fa-shopping-cart"></i></a>
                    </c:if> 
                    <c:if test="${sessionScope.account==null}">    
                        <a href="cart.jsp" class="nav-item nav-link"><i class="fa fa-fw fa-shopping-cart"></i></a>
                    </c:if> 
                </div>
            </div>
        </nav>
    </body>
</html>
