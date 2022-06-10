<?php

try
{
	//Open database connection
	include './conecta.php';

	//Getting records (listAction)
	if($_GET["action"] == "list")
	{
		//Get record count
		$result = mysql_query("SELECT COUNT(*) AS RecordCount FROM produto;");
		$row = mysql_fetch_array($result);
		$recordCount = $row['RecordCount'];

		//Get records from database
		$result = mysql_query("SELECT * FROM produto ORDER BY " . $_GET["jtSorting"] . " LIMIT " . $_GET["jtStartIndex"] . "," . $_GET["jtPageSize"] . ";");
		
		//Add all records to an array
		$rows = array();
		while($row = mysql_fetch_array($result))
		{
		    $rows[] = $row;
		}

		//Return result to jTable
		$jTableResult = array();
		$jTableResult['Result'] = "OK";
		$jTableResult['TotalRecordCount'] = $recordCount;
		$jTableResult['Records'] = $rows;
		print json_encode($jTableResult);
	}
	//Creating a new record (createAction)
	else if($_GET["action"] == "create")
	{
            
		//Insert record into database
		$result = mysql_query("INSERT INTO produto(produto_descricao,produto_disponivel,produto_valor,produto_estoque,produto_cat_obj) VALUES('" .$_POST["produto_descricao"] ."',".$_POST["produto_disponivel"] .",".$_POST["produto_valor"].",".$_POST["produto_estoque"].",".$_POST["produto_cat_obj"].");");
		
		//Get last inserted record (to return to jTable)
		$result = mysql_query("SELECT * FROM produto WHERE produto_id = LAST_INSERT_ID();");
		$row = mysql_fetch_array($result);

		//Return result to jTable
		$jTableResult = array();
		$jTableResult['Result'] = "OK";
		$jTableResult['Record'] = $row;
		print json_encode($jTableResult);
	}
	//Updating a record (updateAction)
	else if($_GET["action"] == "update")
	{
		//Update record in database
		$result = mysql_query("UPDATE produto SET produto_descricao = '" . $_POST["produto_descricao"] . "', produto_valor = " . $_POST["produto_valor"] . " WHERE produto_id = " . $_POST["produto_id"] . ";");

		//Return result to jTable
		$jTableResult = array();
		$jTableResult['Result'] = "OK";
		print json_encode($jTableResult);
	}
	//Deleting a record (deleteAction)
	else if($_GET["action"] == "delete")
	{
		//Delete from database
		$result = mysql_query("DELETE FROM produto WHERE produto_id = " . $_POST["produto_id"] . ";");

		//Return result to jTable
		$jTableResult = array();
		$jTableResult['Result'] = "OK";
		print json_encode($jTableResult);
	}
        else if ($_GET['action'] == 'cat') {   // POPULANDO AS OPCOES          
        $result = mysql_query("SELECT * from catdependencia");
        $rows = array();
        while ($row = mysql_fetch_array($result)) {
            $eil = array();
            $eil["DisplayText"] = $row["catdep_descricao"];
            $eil["Value"] = $row["catdep_id"];
            $rows[] = $eil;
        }
        $jTableResult = array();
        $jTableResult['Result'] = "OK";
        $jTableResult['Options'] = $rows;
        print json_encode($jTableResult);
    }

	//Close database connection
	mysql_close($con);

}
catch(Exception $ex)
{
    //Return error message
	$jTableResult = array();
	$jTableResult['Result'] = "ERROR";
	$jTableResult['Message'] = $ex->getMessage();
	print json_encode($jTableResult);
}
	
?>