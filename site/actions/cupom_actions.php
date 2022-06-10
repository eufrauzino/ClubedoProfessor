<?php

try
{
	//Open database connection
	include './conecta.php';

	//Getting records (listAction)
	if($_GET["action"] == "list")
	{
		//Get record count
            
		$result = mysql_query("SELECT COUNT(*) AS RecordCount FROM cupom where cupom_valor>0 AND cupom_socio =".$_GET['socio']);
		$row = mysql_fetch_array($result);
		$recordCount = $row['RecordCount'];

		//Get records from database
		$result = mysql_query("SELECT * FROM cupom  where cupom_valor>0 AND cupom_socio =".$_GET['socio']." ORDER BY " . $_GET["jtSorting"] . " LIMIT " . $_GET["jtStartIndex"] . "," . $_GET["jtPageSize"] . ";");
		
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
        
        
        else if($_GET["action"] == "listitemcupom"){
            $locacao=$_GET['locacao'];
            $result = mysql_query("SELECT * FROM itemcupom AS i INNER JOIN cupom  AS c ON i.itemcupom_cupom=c.cupom_id where itemcupom_locacao =".$locacao);		
		
		      //Add all records to an array
        $rows = array();
        while ($row = mysql_fetch_array($result)) {
            $rows[] = $row;
        }

        //Return result to jTable
        $jTableResult = array();
        $jTableResult['Result'] = "OK";
        $jTableResult['Records'] = $rows;
        print json_encode($jTableResult);
        }

	//Updating a record (updateAction)
	else if($_GET["action"] == "update")
        {
            $cupom_id = $_POST["cupom_id"];
            $valorCupom = $_POST["cupom_valor"];
            $locacao=$_GET["locacao"];
            
            $t = mysql_query("select locacao_total from locacao where locacao_id =" . $locacao);
            $totalLocacao = mysql_result($t, 0,"locacao_total");
            if($totalLocacao>$valorCupom){
                $totalLocacao = $totalLocacao - $valorCupom;
                $resto = $valorCupom;
                $valorCupom = 0;
                mysql_query("UPDATE locacao SET locacao_formapag='cupom e dinheiro ou cheque' WHERE locacao_id = " . $locacao . ";");
            }
            else if ($totalLocacao<$valorCupom){
                $valorCupom = $valorCupom - $totalLocacao;
                $resto = $totalLocacao;
                $totalLocacao = 0;
                mysql_query("UPDATE locacao SET locacao_formapag='cupom' WHERE locacao_id = " . $locacao . ";");
                
            }            
            else {
                $totalLocacao = $totalLocacao - $valorCupom;
                $resto = $valorCupom;
                $valorCupom = 0;
                $totalLocacao = 0;
                mysql_query("UPDATE locacao SET locacao_formapag='cupom' WHERE locacao_id = " . $locacao . ";");
            }
            
                mysql_query("INSERT INTO itemcupom (itemcupom_cupom, itemcupom_locacao, itemcupom_valor) VALUES ('$cupom_id', '$locacao', '$resto');");
		//Update record in database
                mysql_query("UPDATE locacao SET locacao_pago =  2, locacao_total =" . $totalLocacao . " WHERE locacao_id = " . $locacao . ";");
                if($valorCupom == 0){
		   $result = mysql_query("UPDATE cupom SET cupom_valor = " . $valorCupom.", cupom_usado = 1 WHERE cupom_id = " . $cupom_id . ";");
                    
                }
                else {
                   $result = mysql_query("UPDATE cupom SET cupom_valor = " . $valorCupom." WHERE cupom_id = " . $cupom_id . ";");
                }
                
		//Return result to jTable
		$jTableResult = array();
		$jTableResult['Result'] = "OK";
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