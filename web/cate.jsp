<%-- 
    Document   : cate
    Created on : Jun 27, 2021, 12:50:07 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        <link rel='stylesheet' href='searchcss.css' type='text/css' media='all'>
        <title>Sản phẩm</title>
        <style>
            .container{
                padding-top: 100px;
            }
        </style>
        <script type="text/javascript">
            function buy(id, quantity) {
                var m = document.f.num.value;
                if (m > quantity) {
                    alert("Khong du hang");
                    return;
                } else {
                    document.f.action = "buy?id=" + id;
                    document.f.submit();
                }
            }
        </script>
    </head>
    <body>
        <%@include file="header.jsp" %>

        <div class="container">
            <c:set var="page" value="${requestScope.page}"/>
            <h3 class="h3">Danh sách sản phẩm</h3>
            <div class="row">                
                <c:forEach items="${requestScope.data}" var="s">
                    <div class="col-md-3 col-sm-6">
                        <div class="product-grid3">
                            <div class="product-image3">
                                <img class="pic-1" src="images/${s.image}">
                                <div class="pic-2">${s.description}</div>
                                <c:if test="${s.quantity!=0}">
                                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="detail?id=${s.id}">Xem chi tiết</a></div>
                                    </div>
                                </c:if>
                                <c:if test="${s.quantity==0}">
                                    <div class="card-footer p-4 pt-0 border-top-0">
                                        <div class="text-center"><i class="fa fa-ban"></i>Hết Hàng</div>
                                    </div>
                                </c:if>

                            </div>
                            <div class="product-content">
                                <h3 class="title">${s.title}</h3>
                                <div class="price">
                                    <fmt:formatNumber pattern="##.#" value="${s.price*1.2}"/>đ
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>                
            </div>
        </div>
        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
                <c:set var="cid" value="${requestScope.cid}"/>
                <c:forEach begin="${1}" end="${requestScope.num2}" var="i">
                    <li class="page-item"><a class="page-link" class="${i==page?"active":""}" href="cate?page=${i}&cid=${cid}">${i}</a></li> 
                    </c:forEach>
            </ul>
        </nav>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
