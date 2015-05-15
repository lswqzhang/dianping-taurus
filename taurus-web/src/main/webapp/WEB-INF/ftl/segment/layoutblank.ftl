<#macro page title bodystyle>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<link rel="shortcut icon" href="http://mp.weixin.qq.com/favicon.ico" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
	<meta name="apple-mobile-web-app-capable" content="yes" /> 
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<title>${title?html}</title>
</head>
<body class="${bodystyle?html}">
	<#nested/>
</body>
</html>
</#macro>