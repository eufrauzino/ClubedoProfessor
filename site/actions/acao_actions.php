<?php

try {
   
    //Open database connection
    include './conecta.php';
    //Getting records (listAction)
    if ($_GET["action"] == "list") {
        //Get record count
        $result = mysql_query("SELECT COUNT(*) AS RecordCount FROM acao;");
        $row = mysql_fetch_array($result);
        $recordCount = $row['RecordCount'];

        //Get records from database
        $result = mysql_query("SELECT * FROM acao ORDER BY " . $_GET["jtSorting"] . " LIMIT " . $_GET["jtStartIndex"] . "," . $_GET["jtPageSize"] . ";");

        //Add all records to an array
        $rows = array();
        while ($row = mysql_fetch_array($result)) {
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
    else if ($_GET["action"] == "create") {
      
      
        //Insert record into database
        $result = mysql_query("INSERT INTO acao(acao_id,acao_data, acao_socioant,acao_obs,acao_atualizacao,acao_cat_acao,acao_tipo) VALUES(" . $_POST["acao_id"] . ",'".$_POST["acao_data"]."','" . $_POST["acao_socioant"] . "','" . $_POST["acao_obs"] . "',now(),".$_POST["acao_cat_acao"].",".$_POST["acao_tipo"].");");

        //Get last inserted record (to return to jTable)
        $result = mysql_query("SELECT max(acao_id) as acao_id FROM acao");  // PEGANDO O ULTIMO ID INSERIDO QUANDO NAO É AUTO INCREMENT
		$row = mysql_fetch_array($result);

		//Return result to jTable
		$jTableResult = array();
		$jTableResult['Result'] = "OK";
		$jTableResult['Record'] = $row;
		print json_encode($jTableResult);
    }
    //Updating a record (updateAction)
    else if ($_GET["action"] == "update") {
        //Update record in database
        $result = mysql_query("UPDATE acao SET acao_id = " . $_POST["acao_id"] . ", acao_data = '" . $_POST["acao_data"] ."', acao_socioant = '" . $_POST["acao_socioant"] .
                "', acao_obs = '" . $_POST["acao_obs"] ."', acao_atualizacao = '" . $_POST["acao_atualizacao"] ."', acao_cat_acao = " . $_POST["acao_cat_acao"] .",acao_tipo =".$_POST["acao_tipo"]." WHERE acao_id = " . $_POST["acao_id"]. ";");

        //Return result to jTable
        $jTableResult = array();
        $jTableResult['Result'] = "OK";
        print json_encode($jTableResult);
    }
    //Deleting a record (deleteAction)
    else if ($_GET["action"] == "delete") {
        //Delete from database
        $result = mysql_query("DELETE FROM acao WHERE acao_id = " . $_POST["acao_id"] . ";");

        //Return result to jTable
        $jTableResult = array();
        $jTableResult['Result'] = "OK";
        print json_encode($jTableResult);
    }
    
        else if ($_GET['action'] == 'cat_acao') {   // POPULANDO AS OPCOES  
        $result = mysql_query("SELECT * from catacao");
        $rows = array();
        while ($row = mysql_fetch_array($result)) {
            $eil = array();
            $eil["DisplayText"] = $row["cat_acao_descricao"];
            $eil["Value"] = $row["cat_acao_id"];
            $rows[] = $eil;
        }
        $jTableResult = array();
        $jTableResult['Result'] = "OK";
        $jTableResult['Options'] = $rows;
        print json_encode($jTableResult);
    }


    //Close database connection
    
    mysql_close($con);
} catch (Exception $ex) {
    //Return error message
    $jTableResult = array();
    $jTableResult['Result'] = "ERROR";
    $jTableResult['Message'] = $ex->getMessage();
    print json_encode($jTableResult);
}


?>