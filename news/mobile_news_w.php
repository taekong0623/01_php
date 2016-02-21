<?php
/**
 * News/input page (for smartphone)
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
require_once('../classes/news_master.class.php');


/**
 * request parameters
 */
$intMode				= 0;
$intID					= 0;
$intMobileFlag		= 0;
$intPosition		= 0;
$strPrefix			= '';
$strPostfix			= '';
$strMessage			= '';
$strLinkUrl			= '';
$strUpdateTime	= '';


/**
 * getting POST/GET parameters
 */
$intMode				= getRequest("m", 0);
$intID					= getRequest("id", 0);
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

if (($intMode > 0) && ($intID > 0)) {
	$objNews = new clsMasterNews();
	$objNews->intID = $intID;
	$objNews->intPosition = clsMasterNews::POSITION_ALL;
	$mixRet = $objNews->getData($arrNews);
	
	if ($mixRet) {
		$intMobileFlag = $arrNews['MobileFlag'];
		$intPosition = $arrNews['Position'];
		$strPrefix = $arrNews['Prefix'];
		$strPostfix = $arrNews['Postfix'];
		$strMessage = $arrNews['Message'];
		$strLinkUrl = $arrNews['LinkURL'];
		$strUpdateTime = $arrNews['UpdateTime'];
	} else {
		redirectUrl('index.html');
	}
}


/**
 * output
 */
$smarty->assign('arrNews', $arrNews);
$smarty->assign("intID",$intID);
$smarty->assign("intMobileFlag", $intMobileFlag);
$smarty->assign("intPosition", $intPosition);
$smarty->assign("strPrefix", $strPrefix);
$smarty->assign("strPostfix", $strPostfix);
$smarty->assign("strMessage", $strMessage);
$smarty->assign("strLinkUrl", $strLinkUrl);
$smarty->assign("strUpdateTime", $strUpdateTime);

$smarty->display("mobile_news_w.tpl");


// End Of Source
?>
