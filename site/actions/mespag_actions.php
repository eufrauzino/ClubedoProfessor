<?php

$ano = date('Y');
try {
    //Open database connection
    include './conecta.php';
    //Getting records (listAction)
    if ($_GET["action"] == "list") {
        //Get record count
        $result = mysql_query("SELECT COUNT(*) AS RecordCount FROM mespagamento");
        $row = mysql_fetch_array($result);
        $recordCount = $row['RecordCount'];

        //Get records from database
        $result = mysql_query("SELECT * FROM mespagamento ORDER BY " . $_GET["jtSorting"] . " LIMIT " . $_GET["jtStartIndex"] . "," . $_GET["jtPageSize"] . ";");

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
        $result = mysql_query("INSERT INTO mespagamento (mespag_uso,mespag_ano,mespag_mes) VALUES(" . $_POST["mespag_uso"] . ",'" . $ano . "', " . $_POST["mespag_mes"] . ");");

        //Get last inserted record (to return to jTable)
        $result = mysql_query("SELECT * FROM mespagamento WHERE mespag_id = LAST_INSERT_ID();");
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

        $result = mysql_query("UPDATE mespag SET mespag_descricao = '" . $_POST["mespag_descricao"] . "',mespag_nivel = " . $_POST["mespag_nivel"] . " WHERE mespag_id = " . $_POST["mespag_id"] . ";");
        //Return result to jTable
        $jTableResult = array();
        $jTableResult['Result'] = "OK";
        print json_encode($jTableResult);
    }
    //Deleting a record (deleteAction)
    else if ($_GET["action"] == "delete") {
        //Delete from database
        $result = mysql_query("DELETE FROM mespagamento WHERE mespag_id = " . $_POST["mespag_id"] . ";");

        //Return result to jTable
        $jTableResult = array();
        $jTableResult['Result'] = "OK";
        print json_encode($jTableResult);
    } 
    
    
    else if ($_GET["action"] == "entrada_mes") {
        $mes = $_REQUEST['mespag_id'];
        $mes_nome = $_REQUEST['mes'];
        $ano = $_REQUEST['ano'];
        $uso=$_REQUEST['mespag_uso'];
        

        if ($uso == 0) {
            mysql_query("UPDATE mespagamento SET mespag_uso = 1 where mespag_id =".$mes);
            // TRAZENDO TODOS OS SOCIOS E CATEGORIA ONDE O SOCIO DE DETERMINADO MES SEU STATUS DE DEVENDO DIFERENTE DE 1.
            $result_pagamento = mysql_query("SELECT socio_id,catfreq_id,mensalidade_valor
            from socio as socio
            INNER JOIN catfreq AS catfreq ON socio.socio_cat = catfreq.catfreq_id
            and not exists(SELECT * from socio AS socio INNER JOIN pagmensalidade as p ON socio.socio_id = p.pag_mens_socio 
            INNER JOIN mespagamento AS m ON m.mespag_id = p.pag_mens_mes WHERE p.pag_mens_status=1 AND m.mespag_id =" . $mes . ") WHERE socio.socio_ativo=1");

             while ($linha = mysql_fetch_array($result_pagamento)) {
                mysql_query("INSERT INTO pagmensalidade(pag_mens_data,pag_mens_status,pag_mens_valor,pag_mens_socio,pag_mens_mes,pag_mens_cat)VALUES(now(),0," . $linha['mensalidade_valor'] . "," . $linha['socio_id'] . "," . $mes . "," . $linha['catfreq_id'] . ");");
            }/* INSERIDO TODOS OS SOCIOS DO MES CORREPONDENTES COMO DEVENDO MENSALIDADE */
            }
            header("Location: ../index.php?tabela=entmens&&mes_nome=" . $mes_nome . "&&ano=" . $ano . "&&mes=" . $mes);
        
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