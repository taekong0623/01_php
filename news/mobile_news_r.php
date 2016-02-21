<?php
/**
 * News/complete page (for smartphone)
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
$intID					= 0;
$intMobileFlag		= 0;
$intPosition		= 0;
$strPrefix			= '';
$strPostfix			= '';
$strMessage			= '';
$strLinkUrl			= '';
$strUpdateTime	= '';

$objNews			= null;
$arrReg				= array();

/**
 * getting POST/GET parameters
 */
$intID					= getPost("id", 0);
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

/*--- store data into database ---*/
// create instance
$objNews = new clsMasterNews();
$objNews->intFetchType = MYSQL_ASSOC;
if ($intID) {
	$objNews->intID = $intID;
}

// set data before to store
$arrReg["MobileFlag"] = $intMobileFlag;
$arrReg["Position"] = $intPosition;
$arrReg["Prefix"] = $objNews->escapeStrings($strPrefix);
$arrReg["Postfix"] = $objNews->escapeStrings($strPostfix);
$arrReg["Message"] = $objNews->escapeStrings($strMessage);
$arrReg["LinkURL"] = $objNews->escapeStrings($strLinkUrl);
// execute
$blnRet = $objNews->setData($arrReg);


/**
 * output
 */
if ($blnRet) {
	redirectUrl('mobile_news_list.php');
} else {
	$smarty->assign("intWr", 1);
	
	$smarty->assign("intID", $intID);
	$smarty->assign("intMobileFlag", $intMobileFlag);
	$smarty->assign("intPosition", $intPosition);
	$smarty->assign("strPrefix", $strPrefix);
	$smarty->assign("strPostfix", $strPostfix);
	$smarty->assign("strMessage", $strMessage);
	$smarty->assign("strLinkUrl", $strLinkUrl);

	$smarty->display("mobile_news_c.tpl");
}



// End Of Source
?>
