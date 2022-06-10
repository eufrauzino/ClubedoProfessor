<?php

try
{
	//Open database connection
	include './conecta.php';

	//Getting records (listAction)
	if($_GET["action"] == "list")
	{
		//Get record count
		$result = mysql_query("SELECT COUNT(*) AS RecordCount FROM depinativo where depinativo_dep = ".$_GET["id"]);
		$row = mysql_fetch_array($result);
		$recordCount = $row['RecordCount'];

		//Get records from database
		$result = mysql_query("SELECT * FROM depinativo where depinativo_dep = ".$_GET["id"]." ORDER BY " . $_GET["jtSorting"] . " LIMIT " . $_GET["jtStartIndex"] . "," . $_GET["jtPageSize"] . ";");
		
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
            $inicio = implode("-", array_reverse(explode("/", $_POST["depinativo_inicio"] )));
            $fim = implode("-", array_reverse(explode("/", $_POST["depinativo_fim"] )));
		//Insert record into database
		$result = mysql_query("INSERT INTO depinativo(depinativo_motivo,depinativo_inicio,depinativo_fim,depinativo_dep) VALUES('" .$_POST["depinativo_motivo"] ."','".$inicio."','".$fim."',".$_POST["depinativo_dep"].");");
		
		//Get last inserted record (to return to jTable)
		$result = mysql_query("SELECT * FROM depinativo WHERE depinativo_id = LAST_INSERT_ID();");
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
            $inicio = implode("-", array_reverse(explode("/", $_POST["depinativo_inicio"] )));
            $fim = implode("-", array_reverse(explode("/", $_POST["depinativo_fim"] )));
		//Update record in database
		$result = mysql_query("UPDATE depinativo SET depinativo_motivo = '" . $_POST["depinativo_motivo"] . "', depinativo_inicio = '" . $inicio . "',depinativo_fim='".$fim."',depinativo_dep=".$_POST["depinativo_dep"]." WHERE depinativo_id = " . $_POST["depinativo_id"] . ";");

		//Return result to jTable
		$jTableResult = array();
		$jTableResult['Result'] = "OK";
		print json_encode($jTableResult);
	}
	//Deleting a record (deleteAction)
	else if($_GET["action"] == "delete")
	{
		//Delete from database
		$result = mysql_query("DELETE FROM depinativo WHERE depinativo_id = " . $_POST["depinativo_id"] . ";");

		//Return result to jTable
		$jTableResult = array();
		$jTableResult['Result'] = "OK";
		print json_encode($jTableResult);
	}
        else if ($_GET['action'] == 'dep') {   // POPULANDO AS OPCOES          
        $result = mysql_query("SELECT * from dependencia where objeto_id = ".$_GET["id"]);
        $rows = array();
        while ($row = mysql_fetch_array($result)) {
            $eil = array();
            $eil["DisplayText"] = "<b>".$row["objeto_descricao"];
            $eil["Value"] = $row["objeto_id"];
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