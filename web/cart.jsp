
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel='stylesheet' href='cart.css' type='text/css' media='all'>
        <title>Giỏ hàng</title>
    </head>
    <body>
        <%@include file="header.jsp" %>               
        <div class="cart-wrap">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="main-heading">Giỏ hàng</div>
                        <div class="table-cart">
                            <table>
                                <thead>
                                    <tr>
                                        <th>Sản phẩm</th>
                                        <th>Số lượng</th>
                                        <th>Tổng tiền</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <c:forEach items="${sessionScope.cartlist}" var="list">
                                    <tbody>
                                        <tr>
                                            <td>
                                                <div class="display-flex align-center">
                                                    <div class="img-product">
                                                        <img src="images/${list.product.image}" class="mCS_img_loaded">
                                                    </div>
                                                    <div class="name-product">
                                                        <a href="detail?id=${list.product.id}" style="text-decoration: none;">${list.product.title}</a>
                                                    </div>
                                                    <div class="price">
                                                        <fmt:formatNumber type="number" maxFractionDigits="2" value="${list.price*1.2}"/>đ
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="product-count">
                                                <form action="change" class="count-inlineflex">
                                                    <input size="1" class="form-control" type="number" id="quantity"   name="quantity" min="1" max="${list.product.quantity}" value="${list.quantity}"  onchange="this.form.submit()"/>
                                                    <input type="text" name="id" value="${list.product.id}" style="display: none">
                                                </form>
                                            </td>
                                            <td>
                                                <div class="total">
                                                    <fmt:formatNumber type="number" maxFractionDigits="2" value="${list.price*list.quantity*1.2}"/>đ
                                                </div>
                                            </td>
                                            <td>
                                                <a href="remove?id=${list.product.id}"><button class="btn btn-sm btn-danger"><i class="fa fa-trash"></i> </button> </a>
                                            </td>
                                        </tr>                                    
                                    </tbody>
                                </c:forEach>
                            </table>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="cart-totals">
                            <h3>Tổng tiền trong giỏ</h3>
                            <form action="#" method="get" accept-charset="utf-8">
                                <table>
                                    <tbody>
                                        <tr>
                                            <td>Tạm tính</td>
                                            <td class="subtotal"><fmt:formatNumber type="number" maxFractionDigits="2" value="${sessionScope.total*1.2}"/>đ</td>
                                        </tr>
                                        <tr>
                                            <td>Phí ship</td>
                                            <td class="free-shipping">Miễn phí</td>
                                        </tr>
                                        <tr class="total-row">
                                            <td>Tổng tiền</td>
                                            <td class="price-total"><fmt:formatNumber type="number" maxFractionDigits="2" value="${sessionScope.total*1.2}"/>đ</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div class="btn-cart-totals">
                                    <a href="search?title=" class="update round-black-btn" onclick="">Tiếp tục mua hàng</a>
                                    <a href="#" class="checkout round-black-btn" onclick="location.href = 'checkout?cart=${sessionScope.cart}';">Thanh toán</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
