<?php

try {
    //Open database connection
    include './conecta.php';

    //Getting records (listAction)
    if ($_GET["action"] == "list") {
        //Get record count
        $result = mysql_query("SELECT COUNT(*) AS RecordCount FROM cargo");
        $row = mysql_fetch_array($result);
        $recordCount = $row['RecordCount'];

        //Get records from database
        $result = mysql_query("SELECT * FROM cargo ORDER BY " . $_GET["jtSorting"] . " LIMIT " . $_GET["jtStartIndex"] . "," . $_GET["jtPageSize"] . ";");

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
        $result = mysql_query("INSERT INTO cargo(cargo_descricao,cargo_nivel,cargo_tipo) VALUES('" . $_POST["cargo_descricao"] . "', " . $_POST["cargo_nivel"] .",". $_POST["cargo_tipo"] . ");");

        //Get last inserted record (to return to jTable)
        $result = mysql_query("SELECT * FROM cargo WHERE cargo_id = LAST_INSERT_ID();");
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

        $result = mysql_query("UPDATE cargo SET cargo_descricao = '" . $_POST["cargo_descricao"] . "',cargo_nivel = " . $_POST["cargo_nivel"] . " WHERE cargo_id = " . $_POST["cargo_id"] . ";");
        //Return result to jTable
        $jTableResult = array();
        $jTableResult['Result'] = "OK";
        print json_encode($jTableResult);
    }
    //Deleting a record (deleteAction)
    else if ($_GET["action"] == "delete") {
        //Delete from database
        $result = mysql_query("DELETE FROM cargo WHERE cargo_id = " . $_POST["cargo_id"] . ";");

        //Return result to jTable
        $jTableResult = array();
        $jTableResult['Result'] = "OK";
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