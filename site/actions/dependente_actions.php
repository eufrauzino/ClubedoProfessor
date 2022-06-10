<?php

try {
   
    //Open database connection
   include './conecta.php';
     
    //Getting records (listAction)
       if ($_GET["action"] == "list") {
        
        $socio = $_GET['socio_id']; 
        //Get records from database
        $result = mysql_query(" SELECT * FROM dependente  where dependente_socio = " . $socio);

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
    
    

    
    //Creating a new record (createAction)
    else if ($_GET["action"] == "create") {
      
      
        //Insert record into database
        $result = mysql_query("INSERT INTO dependente(dependente_id,dependente_data, dependente_dependenteant,dependente_obs,dependente_atualizdependente,dependente_cat_dependente) VALUES(" . $_POST["dependente_id"] . " , '" .
                $_POST["dependente_data"] . "','" . $_POST["dependente_dependenteant"] . "','" . $_POST["dependente_obs"] . "','" . $_POST["dependente_atualizdependente"] . "',".$_POST["dependente_cat_dependente"].");");

        //Get last inserted record (to return to jTable)
        $result = mysql_query("SELECT max(dependente_id) as dependente_id FROM dependente");  // PEGANDO O ULTIMO ID INSERIDO QUANDO NAO É AUTO INCREMENT
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
        $result = mysql_query("UPDATE dependente SET dependente_id = " . $_POST["dependente_id"] . ", dependente_data = '" . $_POST["dependente_data"] ."', dependente_dependenteant = '" . $_POST["dependente_dependenteant"] .
                "', dependente_obs = '" . $_POST["dependente_obs"] ."', dependente_atualizdependente = '" . $_POST["dependente_atualizdependente"] ."', dependente_cat_dependente = " . $_POST["dependente_cat_dependente"] ." WHERE dependente_id = " . $_POST["dependente_id"]. ";");

        //Return result to jTable
        $jTableResult = array();
        $jTableResult['Result'] = "OK";
        print json_encode($jTableResult);
    }
    //Deleting a record (deleteAction)
    else if ($_GET["action"] == "delete") {
        //Delete from database
        $result = mysql_query("DELETE FROM dependente WHERE dependente_id = " . $_POST["dependente_id"] . ";");

        //Return result to jTable
        $jTableResult = array();
        $jTableResult['Result'] = "OK";
        print json_encode($jTableResult);
    }
    
      
        else if ($_GET['action'] == 'parente') {   // POPULANDO AS OPCOES  
        $result = mysql_query("SELECT * from parentesco");
        $rows = array();
        while ($row = mysql_fetch_array($result)) {
            $eil = array();
            $eil["DisplayText"] = $row["parentesco_descricao"];
            $eil["Value"] = $row["parentesco_id"];
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