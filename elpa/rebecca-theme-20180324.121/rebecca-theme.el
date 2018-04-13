<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Page Restricted</title>
	<script language="JavaScript">
		var params = {ldu:{'loginDifferentUser':'<a href="javascript:openSessionInNewWindow();" onClick="openSessionInNewWindow();this.blur();return false;" class="submit-btn login">Login</a>'},re:{'exception1':'Request An Exception','exception2':'Reason:','exception3':'<textarea id="rem2" name="rem2" rows="3" cols="40"></textarea>','exception4':'<a href="javascript:requestOverride();" class="submit-btn exception" onClick="this.blur();">Request Exception</a>','exception5':'Email:','exception6':'<input type="text" id="rem3" name="rem3">'},ov:{'ov':'<a href=\"javascript:overrideSite();\" class=\"submit-btn login\" onClick=\"this.blur();\">Override Site</a><span id=\"ovError\"></span>'}},
				general = {'url':'<a href="http://' + decode(getParameter('bu')) + '">' + decode(getParameter('bu')) + '</a>','description':decode(getParameter('bc')),'groupNumber':decode(getParameter('fp')),'groupName':decode(getParameter('fn')),'ipAddress':decode(getParameter('ip')),'clia':'Currently logged into IP Address ' + decode(getParameter('ip')),'customText':decode(getParameter('ct'))};
		function getParameter(name) {
			name = name.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");
			var regexS = "[\\?&]"+name+"=([^&#]*)",
					regex = new RegExp( regexS ),
					results = regex.exec( window.location.href );
			return results == null ? "" : results[1];
		};
		function decode(encodedItem) {
			return decodeURIComponent(encodedItem.replace(/\+/g,  " ")).replace(/(<([^>]+)>)/ig, "");
		};
		function populateDom(obj) {
			for (i in obj) {
				document.getElementById(i).innerHTML = obj[i];
			}
		};
		function displaySections() {
			for (var item in params) {
				if (getParameter(item) == '1') {
					populateDom(params[item]);
				} else {
					if (item == 're') {
						document.getElementById('exception').className = "hidden";
					}
				}
			}
			populateDom(general);
		};
		function overrideSite() {
			var orRequest = new XMLHttpRequest();
			orRequest.onreadystatechange = function() {
				document.getElementById('ovError').innerHTML = '';
				if(orRequest.readyState === 4) {
					if(orRequest.status === 200) {
						window.location = 'http://' + decode(getParameter('bu'));
					}
					else {
						document.getElementById('ovError').innerHTML = 'Failed to Override Site. Contact your system administrator.';
					}
				}
			};
			if (getParameter('sck') != '') {
				orRequest.open('GET', 'http://' + decode(getParameter('ibip')) + '/json/requestOverrideSite?domain=' + decode(getParameter('bu')) + '&rt=sco&ip='+ decode(getParameter('ip')) + '&sck=' + decode(getParameter('sck')), 1);
			}
			else if (getParameter('sckuc') != '') {
				orRequest.open('GET', 'http://' + decode(getParameter('ibip')) + '/json/requestOverrideSite?domain=' + decode(getParameter('bu')) + '&rt=uc&ip='+ decode(getParameter('ip')) + '&sck=' + decode(getParameter('sckuc')), 1);
			}
			else {
				orRequest.open('GET', 'http://' + decode(getParameter('ibip')) + '/json/requestOverrideSite?domain=' + decode(getParameter('bu')) + '&rt=uc&ip='+ decode(getParameter('ip')), 1);
			}
			orRequest.setRequestHeader("Content-Type", "application/json");
			orRequest.send();
		};
		function requestOverride() {
			var form = document.forms[0];
			form.fullUrl.value = decode(getParameter('bu'));
			if (getParameter('sck') != '') {
				exForm.sck.value = decode(getParameter('sck'));
			}
			else if (getParameter('sckuc') != '') {
				exForm.sck.value = decode(getParameter('sckuc'));
			}
			form.button.value = 'requestException';
			if(document.getElementById("rem2")) {
				form.rem.value = document.getElementById("rem2").value;
			}
			if(document.getElementById("rem3")) {
				form.contactEmail.value = document.getElementById("rem3").value;
			}
			form.gn.value = decode(getParameter('fp'));
			form.action = 'http://' + getParameter('ibip') + '/page_block_submit';
			form.submit();
		};
		function openSessionInNewWindow() {
			var newWindow = window.open('http://' + getParameter('ibip') + '/user_login_small.html','iBossSessionWindow','toolbar=no, location=no, directories=no, status=no, menubar=no, resizable=yes, scrollbars=yes, width=625, height=650');
			newWindow.focus();
			return false;
		};
	</script>
	<style>
		body {
			margin: 0;
			padding: 0;
			font-family: "Trebuchet MS", Helvetica, sans-serif;
		}
		h1,
		h2,
		h3 {
			font-weight: normal;
		}
		.hidden {
			display: none;
		}
		.clearfix:after {
			content: ".";
			visibility: hidden;
			display: block;
			height: 0;
			clear: both;
		}
		.center-text {
			text-align: center;
		}
		#header {
			color: rgb(255, 255, 255);
			background: rgb(51, 51, 51);
		}
		.header-text {
			padding: 0;
			margin: 0;
			font-size: 12px;
			font-weight: bold;
		}
		#rem2 {
			resize:none;
			overflow:auto;
			width: 100%;
			border: 1px solid #ccc;
			padding: 10px;
			margin: 10px 0;
			box-sizing: border-box;
		}
		#rem3 {
			width: 100%;
			padding: 10px;
			border: 1px solid #ccc;
			margin: 10px 0;
			box-sizing: border-box;
		}
		#mainContent {
			background: rgb(243, 243, 243);
			color: rgb(0, 0, 0);
		}
		.center-content {
			max-width: 1000px;
			display: block;
			margin: 0 auto;
			padding: 15px;
		}
		.logo-img {
			display: block;
			margin: 20px auto;
			max-width: 100%;
		}
		.restrict-content,
		.exception-content {
			padding: 15px;
			box-sizing: border-box;
		}
		.restrict-content {
			max-width: 1000px;
		}
		.exception-content {
			max-width: 400px;
			margin: 0 auto;
		}
		.submit-btn {
			background: #333333;
			color: #ffffff;
			border-radius: 20px;
			padding: 5px 15px;
			margin: 10px 0;
			display: inline-block;
			text-decoration: none;
		}
		.submit-btn.login {
			background: rgb(51, 51, 51);
			color: rgb(255, 255, 255);
			border-radius: 20px;
		}
		.submit-btn.exception {
			background: rgb(51, 51, 51);
			color: rgb(255, 255, 255);
			border-radius: 20px;
		}
		.left-content {
			width: 50%;
			float: left;
			box-sizing: border-box;
			padding: 0 20px;
		}
		.right-content {
			width: 50%;
			float: right;
			box-sizing: border-box;
			padding: 0 20px;
		}
		.right-content h2 {
			color: rgb(0, 0, 0);
		}
		.warning-icon {
			margin: 0 auto;
			display: block;
			max-width: 100%;
		}
		@media (max-width:768px) {
			.left-content,
			.right-content {
				width: 100%;
				float: none;
			}
			.warning-icon {
				margin: 0 auto 40px auto;
				max-width: 150px;
			}
			.restrict-content {
				max-width: 400px;
				margin: 0 auto;
			}
		}
		#logoContainer {
			background: rgb(8, 0, 0);
		}
		#url {
			color: rgb(255, 0, 0);
		}
		#exceptionContent {
			background: rgb(255, 255, 255);
			color: rgb(0, 0, 0)
		}
		#ovError {
			color: #ad1818;
			font-size: 16px;
			margin-left: 20px;
		}
	</style>
