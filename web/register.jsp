<%-- 
    Document   : register
    Created on : Jun 3, 2021, 12:59:08 PM
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
        <link rel='stylesheet' href='register.css' type='text/css' media='all'>
        <title>Đăng ký</title>
        <script type="text/javascript">
            function checkPass() {
                var pass1 = document.getElementById('pass1');
                var pass2 = document.getElementById('pass2');
                var message = document.getElementById('confirmMessage');
                var goodColor = "#66cc66";
                var badColor = "#ff6666";
                if (pass1.value === pass2.value) {
                    pass2.style.backgroundColor = goodColor;
                    message.style.color = goodColor;
                    message.innerHTML = "Mật khẩu đã trùng";
                    return true;
                } else {
                    pass2.style.backgroundColor = badColor;
                    message.style.color = badColor;
                    message.innerHTML = "Mật khẩu không trùng!";
                    return false;
                }
            }
            ;
            function validatephone(phone)
            {
                var maintainplus = '';
                var numval = phone.value;
                if (numval.charAt(0) === '+')
                {
                    var maintainplus = '';
                }
                curphonevar = numval.replace(/[\\A-Za-z!"£$%^&\,*+_={};:'@#~,.Š\/<>?|`¬\]\[]/g, '');
                phone.value = maintainplus + curphonevar;
                var maintainplus = '';
                phone.focus;
            }
            ;

            ;
            function email_validate(email) {
                var regMail = /^([_a-zA-Z0-9-]+)(\.[_a-zA-Z0-9-]+)*@([a-zA-Z0-9-]+\.)+([a-zA-Z]{2,3})$/;
                if (regMail.test(email) === false)
                {
                    document.getElementById("status").innerHTML = "<span class='warning'>Email không hợp lệ</span>";
                } else
                {
                    document.getElementById("status").innerHTML = "<span class='valid'>Email hợp lệ</span>";
                }
            }
            ;
        </script>
    </head>
    <body>
        <%@include file="header.jsp" %>

        <div class="container">
            <div class="row align-items-center h-100">
                <div class="col-5 mx-auto text-center">
                    <form action="register" method="post" id="fileForm" role="form"> 
                        <div class="form-login">
                            <h4>Đăng ký</h4>                           
                            <div class="form-group">
                                <span class="req"><small> Bắt buộc *</small></span><br/>
                                <label for="username"><span class="req">* </span> Tên đăng nhập: </label> 
                                <input class="form-control" type="text" name="user" id = "txt" required/>  
                                <div id="errLast"></div>
                            </div>

                            <div class="form-group"> 	 
                                <label for="name"><span class="req">* </span> Họ và Tên: </label>
                                <input class="form-control" type="text" name="fullname" id = "txt" required /> 
                                <div id="name"></div>    
                            </div>

                            <div class="form-group">
                                <label for="email"> Email: </label> 
                                <input class="form-control" type="text" name="email" id = "email"  onchange="email_validate(this.value);" />   
                                <div class="status" id="status"></div>
                            </div>

                            <div class="form-group">
                                <label for="dob"><span class="req">* </span> Ngày tháng năm sinh: </label> 
                                <input class="form-control" type="date" name="dob" required />  
                                <div id="dob"></div>
                            </div>

                            <div class="form-group">                            
                                <label for="phonenumber"><span class="req">* </span> Số điện thoại: </label>
                                <input required type="text" name="phonenumber" id="phone" class="form-control phone" maxlength="10" onkeyup="validatephone(this);"/> 
                            </div>
                            
                            <div class="form-group">                            
                                <label for="address"><span class="req">* </span> Địa chỉ: </label>
                                <input required type="text" name="address" id="address" class="form-control address"/> 
                            </div>

                            <div class="form-group">
                                <label for="password"><span class="req">* </span> Mật khẩu: </label>
                                <input required name="pass" type="password" class="form-control inputpass" minlength="4" maxlength="16"  id="pass1" /> </p>

                                <label for="password"><span class="req">* </span> Nhập lại mật khẩu: </label>
                                <input required name="pass" type="password" class="form-control inputpass" minlength="4" maxlength="16" id="pass2" onkeyup="checkPass(); return false;" />
                                <span id="confirmMessage" class="confirmMessage"></span>
                            </div>

                            <div class="form-group">

                                <?php //$date_entered = date('m/d/Y H:i:s'); ?>
                                <input type="hidden" value="<?php //echo $date_entered; ?>" name="dateregistered">
                                <input type="hidden" value="0" name="activate" />
                                <hr>

                                <input type="checkbox" required name="terms" onchange="this.setCustomValidity(validity.valueMissing ? 'Vui lòng cho biết rằng bạn chấp nhận các Điều khoản và Điều kiện' : '');" id="field_terms">   <label for="terms">Tôi đồng ý với <a href="terms.php" title="điều khoản và điều kiện" style="text-decoration: none; color: yellow">điều khoản và điều kiện</a> Đăng ký.</label><span class="req">* </span>
                            </div>
                            <h3 style="color: red">${requestScope.error}</h3>
                            <div class="form-group">
                                <input class="btn btn-success" type="submit" name="submit_reg" value="Đăng ký">
                            </div>
                            <h5>Đã là thành viên? <a href="Dangnhap.jsp" style="text-decoration: none; color: yellow">Đăng nhập</a></h5>
                        </div>   
                    </form><!-- ends register form -->

                    <script type="text/javascript">
                        document.getElementById("field_terms").setCustomValidity("Vui lòng cho biết rằng bạn chấp nhận các Điều khoản và Điều kiện");
                    </script>
                </div>
            </div>
        </div>
        <br/><br/><br/>                    
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
