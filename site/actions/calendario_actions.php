<?php

try {
    //Open database connection
    include './conecta.php';

    //Getting records (listAction)
    if ($_GET["action"] == "list") {
         if (empty($_POST['pesquisa'])) {
            $pesquisa = NULL;
        //Get record count
        $result = mysql_query("SELECT COUNT(*) AS RecordCount FROM itemlocacao ");
        $row = mysql_fetch_array($result);
        $recordCount = $row['RecordCount'];

        //Get records from database
        $result = mysql_query("SELECT * FROM (itemlocacao AS i INNER JOIN tipolocacao as t ON i.itemobj_tipoloc = t.obj_tipo_id) INNER JOIN dependencia as d ON t.obj_tipo_obj = d.objeto_id INNER JOIN locacao as l ON l.locacao_id = i.itemobj_locacao INNER JOIN socio as s ON s.socio_id=l.locacao_socio ORDER BY " . $_GET["jtSorting"] . " LIMIT " . $_GET["jtStartIndex"] . "," . $_GET["jtPageSize"] . ";");

         }
        else {
            $pesquisa = mysql_real_escape_string($_POST['pesquisa']);
            $result = mysql_query("SELECT COUNT(*) AS RecordCount FROM itemlocacao INNER JOIN dependencia ON objeto_id = itemobj_tipoloc WHERE objeto_descricao LIKE '%" . $pesquisa . "%';");
            $row = mysql_fetch_array($result);
            $recordCount = $row['RecordCount'];

             $result = mysql_query("SELECT * FROM (itemlocacao AS i INNER JOIN tipolocacao as t ON i.itemobj_tipoloc = t.obj_tipo_id) INNER JOIN dependencia as d ON t.obj_tipo_obj = d.objeto_id INNER JOIN locacao as l ON l.locacao_id = i.itemobj_locacao INNER JOIN socio as s ON s.socio_id=l.locacao_socio WHERE objeto_descricao LIKE '%" . $pesquisa . "%' ORDER BY " . $_GET["jtSorting"] . " LIMIT " . $_GET["jtStartIndex"] . "," . $_GET["jtPageSize"] . ";");
            
        }
        
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
