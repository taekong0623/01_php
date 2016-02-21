<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-jp">
<title>「お知らせ」情報一覧</title>
<link href="../css/import.css" rel="stylesheet" type="text/css" media="screen, tv, projection" />
<link href="../css/layout_mobile.css" rel="stylesheet" type="text/css" />

{literal}
<script language="javascript" type="text/javascript">
function changeClass (id, name) {
	var obj_a = document.getElementById('row_a' + id);
	var obj_b = document.getElementById('row_b' + id);
	
	if (obj_a) {
		obj_a.className = name;
		obj_b.className = name;
	}
	
	return 0;
}

function execSort (strOrder, strSort) {
	
	document.getElementById('order_id').value = strOrder;
	document.getElementById('sort_id').value = strSort;
	document.getElementById('frmSort').submit();
	
	return 0;
}
</script>
{/literal}
</head>

<body>
<div id="container">
<div id="contents">
<div class="separator20"></div>
<div class="heading30">トップページ お知らせリスト[モバイル]</div>
<div style="margin-left:0px;">
<input type="radio" class="radio" name="mobileflag" id="pos_all" onclick="location.href='news_list.php?mobileflag=-1'"><label for="pos_all">ALL</label>
<input type="radio" class="radio" name="mobileflag" id="pos_PC" onclick="location.href='news_list.php?mobileflag=0'"><label for="pos_PC">PC</label>
<input type="radio" class="radio" name="mobileflag" id="pos_mobile"  checked="checked" onclick="location.href='mobile_news_list.php'"><label for="pos_mobile">モバイル</label>
</div>
<div style="margin-left:0px;">
<input type="button" value="新規作成(モバイル)" class="button_mini" onclick="frmNew.submit();">
</div>
<div class="separator10"></div>
<table class="list_table" style="text-align: center; margin:0 auto;">
<tr>
<th style="width:50px;"><a href="#" style="color:#fd8;" onclick="execSort('ID', '{if $strSort=="ASC"}DESC{else}ASC{/if}')">ID</a></th>
<th style="width:200px;">前見出し</th>
<th style="width:400px;">メッセージ</th>
<th style="width:200px;"><del>後見出し</del></th>
</tr>
<tr>
<th><a href="#" style="color:#fd8;" onclick="execSort('Position', '{if $strSort=="ASC"}DESC{else}ASC{/if}')">表示</a></th>
<th colspan="2">リンク先URL</th>
<th><a href="#" style="color:#fd8;" onclick="execSort('UpdateTime', '{if $strSort=="ASC"}DESC{else}ASC{/if}')">更新日時</th>
</tr>
{foreach item=n name=news from=$arrNews}
<tr id="row_a{$smarty.foreach.news.index}" onMouseOver="changeClass('{$smarty.foreach.news.index}', 'ColorOn');" onMouseOut="changeClass('{$smarty.foreach.news.index}', 'ColorOff{if ($smarty.foreach.news.index % 2) > 0}1{/if}');" OnClick="location.href='mobile_news_w.php?id={$n.ID}&m=1'" class="ColorOff{if ($smarty.foreach.news.index % 2) > 0}1{/if}">
<td style="text-align:right;">{$n.ID}</td>
<td style="text-align:left;">{$n.Prefix}</td>
<td style="text-align:left;">{$n.Message}</td>
<td style="text-align:left;"><del>{$n.Postfix}</del></td>
</tr>
<tr id="row_b{$smarty.foreach.news.index}" onMouseOver="changeClass('{$smarty.foreach.news.index}', 'ColorOn');" onMouseOut="changeClass('{$smarty.foreach.news.index}', 'ColorOff{if ($smarty.foreach.news.index % 2) > 0}1{/if}');" OnClick="location.href='mobile_news_w.php?id={$n.ID}&m=1'"  class="ColorOff{if ($smarty.foreach.news.index % 2) > 0}1{/if}">
<td style="text-align:center;">{if $n.Position == 4}<span class="f-bbs">掲示板</span>{elseif $n.Position == 5}<span class="f-buy-sell">売買</span>{elseif $n.Position == 6}<span class="f-rent">賃貸</span>{elseif $n.Position == 7}<span class="f-job">仕事</span>{else}無効{/if}</td>
<td colspan="2" style="text-align:left;">{$n.LinkURL}</td>
<td style="text-align:center;">{$n.UpdateTime}</td>
</tr>
{foreachelse}
<tr>
<td colspan="5" style="color:red;">データがありません</td>
</tr>
{/foreach}
</table>
</div>
</div>
<form name="frmNew" id="frmNew" method="post" action="mobile_news_w.php">
<input type="hidden" name="id" value="0">
</form>
<form name="frmSort" id="frmSort" method="get" action="mobile_news_list.php">
<input type="hidden" name="srt" id="sort_id" value="">
<input type="hidden" name="odr" id="order_id" value="">
</form>
<div class="separator20"></div>
</body>
</html>
