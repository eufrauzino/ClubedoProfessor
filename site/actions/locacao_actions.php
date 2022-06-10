<?php

try
{
	//Open database connection
	include './conecta.php';
	//Getting records (listAction)
	if($_GET["action"] == "list")
	{
		//Get record count
		$result = mysql_query("SELECT COUNT(*) AS RecordCount FROM locacao");
		$row = mysql_fetch_array($result);
		$recordCount = $row['RecordCount'];

		//Get records from database
		$result = mysql_query("SELECT * FROM locacao ORDER BY " . $_GET["jtSorting"] . " LIMIT " . $_GET["jtStartIndex"] . "," . $_GET["jtPageSize"] . ";");
		
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
		$result = mysql_query("INSERT INTO catsocio(cat_socio_descricao,cat_socio_mensalidade) VALUES('" .$_POST["cat_socio_descricao"] . "', " .$_POST["cat_socio_mensalidade"] .");");
		
		//Get last inserted record (to return to jTable)
		$result = mysql_query("SELECT * FROM catsocio WHERE cat_socio_id = LAST_INSERT_ID();");
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
		$result = mysql_query("UPDATE catsocio SET cat_socio_descricao = '" . $_POST["cat_socio_descricao"] . "', cat_socio_mensalidade = " . $_POST["cat_socio_mensalidade"] . " WHERE cat_socio_id = " . $_POST["cat_socio_id"] . ";");

		//Return result to jTable
		$jTableResult = array();
		$jTableResult['Result'] = "OK";
		print json_encode($jTableResult);
	}
	//Deleting a record (deleteAction)
	else if($_GET["action"] == "delete")
	{
		//Delete from database
		$result = mysql_query("DELETE FROM catsocio WHERE cat_socio_id = " . $_POST["cat_socio_id"] . ";");

		//Return result to jTable
		$jTableResult = array();
		$jTableResult['Result'] = "OK";
		print json_encode($jTableResult);
	}
        
         else if ($_GET['action'] == 'mensalidade') {   // POPULANDO AS OPCOES  
        $result = mysql_query("SELECT * from mensalidade");
        $rows = array();
        while ($row = mysql_fetch_array($result)) {
            $eil = array();
            $eil["DisplayText"] = $row["mensalidade_descricao"]." R$ ".$row["mensalidade_valor"];
            $eil["Value"] = $row["mensalidade_id"];
            $rows[] = $eil;
        }
        $jTableResult = array();
        $jTableResult['Result'] = "OK";
        $jTableResult['Options'] = $rows;
        print json_encode($jTableResult);
    }
    
    else if($_GET['action'] == 'cancelar'){
        $loc = $_GET['locacao'];
        $locacao_pago=$_GET['locacao_pago'];
        $valor=$_GET['valor'];
        $socio=$_GET['socio'];
        if($locacao_pago==1){
             mysql_query("INSERT INTO cupom(cupom_valor,cupom_socio,cupom_data,cupom_usado) VALUES($valor,$socio,now(),0);");
        }
        mysql_query("DELETE FROM itemlocacao WHERE itemobj_locacao = " . $loc . ";");
        $result = mysql_query("DELETE FROM locacao WHERE locacao_id = " . $loc . ";");
		//Return result to jTable
        $jTableResult = array();
		$jTableResult['Result'] = "OK";
		print json_encode($jTableResult);
       if($locacao_pago==0){        
          header("Location: ../index.php?tabela=locacao");       
       }
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