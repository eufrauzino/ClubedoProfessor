<?php

try
{
	//Open database connection
	include './conecta.php';

	//Getting records (listAction)
	if($_GET["action"] == "list")
	{
		//Get record count
		$result = mysql_query("SELECT COUNT(*) AS RecordCount FROM exame where exame_socio =".$_GET["id"]);
		$row = mysql_fetch_array($result);
		$recordCount = $row['RecordCount'];

		//Get records from database
		$result = mysql_query("SELECT * FROM exame where exame_socio =".$_GET["id"]." ORDER BY " . $_GET["jtSorting"] . " LIMIT " . $_GET["jtStartIndex"] . "," . $_GET["jtPageSize"] . ";");
		
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
		$result = mysql_query("INSERT INTO exame(exame_validade,exame_medico,exame_socio) VALUES('" .$_POST["exame_validade"] ."','".$_POST["exame_medico"] ."',".$_POST["exame_socio"].")");
		
		//Get last inserted record (to return to jTable)
		$result = mysql_query("SELECT * FROM exame WHERE exame_id = LAST_INSERT_ID();");
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
		$result = mysql_query("UPDATE exame SET exame_descricao = '" . $_POST["exame_descricao"] . "', exame_valor = " . $_POST["exame_valor"] . " WHERE exame_id = " . $_POST["exame_id"] . ";");

		//Return result to jTable
		$jTableResult = array();
		$jTableResult['Result'] = "OK";
		print json_encode($jTableResult);
	}
	//Deleting a record (deleteAction)
	else if($_GET["action"] == "delete")
	{
		//Delete from database
		$result = mysql_query("DELETE FROM exame WHERE exame_id = " . $_POST["exame_id"] . ";");

		//Return result to jTable
		$jTableResult = array();
		$jTableResult['Result'] = "OK";
		print json_encode($jTableResult);
	}
        else if ($_GET['action'] == 'socio') {   // POPULANDO AS OPCOES          
        $result = mysql_query("SELECT socio_id,socio_nome from socio where socio_id=".$_GET["id"]);
        $rows = array();
        while ($row = mysql_fetch_array($result)) {
            $eil = array();
            $eil["DisplayText"] = $row["socio_nome"];
            $eil["Value"] = $row["socio_id"];
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