<?php
/**
 * News/list page (for smartphone)
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
$objNews		= null;
$arrNews		= array();
$strOrder		= '';
$strSort		= '';


/**
 * getting POST/GET parameters
 */
$strOrder		= getRequest('odr', 'ID');
$strSort		= getRequest('srt', 'DESC');


/**
 * start functions
 */
// check login
$blnLogin = checkLogin();
if ($blnLogin == false) {
	redirectUrl("index.html?err=chklogin");
}

// get data from database
$objNews = new clsMasterNews();
$objNews->intPosition = clsMasterNews::POSITION_ALL;
$objNews->intMobileFlag = clsMasterNews::MOBILE_FLAG_ON;
switch ($strOrder) {
	case 'ID':
		$objNews->intOrder = clsMasterNews::ORDER_ID;
		break;
	case 'Position':
		$objNews->intOrder = clsMasterNews::ORDER_POSITION;
		break;
	case 'UpdateTime':
		$objNews->intOrder = clsMasterNews::ORDER_UPDATED;
		break;
}
if (($strSort == 'ASC') || ($strSort == 'DESC')) {
	$objNews->strSort = $strSort;
}
$mixRet = $objNews->getData($arrNews);

/**
 * output
 */
$smarty->assign('arrNews', $arrNews);
$smarty->assign('strOrder', $strOrder);
$smarty->assign('strSort', $strSort);

$smarty->display("mobile_news_list.tpl");


//var_dump($objNews->strLastSql);

// End Of Source
?>
