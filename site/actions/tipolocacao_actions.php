<?php

try
{
	//Open database connection
	include './conecta.php';

	//Getting records (listAction)
	if($_GET["action"] == "list")
	{
		//Get record count
		$result = mysql_query("SELECT COUNT(*) AS RecordCount FROM tipolocacao;");
		$row = mysql_fetch_array($result);
		$recordCount = $row['RecordCount'];

		//Get records from database
		$result = mysql_query("SELECT * FROM tipolocacao ORDER BY " . $_GET["jtSorting"] . " LIMIT " . $_GET["jtStartIndex"] . "," . $_GET["jtPageSize"] . ";");
		
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
		$result = mysql_query("INSERT INTO tipolocacao(obj_tipo_descricao,obj_tipo_valor,obj_tipo_obj,obj_tipo_grauloc,obj_tipo_evento) "
                        . "VALUES('" .$_POST["obj_tipo_descricao"] ."',".$_POST["obj_tipo_valor"] .",".$_POST["obj_tipo_obj"] .",".$_POST["obj_tipo_grauloc"].",".$_POST["obj_tipo_evento"].");");
		
		//Get last inserted record (to return to jTable)
		$result = mysql_query("SELECT * FROM tipolocacao WHERE obj_tipo_id = LAST_INSERT_ID();");
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
		$result = mysql_query("UPDATE tipolocacao SET obj_tipo_descricao = '" . $_POST["obj_tipo_descricao"] . "', obj_tipo_valor = " . $_POST["obj_tipo_valor"] . ",obj_tipo_obj = ".$_POST["obj_tipo_obj"].", obj_tipo_grauloc =".$_POST["obj_tipo_grauloc"].",obj_tipo_evento =".$_POST["obj_tipo_evento"].""
                        . "  WHERE obj_tipo_id = " . $_POST["obj_tipo_id"] . ";");

		//Return result to jTable
		$jTableResult = array();
		$jTableResult['Result'] = "OK";
		print json_encode($jTableResult);
	}
	//Deleting a record (deleteAction)
	else if($_GET["action"] == "delete")
	{
		//Delete from database
		$result = mysql_query("DELETE FROM tipolocacao WHERE obj_tipo_id = " . $_POST["obj_tipo_id"] . ";");

		//Return result to jTable
		$jTableResult = array();
		$jTableResult['Result'] = "OK";
		print json_encode($jTableResult);
	}
        else if ($_GET['action'] == 'nivel') {   // POPULANDO AS OPCOES          
        $result = mysql_query("SELECT * from grauloc ");
        $rows = array();
        while ($row = mysql_fetch_array($result)) {
            $eil = array();
            $eil["DisplayText"] = $row["grauloc_descricao"];
            $eil["Value"] = $row["grauloc_id"];
            $rows[] = $eil;
        }
        $jTableResult = array();
        $jTableResult['Result'] = "OK";
        $jTableResult['Options'] = $rows;
        print json_encode($jTableResult);
    }
        else if ($_GET['action'] == 'evento') {   // POPULANDO AS OPCOES          
        $result = mysql_query("SELECT * from evento ");
        $rows = array();
        while ($row = mysql_fetch_array($result)) {
            $eil = array();
            $eil["DisplayText"] = $row["evento_descricao"];
            $eil["Value"] = $row["evento_id"];
            $rows[] = $eil;
        }
        $jTableResult = array();
        $jTableResult['Result'] = "OK";
        $jTableResult['Options'] = $rows;
        print json_encode($jTableResult);
    }
        else if ($_GET['action'] == 'dependencia') {   // POPULANDO AS OPCOES          
        $result = mysql_query("SELECT * from dependencia ");
        $rows = array();
        while ($row = mysql_fetch_array($result)) {
            $eil = array();
            $eil["DisplayText"] = $row["objeto_descricao"];
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