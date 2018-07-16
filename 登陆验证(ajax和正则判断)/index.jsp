<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
 <head>
  <title> new document </title>
  <meta name="generator" content="editplus" />
  <meta name="author" content="liyang" />
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <style>
	*{margin:0;padding:0;}
	#header .div{
		width:100%; height:100px;background-color:#fff;line-height:100px;font-size:20px;font-family:"黑体";border-bottom:1px solid #f3f3f3; box-shadow: 0 10px 10px rgba(111,111,111,.5);
	}
	#header .div .icon{
		display:block;width:160px;height:46px;background-image:url('image/icon.png');background-repeat:no-repeat;margin:27px 15px;;float:left;
	}
	#header .div .line{
		float:left;height:40px;width:1px;background-color:#dedede;margin:32px 15px;
	}
	#section form{
		width:450px;margin:125px auto;
	}
	#section form label{
		display:block;width:100%;height:55px;border:1px solid #bbb;line-height:55px;text-indent:10px;font-size:14px;
		letter-spacing:1px;position:relative;overflow:hidden;font-family:"微软雅黑";
	}
	#section form label:after{
		content:"";display:block;width:1px;height:36px;background-color:#dedede;position:absolute;top:50%;margin-top:-16px; left:82px;
	}
	#section form label input{
		border:none;height:100%;width:80%;letter-spacing:1px;outline:none;position:absolute;left:90px;font-size:16px;
		font-family:"微软雅黑";
	}
	#section form div{
		width:100%;height:30px;line-height:30px;letter-spacing:1px;text-indent:20px;font-family:"微软雅黑";
		font-size:14px;
	}
	#section #last{
		width:100%;height:55px;border:1px solid #bbb;line-height:55px;font-size:18px;font-family:"微软雅黑";
		position:relative;left:-20px;top:50px;background-color:#e22;outline:none;cursor:pointer;letter-spacing:15px;
	}
	#section #vlidate{
		display:block;width:150px;height:100%;background-color:#e6e6e6;position:absolute;top:0;right:0;font-size:28px;font-family:"微软雅黑";text-align:center;letter-spacing:5px;
	}
  </style>
 </head>

 <body>
  <header id="header">
	  <div class="div">
		<i class="icon"></i>
		<div class="line"></div>
		<span>欢迎注册</span>
	  </div>
  </header>
  <section id="section">
	  <form action="" method="" id="iform">
		<label>
			用户名
			<input type="text" placeholder="以字母开头且长度不超过20位" name="username">
			<i></i>
		</label>
		<div></div>
		<label>
			密&nbsp;&nbsp;&nbsp;码
			<input type="password" placeholder="字母与数字混合且长度不超过20位且至少6位" name="password">
			<i></i>
		</label>
		<div></div>
		<label>
			确认密码
			<input type="password" placeholder="" name="readypasswd">
			<i></i>
		</label>
		<div></div>
		<label>
			手&nbsp;机&nbsp;号
			<input type="text" placeholder="" name="molibphone">
			<i></i>
		</label>
		<div></div>
		<label onselectstart = "return false">
			验&nbsp;证&nbsp;码
			<input type="text" placeholder="" name="vlidate">
			<i id="vlidate"></i>
		</label>
		<div></div>

		<div>
			<input id="last" type="button" value="立即注册" name="button">
		</div>
	  </form>
  </section>
  <script type="text/javascript">
	var oSection = document.getElementById("section")
	var oForm = document.getElementById("iform");
	var oLast = document.getElementById("last");
	var oV = document.getElementById("vlidate");
	var oInput = document.getElementsByTagName("input");
	var oDiv = oSection.getElementsByTagName("div");
	var on = false;
	var str1="";
	
	code();
	var oL = oV.parentNode.childNodes;
	oL[1].style.width = "50%";

	// 验证用户名
	oInput[0].onblur = function(){
		var content = '';
		var reg = /^[a-zA-Z][0-9a-zA-Z]{0,19}$/;
		on = false;
		if( reg.test( this.value ) ){
			var xhr = new XMLHttpRequest();
			var username = oInput[0].value;
			xhr.open('get','query?username='+username,'true');
			xhr.send();
			xhr.onreadystatechange = function(){
				if( xhr.readyState == 4 ){
					if( xhr.status>=200 && xhr.status<300){
						content = xhr.responseText;
						if( content == "恭喜您，该用户名可用" ){
					 	oDiv[0].style.color = '#dedede';
						oDiv[0].innerHTML = "恭喜您，该用户名可用";
						on = true;
						//alert( "恭喜您，该用户名" + content + "可用" );
						}else{
							oDiv[0].style.color = 'red';
							oDiv[0].innerHTML = "该用户名已被占用";
						}
					}else{
						alert( '出了点问题，状态码为： '+ xhr.status);
					}
				}
			}
		}
		else{
			oDiv[0].style.color = 'red';
			oDiv[0].innerHTML = '用户名格式不正确！';
		}
	}
	// 验证密码
	///^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$/  要求英文与数字混合！
	oInput[1].onblur = function(){
		var reg = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$/;
		on = false;
		if( reg.test( this.value ) ){
			oDiv[1].style.color = '#dedede';
			oDiv[1].innerHTML = '格式正确！';
			on = true;
		}
		else{
			oDiv[1].style.color = 'red';
			oDiv[1].innerHTML = '密码格式不正确！';
		}
	}
	oInput[1].onchange = function(){
		on = false;
		if( oInput[2].value == oInput[1].value ){
			oDiv[2].style.color = '#dedede';
			oDiv[2].innerHTML = "";
			on = true;
		}
	}
	// 确认密码 
	oInput[2].onblur = function(){
		on = false;
		if( oInput[2].value == oInput[1].value ){
			oDiv[2].style.color = '#dedede';
			oDiv[2].innerHTML = "";
			on = true;
		}else{
			oDiv[2].style.color = 'red';
			oDiv[2].innerHTML = '两次密码输入不一样！';
		}
	}

	// 验证手机
	oInput[3].onblur = function(){
		var reg = /^1[34578]\d{9}$/;
		on = false;
		if( reg.test( this.value ) ){
			oDiv[3].style.color = '#dedede';
			oDiv[3].innerHTML = '格式正确！';
			on = true;
		}
		else{
			oDiv[3].style.color = 'red';
			oDiv[3].innerHTML = '手机格式不正确！';
		}
	}
	function code(){
		str1 = "";
		var str="qwertyuiopasdfghjklzxcvbnm1234567890QWERTYUIOPLKJHGFDSAZXCVBNM";
		for(var i=0; i<4;i++){
			str1+=str.charAt(Math.floor(Math.random()*62)) 
		}
		oV.innerHTML = str1;
	}

	// 验证码
	oInput[4].onblur = function(){
		on =false;
		if( this.value.toLowerCase() == str1.toLowerCase() ) {
			oDiv[4].style.color = '#dedede';
			oDiv[4].innerHTML = '正确！';
			on = true;
		}
		else{
			oDiv[4].style.color = 'red';
			oDiv[4].innerHTML = '验证码不正确！';
		}
	}
	// 验证码刷新
	oV.onclick = function(){
		code();
	}
	oLast.onclick = function(){
		if(oInput[0].value && oInput[1].value && oInput[2].value && oInput[3].value && oInput[4].value && on ){
			//oForm.submit();
			//alert("登陆成功！");
			var xhr = new XMLHttpRequest();
			var username = oInput[0].value;
			var password = oInput[1].value;
			var mobliephone = oInput[3].value;
			xhr.open('post','ajax','true');
			xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			xhr.send("username=" + username + "&"+ "password=" + password + "&" + "mobliephone=" + mobliephone);
			xhr.onreadystatechange = function(){
				if( xhr.readyState == 4 ){
					if( xhr.status>=200 && xhr.status<300){
						var cont = xhr.responseText;
						alert(cont);
						//window.location.href="success.jsp";
					}else{
						alert( '出了点问题，状态码为： '+ xhr.status);
					}
				}
			}
		}
	}
  </script>
 </body>
</html>
