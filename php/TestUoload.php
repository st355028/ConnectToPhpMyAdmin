 <?php 
 	include "Test_Config.php";

 	 //設定要被讀取的table
 	 $table = 'ShoppingInfo';

 	 //從程式傳來的值分別取出並存放在各個變數中
 	 $account = $_GET['user_account'];
 	 $cost = $_GET['user_cost'];
 	 $money = $_GET['user_money'];
 	 $notes = $_GET['user_notes'];

 	 //將資料存入到資料庫
 	 $db->query("insert into $table(account,cost,money,notes) values ('$account','$cost','$money','$notes')")
 
 ?>	





	// if($db->query("insert into $table(account,cost,money,notes) values ('$account','$cost','$money','$notes')"))
	//  	{

	// 		 $id=$db->query("select id from $table where name='$testName' order by id desc")->fetchColumn(0);

	// 		 $rtn['Status'] = "UPDATESUCCESS";
	// 		 $rtn['id'] = $id;
	// 		 $rtn["result"] = true;
	// }
			 	
			

		
 