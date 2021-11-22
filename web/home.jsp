<%-- 
    Document   : home
    Created on : Jun 6, 2021, 3:43:08 PM
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
        <link rel='stylesheet' href='homeCSS.css' type='text/css' media='all'>
        <title>Trang chủ</title>
    </head>

    <body>

        <%@include file="header.jsp" %>
        <!--Slide -->
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="d-block w-100" src="images/VN.png" alt="First slide">
                    <div class="carousel-caption d-none d-md-block">
                        <h3>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi</h3>
                        <p>Lorem ipsum</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="images/TQ.png" alt="Second slide">
                    <div class="carousel-caption d-none d-md-block">
                        <h3>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi</h3>
                        <p>Lorem ipsum</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="images/NB.png" alt="Third slide">
                    <div class="carousel-caption d-none d-md-block">
                        <h3>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi</h3>
                        <p>Lorem ipsum</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="images/HQ.png" alt="Forth slide">
                    <div class="carousel-caption d-none d-md-block">
                        <h3>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi</h3>
                        <p>Lorem ipsum</p>
                    </div>
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>

        <!--Sản phẩm-->
        <h2>Sản phẩm bán chạy</h2>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit nisi ut aliquip ex ea commodo consequat.</p>
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">                
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <c:forEach items="${requestScope.data}" var="c"> 
                        <div class="col mb-5">
                            <div class="card h-100">
                                <!-- Product image-->
                                <img class="card-img-top" src="images/${c.image}"/>
                                <!-- Product details-->
                                <div class="card-body p-4">
                                    <div class="text-center">
                                        <!-- Product name-->
                                        <h5 class="fw-bolder">${c.title}</h5>
                                        <!-- Product price-->
                                        <fmt:formatNumber pattern="##.#" value="${c.price*1.2}"/>đ
                                    </div>
                                    <c:if test="${sessionScope.login.isAdmin != 'admin'}">
                                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="detail?id=${c.id}">Xem chi tiết</a></div>
                                        </div>
                                    </c:if>
                                </div>
                            </div>                        
                        </div>       
                    </c:forEach>
                </div>     
            </div>
        </section>

        <h2>Sản phẩm</h2>
        <p>Nec tincidunt praesent semper feugiat nibh sed pulvinar. Urna condimentum mattis pellentesque id nibh tortor id aliquet lectus. Mattis enim ut tellus elementum sagittis vitae.</p>
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">                
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <c:forEach items="${requestScope.data2}" var="c"> 
                        <div class="col mb-5">
                            <div class="card h-100">
                                <!-- Product image-->
                                <img class="card-img-top" src="images/${c.image}"/>
                                <!-- Product details-->
                                <div class="card-body p-4">
                                    <div class="text-center">
                                        <!-- Product name-->
                                        <h5 class="fw-bolder">${c.title}</h5>                                        
                                        <!-- Product price-->
                                        <fmt:formatNumber pattern="##.#" value="${c.price*1.2}"/>đ
                                    </div>
                                    <c:if test="${c.quantity!=0}">
                                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="detail?id=${c.id}">Xem chi tiết</a></div>
                                        </div>
                                    </c:if>
                                    <c:if test="${c.quantity==0}">
                                        <div class="card-footer p-4 pt-0 border-top-0" style="background: red;">
                                            <div class="text-center"><i class="fa fa-ban"></i>Hết Hàng</div>
                                        </div>
                                    </c:if>
                                </div>
                            </div>                        
                        </div>       
                    </c:forEach>
                </div>     
            </div>
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
                    <c:forEach begin="1" end="${requestScope.num}" var="i">
                        <li class="page-item"><a class="page-link" class="${requestScope.page==i?"active":""}" href="list?page=${i}">${i}</a></li>
                        </c:forEach>
                </ul>
            </nav>
        </section>

        <!--Liên hệ -->
        <div class="team-grid">
            <div class="container">
                <div class="intro">
                    <h2 class="text-center">Đội ngũ </h2>
                    <p class="text-center">Nunc luctus in metus eget fringilla. Aliquam sed justo ligula. Vestibulum nibh erat, pellentesque ut laoreet.  </p>
                </div>
                <div class="row people">
                    <div class="col-md-4 col-lg-3 item">
                        <div class="box" style="background-image:url(images/img_avatar.png)">
                            <div class="cover">
                                <h3 class="name">Gordon</h3>
                                <p class="title">Scientist</p>
                                <div class="social"><a href="#"><i class="fa fa-facebook-official"></i></a><a href="#"><i class="fa fa-twitter"></i></a><a href="#"><i class="fa fa-instagram"></i></a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-lg-3 item">
                        <div class="box" style="background-image:url(images/img_avatar.png)">
                            <div class="cover">
                                <h3 class="name">Clark</h3>
                                <p class="title">Artist </p>
                                <div class="social"><a href="#"><i class="fa fa-facebook-official"></i></a><a href="#"><i class="fa fa-twitter"></i></a><a href="#"><i class="fa fa-instagram"></i></a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-lg-3 item">
                        <div class="box" style="background-image:url(images/img_avatar.png)">
                            <div class="cover">
                                <h3 class="name">Alyx</h3>
                                <p class="title">Lorem </p>
                                <div class="social"><a href="#"><i class="fa fa-facebook-official"></i></a><a href="#"><i class="fa fa-twitter"></i></a><a href="#"><i class="fa fa-instagram"></i></a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-lg-3 item">
                        <div class="box" style="background-image:url(images/img_avatar.png)">
                            <div class="cover">
                                <h3 class="name">G-Man</h3>
                                <p class="title">Lorem </p>
                                <div class="social"><a href="#"><i class="fa fa-facebook-official"></i></a><a href="#"><i class="fa fa-twitter"></i></a><a href="#"><i class="fa fa-instagram"></i></a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <h2>Địa chỉ</h2>
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.9039246769557!2d105.81640931445413!3d20.99648799425622!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ac8fc9226665%3A0xb4551f033ebae9f6!2zMTAwIE5nw7UgMTY0IFbGsMahbmcgVGjhu6thIFbFqSwgS2jGsMahbmcgVHJ1bmcsIFRoYW5oIFh1w6JuLCBIw6AgTuG7mWksIFZp4buHdCBOYW0!5e0!3m2!1svi!2s!4v1622472611606!5m2!1svi!2s" width="100%" height="100%" style="border:0;" allowfullscreen="" loading="lazy"></iframe>

        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
