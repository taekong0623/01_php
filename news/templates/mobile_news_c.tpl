<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-jp">
<title>�֤��Τ餻�׾��� ���ϳ�ǧ</title>
<link href="../css/import.css" rel="stylesheet" type="text/css" media="screen, tv, projection" />
<link href="../css/layout_mobile.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<div id="container">
		<div id="contents">
			<div class="separator20"></div>
			<div class="heading30">���Τ餻����Ͽ������[��Х���]</div>
			<div class="heading20" style="width:90%; margin-left:5%;">ɽ������ץ�</div>
			<div style="text-align:center; margin:0 auto;">
				<div >
					{if ($intErr & 1) == 0}{if $strPrefix != ''}<span style="color:#f00;">{$strPrefix}</span>&nbsp;{/if}<a href="{$strLinkUrl}" target="_blank">{$strMessage}</a>
					{else}<span style="color:red;">Error: ɽ����å�������ɬ�ܹ��ܤǤ�</span>{/if}
					{if ($intErr & 2) > 0}<div style="color:red;">Error: ������ɬ�ܹ��ܤǤ�</div>{/if}
				</div>
			</div>
			<div class="separator20"></div>
			<div class="heading20" style="width:90%; margin-left:5%;">���ϥǡ���</div>
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
					<th>�ǥХ���</th>
					<td>{if $intMobileFlag == 0}PC{elseif $intMobileFlag == 1}��Х���{/if}</td>
				</tr>
				<tr>
					<th>ɽ��</th>
					<td>{if $intPosition == 4}<span class="f-bbs">�Ǽ���</span>{elseif $intPosition == 5}<span class="f-buy-sell">����</span>{elseif $intPosition == 6}<span class="f-rent">����</span>{elseif $intPosition == 7}<span class="f-job">�Ż�</span>{else}<span style="font-weight: bold;">̵��</span>{/if}</td>
				</tr>
				<tr>
					<th>�����Ф�</th>
					<td>{$strPrefix}</td>
				</tr>
				<tr>
					<th>��å�����</th>
					<td>{if ($intErr & 1) == 0}{$strMessage}{else}<div class="input_error">Error: ɽ����å�������ɬ�ܹ��ܤǤ�</div>{/if}</td>
				</tr>
<!--
				<tr>
					<th>�師�Ф�</th>
					<td>{$strPostfix}</td>
				</tr>
-->
				<tr>
					<th>�����URL</th>
					<td>{if ($intErr & 2) == 0}{$strLinkUrl}{else}<div class="input_error">Error: ������ɬ�ܹ��ܤǤ�</div>{/if}</td>
				</tr>
			</table>
			{if $intErr > 0}
			<div align="left" style="color:red;font-size:10pt;margin-left:30px;">
				
			</div>
			{/if}
			<div class="separator20"></div>
			<div class="alignCenter">
				<form name="frmNews" method="post" action="mobile_news_r.php">
				<input type="hidden" name="id" value="{$intID}">
				<input type="hidden" name="mobileflag" value="{$intMobileFlag}">
				<input type="hidden" name="position" value="{$intPosition}">
				<input type="hidden" name="prefix" value="{$strPrefix}">
				<input type="hidden" name="message" value="{$strMessage}">
				<input type="hidden" name="postfix" value="{$strPostfix}">
				<input type="hidden" name="linkurl" value="{$strLinkUrl}">
				<input type="hidden" name="updatetime" value="{$strUpdateTime}">
				<input type="button" value="Back" class="button" onClick="frmBack.submit();">
				{if $intErr == 0}
				<div style="display:inline; margin-left:30px;">
					<input type="submit" value="OK" class="button">
				</div>
				{/if}
				</form>
			</div>
			<form name="frmBack" method="post" action="mobile_news_w.php">
			<input type="hidden" name="id" value="{$intID}">
			<input type="hidden" name="mobileflag" value="{$intMobileFlag}">
			<input type="hidden" name="position" value="{$intPosition}">
			<input type="hidden" name="prefix" value="{$strPrefix}">
			<input type="hidden" name="message" value="{$strMessage}">
			<input type="hidden" name="postfix" value="{$strPostfix}">
			<input type="hidden" name="linkurl" value="{$strLinkUrl}">
			<input type="hidden" name="updatetime" value="{$strUpdateTime}">
			</form>
		</div>
	</div>

</body>
</html>
