<?php

try {

    //Open database connection
    include './conecta.php';

    //Getting records (listAction)
    if ($_GET["action"] == "list") {

        $itemlocacao = $_GET['id']; // pegando o id do estado para mostrar as cidades relacionadas a ele 
        //Get records from database
         $result = mysql_query("SELECT * FROM itemproduto AS i INNER JOIN produto AS p ON p.produto_id = i.itemprod_objetos where i.itemprod_itemlocacao = " . $itemlocacao);
        // detalhes
        if ($_GET["acao"] == "detalhes") {
            $result = mysql_query("SELECT * FROM itemproduto INNER JOIN produto ON produto_id = itemprod_objetos INNER JOIN itemlocacao on itemobj_id = itemprod_itemlocacao where itemobj_locacao = " . $itemlocacao);
        }        
        else{
            $result = mysql_query("SELECT * FROM itemproduto AS i INNER JOIN produto AS p ON p.produto_id = i.itemprod_objetos where i.itemprod_itemlocacao = " . $itemlocacao);
        }
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
        $itemlocacao = $_POST['itemprod_itemlocacao'];
        $result = mysql_query("INSERT INTO itemproduto(itemprod_objetos, itemprod_qtd,itemprod_itemlocacao,itemprod_data) VALUES(" . $_POST["itemprod_objetos"] . "," . $_POST["itemprod_qtd"] . "," . $itemlocacao . ",'" . $_POST["itemprod_data"] . "')");


        //Get last inserted record (to return to jTable)
        $result = mysql_query("SELECT * FROM itemproduto WHERE itemprod_id = LAST_INSERT_ID() and itemprod_itemlocacao=" . $itemlocacao);  // PEGANDO O ULTIMO ID INSERIDO QUANDO NAO É AUTO INCREMENT
        $row = mysql_fetch_array($result);

        //Return result to jTable
        $jTableResult = array();
        $jTableResult['Result'] = "OK";
        $jTableResult['Record'] = $row;
        print json_encode($jTableResult);
    }


    //Deleting a record (deleteAction)
    else if ($_GET["action"] == "delete") {
        //Delete from database
        $result = mysql_query("DELETE FROM itemproduto WHERE itemprod_id = " . $_POST["itemprod_id"] . ";");

        //Return result to jTable
        $jTableResult = array();
        $jTableResult['Result'] = "OK";
        print json_encode($jTableResult);
    } else if ($_GET['action'] == 'objeto') {   // POPULANDO AS OPCOES  
        $result = mysql_query("SELECT * from produto");
        $rows = array();
        while ($row = mysql_fetch_array($result)) {
            $eil = array();
            $eil["DisplayText"] = $row["produto_descricao"];
            $eil["Value"] = $row["produto_id"];
            $rows[] = $eil;
        }
        $jTableResult = array();
        $jTableResult['Result'] = "OK";
        $jTableResult['Options'] = $rows;
        print json_encode($jTableResult);
    } else if ($_GET['action'] == 'qtd') {   // POPULANDO AS OPCOES  
        $produto = $_GET['itemprod_objeto'];
        $data = $_GET['data'];

        $result = mysql_query("SELECT * from produto where produto_id = " . $produto);
        $result2 = mysql_query("SELECT SUM(itemprod_qtd) as total FROM itemproduto WHERE itemprod_data = '$data' AND itemprod_objetos =" . $produto);

        $totalestoque = mysql_result($result, 0, "produto_estoque");
        $usadodia = 0;

        if (mysql_num_rows($result2) > 0) {
            $usadodia = mysql_result($result2, 0, "total");
        }
        $total = $totalestoque - $usadodia;

        $rows = array();

        //trazendo a quantidade de estoque disponivel



        $eil = array();
        for ($i = 0; $i <= $total; $i++) {
            $eil["DisplayText"] = $i;
            $eil["Value"] = $i;
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