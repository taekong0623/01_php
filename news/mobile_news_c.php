<?php
/**
 * News/confirm page (for smartphone)
 * 
 * @category News
 * @version  2016/02/16 created
 */

/**
 * include files
 */
require_once('../inc/cmn.inc');
require_once('../inc/smarty.inc');
require_once('../inc/function.inc');


/**
 * request parameters
 */
$intID					= 0;
$intMobileFlag		= 0;
$intPosition		= 0;
$strPrefix			= '';
$strPostfix			= '';
$strMessage			= '';
$strLinkUrl			= '';
$strUpdateTime	= '';
$intErr					= 0;


/**
 * getting POST/GET parameters
 */
$intID					= getPost("id");
$intMobileFlag		= getPost('mobileflag', 1);
$intPosition		= getPost('position');
$strPrefix			= getPost("prefix");
$strPostfix			= getPost("postfix");
$strMessage			= getPost("message");
$strLinkUrl			= getPost('linkurl');
$strUpdateTime	= getPost('updatetime');

/**
 * start functions
 */
// check login
$blnLogin = checkLogin();
if ($blnLogin == false) {
	redirectUrl("index.html");
}

// check parameter:Message
if (is_null($strMessage) || (trim($strMessage) == '')) {
	$intErr += 1;
}

// check parameter:Link
if (is_null($strLinkUrl) || (trim($strLinkUrl) == '')) {
	$intErr += 2;
}


/**
 * output
 */
$smarty->assign("intErr", $intErr);
$smarty->assign("intWr", 0);

$smarty->assign("intID", $intID);
$smarty->assign("intMobileFlag", $intMobileFlag);
$smarty->assign("intPosition", $intPosition);
$smarty->assign("strPrefix", $strPrefix);
$smarty->assign("strPostfix", $strPostfix);
$smarty->assign("strMessage", $strMessage);
$smarty->assign("strLinkUrl", $strLinkUrl);
$smarty->assign("strUpdateTime", $strUpdateTime);

$smarty->display("mobile_news_c.tpl");



// End Of Source
?>
