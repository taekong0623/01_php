<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-jp">
<title>「お知らせ」情報 入力</title>
<link href="../css/import.css" rel="stylesheet" type="text/css" media="screen, tv, projection" />
<link href="../css/layout_mobile.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div id="container">
<div id="contents">
<div class="separator20"></div>
<div class="heading30">お知らせの登録・修正[モバイル]</div>
<form name="frmNews" method="post" action="mobile_news_c.php">
<table class="list_table" style="text-align:center; margin:0 auto;">
<tr>
<th style="width:100px;">ID</th>
<td style="width:350px;">
<div style="text-align:right; width: 30px;">
{if $intID > 0}{$intID}{else}---{/if}
</div>
</td>
</tr>
<tr>
<th>デバイス</th>
<td>
<input type="radio" class="radio" name="mobileflag" value="0"{if $intMobileFlag == 0} checked="checked"{/if}><label>PC</label>
<input type="radio" class="radio" name="mobileflag" value="1"{if $intMobileFlag == 1} checked="checked"{/if}><label>モバイル</label>
</td>
</tr>
<tr>
<th>表示</th>
<td>
<input type="radio" class="radio" name="position" id="pos_none" value="0"{if $intPosition == 0} checked="checked"{/if}><label for="pos_none">無効</label>
<input type="radio" class="radio" name="position" id="pos_top" value="4"{if $intPosition == 4} checked="c