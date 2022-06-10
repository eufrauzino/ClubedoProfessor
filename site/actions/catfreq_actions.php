<?php

try {

    //Open database connection
    include './conecta.php';

    //Getting records (listAction)
    if ($_GET["action"] == "list") {
        //Get record count
//        $result = mysql_query("SELECT COUNT(*) AS RecordCount FROM catfreq;");
//        $row = mysql_fetch_array($result);
//        $recordCount = $row['RecordCount'];
//
//        //Get records from database
//        $result = mysql_query("SELECT * FROM catfreq ORDER BY " . $_GET["jtSorting"] . " LIMIT " . $_GET["jtStartIndex"] . "," . $_GET["jtPageSize"] . ";");
//
//        //Add all records to an array
//        $rows = array();
//        while ($row = mysql_fetch_array($result)) {
//            $rows[] = $row;
//        }


        if (empty($_POST['pesquisa'])) {
            $pesquisa = NULL;

            // Get record count
            $result = mysql_query("SELECT COUNT(*) AS RecordCount FROM catfreq;");
            $row = mysql_fetch_array($result);
            $recordCount = $row['RecordCount'];

            //Get records from database
            $result = mysql_query("SELECT * FROM catfreq ORDER BY " . $_GET["jtSorting"] . " LIMIT " . $_GET["jtStartIndex"] . "," . $_GET["jtPageSize"] . ";");
        }


        //FILTER
        else {
            $pesquisa = mysql_real_escape_string($_POST['pesquisa']);
            $result = mysql_query("SELECT COUNT(*) AS RecordCount FROM catfreq WHERE catfreq_descricao LIKE '%" . $pesquisa . "%' or catfreq_id LIKE '%" . $pesquisa . "%';");
            $row = mysql_fetch_array($result);
            $recordCount = $row['RecordCount'];

            //Get records from database
            $result = mysql_query("SELECT * FROM catfreq WHERE catfreq_descricao LIKE '%" . $pesquisa . "%' or mensalidade_valor LIKE '%" . $pesquisa . "%' ORDER BY " . $_GET["jtSorting"] . " LIMIT " . $_GET["jtStartIndex"] . "," . $_GET["jtPageSize"] . ";");
        }

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
        $result = mysql_query("INSERT INTO catfreq(mensalidade_valor, catfreq_descricao,catfreq_atualizacao,catfreq_tipo) VALUES(" .
                $_POST["mensalidade_valor"] . ",'" . $_POST["catfreq_descricao"] . "',now(),".$_POST["catfreq_tipo"].");");

        //Get last inserted record (to return to jTable)
       // $result = mysql_query("SELECT max(catfreq_id) as catfreq_id FROM catfreq");  // PEGANDO O ULTIMO ID INSERIDO QUANDO NAO É AUTO INCREMENT
        $result = mysql_query("SELECT * FROM catfreq WHERE catfreq_id = LAST_INSERT_ID();");
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
        $result = mysql_query("UPDATE catfreq SET  mensalidade_valor = " . $_POST["mensalidade_valor"] . ", catfreq_descricao = '" . $_POST["catfreq_descricao"] .
                "',catfreq_atualizacao = now(), catfreq_tipo =" .$_POST["catfreq_tipo"]." where catfreq_id =  " . $_POST["catfreq_id"]);
 
        // ATUALIZANDO VALOR DAS MENSALIDADES DOS SOCIOS Q ESTAO DEVENDO
        $socios_devendo_mens= mysql_query("select pag_mens_status,pag_mens_valor,pag_mens_socio, pag_mens_cat from pagmensalidade INNER JOIN socio ON socio_id = pag_mens_socio INNER JOIN catfreq ON catfreq_id = pag_mens_cat where pag_mens_status = 0 AND pag_mens_cat = ".$_POST["catfreq_id"]."");
      while ($linha = mysql_fetch_array($socios_devendo_mens)) {
            mysql_query("UPDATE pagmensalidade SET pag_mens_valor = " . $_POST["mensalidade_valor"] . " where pag_mens_status = 0 AND pag_mens_cat =  " . $_POST["catfreq_id"]);
        }
        //Return result to jTable
        $jTableResult = array();
        $jTableResult['Result'] = "OK";
        print json_encode($jTableResult);
        
      
        
        
    }
    //Deleting a record (deleteAction)
    else if ($_GET["action"] == "delete") {
        //Delete from database
        $result = mysql_query("DELETE FROM catfreq WHERE catfreq_id = " . $_POST["catfreq_id"] . ";");

        //Return result to jTable
        $jTableResult = array();
        $jTableResult['Result'] = "OK";
        print json_encode($jTableResult);
    } 
    
    
    else if ($_GET["action"] == "informacoes") {
        $id = (int) $_POST['id'];

// Selecionando mais três frases, a partir da última
        $query = mysql_query("SELECT * FROM catfreq WHERE catfreq_id =" . $id);

// Retornando frases
        while ($frase = mysql_fetch_object($query))
            echo "$frase->catfreq_descricao <br />";
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