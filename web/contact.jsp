<%-- 
    Document   : contact
    Created on : Jun 15, 2021, 9:43:24 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        <title>Liên hệ</title>
    </head>
    <style>
        body {
            padding-top: 100px;
            font-family: 'Roboto';            
        }
    </style>
    <script>
        $(function () {

            $("#contact-form").validator();

            $("#contact-form").on("submit", function (e) {
                if (!e.isDefaultPrevented()) {
                    var messageAlert = "alert-success";
                    var messageText =
                            "Your message was sent, thank you. I will get back to you soon.";

                    var alertBox =
                            '<div class="alert ' +
                            messageAlert +
                            ' alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>' +
                            messageText +
                            "</div>";

                    if (messageAlert && messageText) {
                        $("#contact-form").find(".messages").html(alertBox);
                        $("#contact-form")[0].reset();
                    }

                    return false;
                }
            });
        });
    </script>
    <body>
        <%@include file="header.jsp" %>

        <div class="container">

            <div class="row">

                <div class="col-8 mx-auto text-center">

                    <h1>Liên hệ chúng tôi</h1>

                    <p class="lead">Mauris pharetra et ultrices neque ornare aenean euismod elementum. Id neque aliquam vestibulum morbi blandit cursus risus. Nibh sed pulvinar proin gravida hendrerit lectus a.</p>
                    <p>Eget nunc scelerisque viverra mauris. Quis enim lobortis scelerisque fermentum dui faucibus in ornare quam. Amet nulla facilisi morbi tempus iaculis. Tristique magna sit amet purus gravida quis blandit.</p>

                    <form id="contact-form" method="post" action="" role="form">

                        <div class="messages"></div>

                        <div class="controls">

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="form_name">Họ *</label>
                                        <input id="form_name" type="text" name="name" class="form-control" placeholder="Hãy nhập họ của bạn *" required="required" data-error="Firstname is required.">
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="form_lastname">Tên *</label>
                                        <input id="form_lastname" type="text" name="surname" class="form-control" placeholder="Hãy nhập tên của bạn *" required="required" data-error="Lastname is required.">
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="form_email">Email *</label>
                                        <input id="form_email" type="email" name="email" class="form-control" placeholder="Hãy nhập email *" required="required" data-error="Valid email is required.">
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="form_phone">Điện thoại</label>
                                        <input id="form_phone" type="tel" name="phone" class="form-control" placeholder="Hãy nhập số điện thoại">
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="form_message">Lời nhắn *</label>
                                        <textarea id="form_message" name="message" class="form-control" placeholder="Lời nhắn dành cho chúng tôi *" rows="4" required="required" data-error="Hãy để lại lời nhắn."></textarea>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <input type="submit" class="btn btn-success btn-send" value="Send message">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <p style="color:red;"><strong>*</strong> Bắt buộc</p>
                                </div>
                            </div>
                        </div>

                    </form>

                </div>

            </div>

        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
