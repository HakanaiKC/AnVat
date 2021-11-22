<%-- 
    Document   : login
    Created on : May 27, 2021, 1:28:10 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>
        <link rel='stylesheet' href='homeCSS.css' type='text/css' media='all'>
        <link rel='stylesheet' href='register.css' type='text/css' media='all'>
        <title>Đăng nhập</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        
            <div class="container" >
                <div class="row align-items-center h-100">
                    <div class="col-5 mx-auto text-center">
                        <form action="login" method="post">
                            <c:set var="cookie" value="${pageContext.request.cookies}"/>
                            <div class="form-login"><br/>
                                <h4>Đăng nhập</h4>
                                <br/>
                                <input type="text" name="user" class="form-control input-sm chat-input" placeholder="Tên đăng nhập" required value="${cookie.user.value}"/>
                                <br/><br/>
                                <input type="password" name="pass" class="form-control input-sm chat-input" placeholder="Mật khẩu" required value="${cookie.pass.value}"/>
                                <br/>
                                <div class="custom-control custom-checkbox mb-3">
                                    <input type="checkbox" ${cookie.rem.value eq 'ON' ?"checked":""} class="custom-control-input" id="customCheck" ${cookie.rem.value eq 'ON'?"checked":""} name="rem" value="ON"/>
                                <label class="custom-control-label" for="customCheck">Nhớ mật khẩu</label>
                                </div>    
                                <h3 style="color: red">${requestScope.error} </h3>
                                <br/>
                                <input class="btn btn-success" type="submit" name="account" value="Đăng nhập">
                                <br/><br/>
                                <p>Chưa phải là thành viên?</p><a href="register.jsp" style="text-decoration: none; color: yellow" >Đăng ký</a>
                            </div>
                        </form>
                    </div>
                </div>
                <br/><br/><br/>
            </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
