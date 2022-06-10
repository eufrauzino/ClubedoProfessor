<?php

try {
    //Open database connection
    include './conecta.php';

    //Getting records (listAction)
    if ($_GET["action"] == "list") {
        //Get record count
        $result = mysql_query("SELECT COUNT(*) AS RecordCount FROM itemlocacao WHERE itemobj_locacao=" . $_GET["locacao"]);
        $row = mysql_fetch_array($result);
        $recordCount = $row['RecordCount'];

        //Get records from database
        $result = mysql_query("SELECT * FROM (itemlocacao AS i INNER JOIN tipolocacao as t ON i.itemobj_tipoloc = t.obj_tipo_id) INNER JOIN dependencia as d ON t.obj_tipo_obj = d.objeto_id INNER JOIN locacao as l ON l.locacao_id = i.itemobj_locacao WHERE itemobj_locacao=" . $_GET["locacao"] . " ORDER BY " . $_GET["jtSorting"] . " LIMIT " . $_GET["jtStartIndex"] . "," . $_GET["jtPageSize"] . ";");

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
        $locacao = $_GET["locacao"];
        $data = implode("-", array_reverse(explode("/", $_POST["itemobj_data"])));
        //Insert record into database
//        $consulta = mysql_query("select * from tipolocacao INNER JOIN dependencia on obj_tipo_obj = objeto_id INNER JOIN depinativo ON depinativo_dep = objeto_id WHERE obj_tipo_id = ".$_POST["itemobj_tipoloc"]." AND ('$data' < depinativo.depinativo_inicio or '$data'>depinativo.depinativo_fim)");
        
        $result = mysql_query("INSERT INTO itemlocacao(itemobj_tipoloc,itemobj_locacao,itemobj_parente,itemobj_evento,itemobj_responsavel,itemobj_data) VALUES(" . $_POST["itemobj_tipoloc"] . "," . $locacao . "," . $_POST["itemobj_parente"] . "," . $_POST["itemobj_evento"] . ",'" . $_POST["itemobj_responsavel"] . "','" . $data . "');");
        
        //Get last inserted record (to return to jTable)
        $result = mysql_query("SELECT * FROM itemlocacao WHERE itemobj_id = LAST_INSERT_ID() and itemobj_locacao=" . $locacao);
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
        $result = mysql_query("UPDATE itemlocacao SET itemobj_descricao = '" . $_POST["itemobj_descricao"] . "', itemobj_mensalidade = " . $_POST["itemobj_mensalidade"] . " WHERE itemobj_id = " . $_POST["itemobj_id"] . ";");

        //Return result to jTable
        $jTableResult = array();
        $jTableResult['Result'] = "OK";
        print json_encode($jTableResult);
    }

//Deleting a record (deleteAction)
    else if ($_GET["action"] == "delete") {
        //Delete from database
        $result = mysql_query("DELETE FROM itemlocacao WHERE itemobj_id = " . $_POST["itemobj_id"] . ";");

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
    
    else if ($_GET['action'] == 'evento') {   // POPULANDO AS OPCOES  
        $result = mysql_query("SELECT * from evento");
        $rows = array();
        while ($row = mysql_fetch_array($result)) {
            $eil = array();
            $eil["DisplayText"] = $row["evento_descricao"];
            $eil["Value"] = $row["evento_id"];
            $rows[] = $eil;
        }
        $jTableResult = array();
        $jTableResult['Result'] = "OK";
        $jTableResult['Options'] = $rows;
        print json_encode($jTableResult);
    }
    
    else if ($_GET['action'] == 'tipolocacao') {   // POPULANDO AS OPCOES  
        $evento = $_GET['itemobj_evento'];
        $parente = $_GET['itemobj_parente'];

        //CONVERTENDO A DATA PARA O O BANCO DE DADOS
        $data = implode("-", array_reverse(explode("/", $_GET["itemobj_data"])));
//     AND NOT EXISTS(SELECT * FROM itemlocacao where itemobj_data ='".$data."'); pode ser uma alternativa
         $result = mysql_query(" SELECT * FROM (parentesco AS p INNER JOIN grauloc AS g ON p.parentesco_tipo_grau = g.grauloc_id) 
           INNER JOIN tipolocacao AS t ON t.obj_tipo_grauloc = g.grauloc_id INNER JOIN dependencia AS d ON d.objeto_id = t.obj_tipo_obj
           WHERE obeto_disponivel = 1 AND objeto_id NOT IN (SELECT depinativo_dep FROM depinativo WHERE '$data' BETWEEN depinativo_inicio AND depinativo_fim) and t.obj_tipo_evento =" . $evento . " AND p.parentesco_id = " . $parente . "
           AND NOT EXISTS(select * from itemlocacao as i inner join tipolocacao as t on t.obj_tipo_id = i.itemobj_tipoloc where t.obj_tipo_obj = d.objeto_id and i.itemobj_data = '" . $data . "'); ");


        $rows = array();
        while ($row = mysql_fetch_array($result)) {
            $eil = array();
            $eil["DisplayText"] = $row["obj_tipo_descricao"] . " VALOR :R$" . $row["obj_tipo_valor"];
            $eil["Value"] = $row["obj_tipo_id"];
            $rows[] = $eil;
        }
        $jTableResult = array();
        $jTableResult['Result'] = "OK";
        $jTableResult['Options'] = $rows;
        print json_encode($jTableResult);
    } 
    
    else if ($_GET['action'] == 'listtipolocacao') {
        $id = $_GET['id'];
        $result = mysql_query("SELECT * from tipolocacao where obj_tipo_id = " . $id);
        $rows = array();
        while ($row = mysql_fetch_array($result)) {
            $eil = array();
            $eil["DisplayText"] = $row["obj_tipo_descricao"] /* . " VALOR :R$" . $row["obj_tipo_valor"] */;
            $eil["Value"] = $row["obj_tipo_id"];
            $rows[] = $eil;
        }
        $jTableResult = array();
        $jTableResult['Result'] = "OK";
        $jTableResult['Options'] = $rows;
        print json_encode($jTableResult);
    } 
    
    else if ($_GET['action'] == 'faturar') {   // POPULANDO AS OPCOES  
        $locacao = $_REQUEST["locacao"];
        $formapag = $_REQUEST['formapag'];
        $total = mysql_query("select sum(t.obj_tipo_valor) from itemlocacao AS i INNER JOIN 
           tipolocacao as t ON i.itemobj_tipoloc = t.obj_tipo_id where i.itemobj_locacao =" . $locacao);
        $t = mysql_result($total, $row);
        
        $totalitem = mysql_query("select  sum(produto_valor * itemprod_qtd) from produto INNER JOIN 
           itemproduto ON itemprod_objetos = produto_id INNER JOIN itemlocacao ON itemobj_id = itemprod_itemlocacao where itemobj_locacao =" . $locacao);
        $t_item = mysql_result($totalitem, $row);
        
        $soma = $t+$t_item ;

        mysql_query("UPDATE locacao SET locacao_pago =  1, locacao_formapag='".$formapag."', locacao_total = ".$soma. " WHERE locacao_id = " . $locacao . ";");
        
        /* INSERIDO REGISTRO NO LIVRO CAIXA 

         * 
         * 
         *          */
        $dia = date('d');
        $mes = date('m');
        $ano = date('Y');
        $consulta = mysql_query("SELECT * FROM (tipolocacao AS t INNER JOIN itemlocacao AS i ON i.itemobj_tipoloc = t.obj_tipo_id)INNER JOIN locacao as l ON i.itemobj_locacao=l.locacao_id INNER JOIN socio as s ON s.socio_id = l.locacao_socio WHERE itemobj_locacao=".$locacao. ";");
     
        while ($linha = mysql_fetch_array($consulta)) {
            $socio_nome=$linha['socio_nome'];
            $socio_acao=$linha['socio_acao'];
            $objeto=$linha['obj_tipo_descricao'];
            $valor=$linha['obj_tipo_valor'];
            
            mysql_query("INSERT INTO lc_movimento (dia,mes,ano,tipo,descricao,valor,cat) values ('$dia','$mes','$ano','1','Locacao - Dependencia: $objeto Socio: $socio_nome Acao: $socio_acao','$valor','1')"); // INSERIDO REGISTRO NO CAIXA EXTERNO
            
        }
        
        
        
        
        /* INSERIDO REGISTRO NO LIVRO CAIXA
         * 
         * 
         * 
         *  */

       // header("Location: ../index.php?tabela=locacao");
    
        
    }
    
    else if ($_GET['action'] == 'reservar') {   // POPULANDO AS OPCOES  
        $locacao = $_REQUEST["locacao"];

        $total = mysql_query("select  sum(t.obj_tipo_valor) from itemlocacao AS i INNER JOIN 
           tipolocacao as t ON i.itemobj_tipoloc = t.obj_tipo_id where i.itemobj_locacao =" . $locacao);
        $t = mysql_result($total, $row);
        
        $totalitem = mysql_query("select  sum(produto_valor * itemprod_qtd) from produto INNER JOIN 
           itemproduto ON itemprod_objetos = produto_id INNER JOIN itemlocacao ON itemobj_id = itemprod_itemlocacao where itemobj_locacao =" . $locacao);
        $t_item = mysql_result($totalitem, $row);
        
        $soma = $t+$t_item ;

        mysql_query("UPDATE locacao SET locacao_total =" . $soma . " WHERE locacao_id = " . $locacao . ";");

        /* INSERIDO TODOS OS SOCIOS DO MES CORREPONDENTES COMO DEVENDO MENSALIDADE */
//        header("Location: ../index.php?tabela=locacao");
         header("Location: ../index.php?tabela=locacao");
//       header("Location: ../boleto/boleto_bb.php?locacao=".$locacao);
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