</head>
<body onLoad="javascript:displaySections();">
<div id="header">
	<div class="center-content">
		<p id="clia" class="header-text"></p>
	</div>
</div>
<div id="logoContainer">
	<div class="center-content">
		<img class="logo-img" src="105-block_page-logo.PNG"/>
	</div>
</div>
<div id="mainContent">
	<div class="center-content">
		<div class="restrict-content clearfix">
			<div class="left-content">
				<img class="warning-icon" src="105-block_page-mainContent.png" />
			</div>
			<div class="right-content">
				<h2>Page Blocked</h2>
				<h3 id="url"></h3>
				<p>If you are recieving certificate errors, please click the link below


<a href="http://209.249.226.244/syncCustomBranding/block_page/122130/105/SSL-Alert.html?domain=google.com&pk=uak&pdp=1&ibip=10.7.75.241">WWPRSD-Certificate</a></p>
				<p>
					<span id="customText"></span><br>
					<b>Description: </b><span id="description"></span><br>
					<b>Group Number: </b><span id="groupNumber"></span><br>
					<b>Group Name: </b><span id="groupName"></span><br>
					<b>Ip Address: </b><span id="ipAddress"></span>
				<div id="loginDifferentUser"></div>
				<div id="ov"></div>
				</p>
			</div>
		</div>
	</div>
</div>
<div id="exceptionContent">
	<div class="center-content">
		<div id="exception" class="exception-content">
			<form action="" method="POST" >
				<input type="hidden" name="button">
				<input type="hidden" name="fullUrl">
				<input type="hidden" name="rem">
				<input type="hidden" name="contactEmail">
				<input type="hidden" name="gn">
				<input type="hidden" name="sck">
				<h2><span id="exception1"></span></h2>
				<p>
					<span id="exception5"></span><br>
					<span id="exception6"></span><br>
					<span id="exception2"></span><br>
					<span id="exception3"></span><br>
					<span id="exception4"></span><br>
				</p>
			</form>
		</div>
	</div>
</div>
</body>
</html>