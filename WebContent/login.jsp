<%@page import="org.apache.el.util.Validation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html>
<head>
<script type="text/javascript">
    
</script>

<meta charset="utf-8" />
<title>택배비 계산기 | 내 택배비는 얼마?</title>
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no"/>
<link rel="stylesheet" href="assets/css/login.css"/>
</head>

<body>
   <!-- Header -->
   <header id="header" class="clearfix">
      <h1>택배비 계산기</h1>
      <p>내 택배비는 얼마?</p>
      <div id="ma">*관리자만 로그인이 가능합니다.*</div>
      <c:if test="${not empty validate && !validate }">
      	<div id="idpw">아이디 또는 비번이 유효하지 않습니다.</div>
      </c:if>
   </header>

   <div class="content">
     <div id="close" onclick="setVisibility('layer','none');" style="cursor: pointer;"><h3></h3></div>
      <!-- 안보이게 -->
       <section class="container">
          <div class="login">
           
             <form name="login-form" action="loginProc.jsp" method="post">
              <p><input type="text" name="id" value="" placeholder="id"></p>
              <p><input type="password" name="pwd" value="" placeholder="Password" /></p>
              <p class="submit"><input type="submit" name="commit" value="로그인" />&nbsp;&nbsp;&nbsp;
              <input id="cancle-button" type="button" value="취소" /></p>
            </form>
          </div>
        </section>
     </div>
     <script src="assets/js/script.js"></script>
</body>
</html>