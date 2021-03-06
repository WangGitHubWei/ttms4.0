<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri= "http://java.sun.com/jsp/jstl/core" prefix= "c" %> 
<c:set var="basePath" value="${pageContext.request.contextPath}"></c:set>
<HTML>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>TTMS旅游管理系统</title>
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="stylesheet" href="${basePath}/bootstrap/css/bootstrap.min.css" />
  <link rel="stylesheet" href="${basePath}/static/css/AdminLTE.min.css">
  
  <script src="${basePath}/static/libs/jquery.min.js"></script>
  <script src="${basePath}/static/libs/bootstrap.min.js"></script>
</head>
<body class="hold-transition login-page">
<div class="login-box" id="rrapp">
  <div class="login-logo">
  	<img src="${basePath }/images/logo_login.png" alt="logo" />
    <b>旅游管理系统</b>
  </div>
  <div class="login-box-body">
      <p class="login-box-msg"><b>用户登录</b></p>
       <div class="alert alert-danger alert-dismissible" style="display:none">
        <h4 style="margin-bottom: 0px;"><i class="fa fa-exclamation-triangle" id="errorMessage"></i></h4>
      </div>
      <div class="form-group has-feedback">
          <input type="text" class="form-control" id="username" placeholder="账号">
          <span class="glyphicon glyphicon-user form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
          <input type="password" class="form-control" id="userpwd" placeholder="密码">
          <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>

      <div class="row">
        <div class="col-xs-12">
          <button type="button" class="btn btn-primary btn-block btn-flat" id="btn_login" >登录</button>
        </div>
      </div>
  </div>
</div>
</body>
</HTML>
<script type="text/javascript">
 var SUCCESS = 1;
$(function(){
	//回车按钮
	$(document).keyup(function(event) {
		if (event.keyCode == 13) {
			$("#btn_login").trigger("click");
		}
	});
	//点击登录按钮
	$('#btn_login').click(loginCheck)
})

function loginCheck(){
	debugger
	var userName = $('#username').val();
	var userPwd = $('#userpwd').val();
	if(userName==''){
		$('#errorMessage').parent().parent().css('display','block');
		$('#errorMessage').text('用户名不能为空！');
		return false;
	}
	if(userPwd==''){
		$('#errorMessage').parent().parent().css('display','block');
		$('#errorMessage').text('密码不能为空！');
		return false;
	}
	//判断此用户是否存在于数据库中
	var url = 'confirmUser.do';
	var params = {'username':userName,'userpwd':userPwd};
	$.post(url,params,function(result){
		if(result.state==SUCCESS){   //用户校验成功，跳转到主页面
			location.href='indexUI.do';
		}else{
		   location.href='indexUI.do';
		 //	$('#errorMessage').parent().parent().css('display','block');
		 //	$('#errorMessage').text(result.message);
		}
	})
}
</script>

