<%@page pageEncoding="UTF-8" contentType="text/html; charset=utf-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>欢迎访问中国国际人才网</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;	
}
table{	
	width:90%;
	font-size:12px;
	text-align:center;
	margin:auto;
}
input { font-size:12px}
td{
	border-left:none;
	border-right:none;
	border-top:none;
	border-bottom:1px solid #000000
}
-->
</style>
<script>
function setValue(value)
{	
	var searchText=document.getElementById("searchText");	
	searchText.value=value;
}
</script>
</head>
<body>
<br/>
<form action="/" method="post">
  <table cellpadding="0px" cellspacing="0px">
    <tr>
      <td style="width:20%; text-align:right; border:none; font-size:18px; font-weight:bold">找人才</td>
      <td style="width:50%; text-align:center; border:none"><input id="searchText" name="searchText" style="width:100%;"/></td>
      <td style="width:30%; text-align:left; border:none"><input type="submit" value="搜索"></td>
    </tr>
    <tr>
      <td style="width:20%; text-align:right; border:none">&nbsp;</td>
      <td style="width:50%; text-align:left; border:none">常招岗位: <a href="#" onClick="javascript:setValue('酒店服务员');">酒店服务员</a> <a href="#" onClick="javascript:setValue('前台');">前台</a> <a href="#" onClick="javascript:setValue('资客');">资客</a> </td>
      <td style="width:30%; text-align:left; border:none">&nbsp;</td>
    </tr>
  </table>
</form>
<table>
  <tr>
    <td style="width:20%; text-align:right">姓名:</td>
    <td style="text-align:left">王小妹</td>
  </tr>
  <tr>
    <td style="width:20%; text-align:right">求职岗位:</td>
    <td style="text-align:left">酒店服务员,前台,资客</td>
  </tr>
  <tr>
    <td style="width:20%; text-align:right">自我介绍:</td>
    <td style="text-align:left">本人心地好,爱笑，能吃苦耐劳</td>
  </tr>
  <tr>
    <td style="width:20%; text-align:right">&nbsp;</td>
    <td style="text-align:left"><a href="/publics/details/1" target="_blank">查看详情</a></td>
  </tr>
</table>
<table>
  <tr>
    <td style="width:20%; text-align:right">姓名:</td>
    <td style="text-align:left">王小妹</td>
  </tr>
  <tr>
    <td style="width:20%; text-align:right">求职岗位:</td>
    <td style="text-align:left">酒店服务员,前台,资客</td>
  </tr>
  <tr>
    <td style="width:20%; text-align:right">自我介绍:</td>
    <td style="text-align:left">本人心地好,爱笑，能吃苦耐劳</td>
  </tr>
  <tr>
    <td style="width:20%; text-align:right">&nbsp;</td>
    <td style="text-align:left"><a href="/publics/details/1" target="_blank">查看详情</a></td>
  </tr>
</table>
<table>
  <tr>
    <td style="width:20%; text-align:right">姓名:</td>
    <td style="text-align:left">王小妹</td>
  </tr>
  <tr>
    <td style="width:20%; text-align:right">求职岗位:</td>
    <td style="text-align:left">酒店服务员,前台,资客</td>
  </tr>
  <tr>
    <td style="width:20%; text-align:right">自我介绍:</td>
    <td style="text-align:left">本人心地好,爱笑，能吃苦耐劳</td>
  </tr>
  <tr>
    <td style="width:20%; text-align:right">&nbsp;</td>
    <td style="text-align:left"><a href="/publics/details/1" target="_blank">查看详情</a></td>
  </tr>
</table>

</body>
</html>
