<?php

try
{
	//Open database connection
	include './conecta.php';
	//Getting records (listAction)
	if($_GET["action"] == "list")
	{
            $mes = $_GET['mes'];
		//Get record count
		 $result = mysql_query("SELECT COUNT(*) AS RecordCount FROM socio as s INNER JOIN pagmensalidade as p on s.socio_id = p.pag_mens_socio INNER JOIN mespagamento AS m ON m.mespag_id = p.pag_mens_mes WHERE m.mespag_id =".$mes);
        $row = mysql_fetch_array($result);
        $recordCount = $row['RecordCount'];
                
//                $result = mysql_query("SELECT a.pag_mens_id,a.pag_mens_data,a.pag_mens_status,a.pag_mens_valor,a.pag_mens_socio,
//                    a.pag_mens_mes, b.socio_id,b.socio_acao,b.socio_nome 
//                    from pagmensalidade a 
//                    INNER JOIN socio b ON 
//                    (a.pag_mens_socio = b.socio_id)");
		
		//Get records from database
		$result = mysql_query("SELECT socio_id,socio_acao,socio_nome,pag_mens_id,pag_mens_status,pag_mens_valor,pag_mens_socio, mespag_id from socio as s
                    INNER JOIN pagmensalidade AS p ON s.socio_id = p.pag_mens_socio 
                    INNER JOIN mespagamento AS m ON m.mespag_id = p.pag_mens_mes WHERE m.mespag_id =".$mes." AND p.pag_mens_status = 0 ORDER BY " . $_GET["jtSorting"] . " LIMIT " . $_GET["jtStartIndex"] . "," . $_GET["jtPageSize"] . ";");
		
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
	
	//Updating a record (updateAction)
	else if($_GET["action"] == "update")
	{
		//Update record in database
		$result = mysql_query("UPDATE pagmensalidade SET pag_mens_status = " . $_POST["pag_mens_status"] . " WHERE pag_mens_id = " . $_POST["pag_mens_id"] . ";");
                
                 $dia = date('d');
                 $mes = date('m');
                 $ano = date('Y');
                 $valor=$_POST['pag_mens_valor'];
                 $socio=$_POST['socio_nome'];
                 mysql_query("INSERT INTO lc_movimento (dia,mes,ano,tipo,descricao,valor,cat) values ('$dia','$mes','$ano','1','Mensalidade $socio ',$valor,'2')"); // INSERIDO REGISTRO NO CAIXA EXTERNO
		
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