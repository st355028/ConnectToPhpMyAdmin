<?php

	include "Test_Config.php";

	//設定要被讀取的table
	$table = 'ShoppingInfo';

	//分別設置變數來接收相對應的值（最後一筆）
	$account = $db->query("select account from $table  order by id desc")->fetchColumn(0);
	$cost = $db->query("select cost from $table   order by id desc ")->fetchColumn(0);
	$notes = $db->query("select notes from $table  order by id desc  ")->fetchColumn(0);
	$money = $db->query("select money from $table   order by id desc ")->fetchColumn(0);


	// $rtn = array(		
	// 				"account"=> $db->query("select account from $table")->fetchColumn(0),
	// 				"cost"=> $db->query("select cost from $table")->fetchColumn(0),		
	// 				"money"=> $db->query("select money from $table")->fetchColumn(0),							 							 					 
	// 				"notes"=> $db->query("select notes from $table")->fetchColumn(0)
	// );

	//分別將值存入陣列中
	$rtn['account'] = $account;
	$rtn['cost'] = $cost;
	$rtn['notes'] = $notes;
	$rtn['money'] = $money;

	
	//對陣列進行編碼成Json格式
	$rtn = json_encode($rtn);

	//丟給程式接收
	echo $rtn;

?>