
<?php

try {

    //Open database connection
   include './conecta.php';

    //Getting records (listAction)
    if ($_GET["action"] == "list") {
      

         if (empty($_POST['pesquisa'])) {
            $pesquisa = NULL;
              //Get record count
        $result = mysql_query("SELECT COUNT(*) AS RecordCount FROM socio");
        $row = mysql_fetch_array($result);
        $recordCount = $row['RecordCount'];

       
        //Get records from database
        $result = mysql_query("SELECT * FROM socio ORDER BY " . $_GET["jtSorting"] . " LIMIT " . $_GET["jtStartIndex"] . "," . $_GET["jtPageSize"] . ";");
        }
        
         else {
            $pesquisa = mysql_real_escape_string($_POST['pesquisa']);
            $result = mysql_query("SELECT COUNT(*) AS RecordCount FROM socio WHERE socio_nome LIKE '%" . $pesquisa . "%' or socio_acao LIKE '%" . $pesquisa . "%';");
            $row = mysql_fetch_array($result);
            $recordCount = $row['RecordCount'];

            //Get records from database
            $result = mysql_query("SELECT * FROM socio WHERE socio_nome LIKE '%" . $pesquisa . "%' or socio_acao LIKE '%" . $pesquisa . "%' ORDER BY " . $_GET["jtSorting"] . " LIMIT " . $_GET["jtStartIndex"] . "," . $_GET["jtPageSize"] . ";");
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


    //Creating a new record (createAction)
    else if ($_GET["action"] == "create") {
        //Insert record into database
        $result = mysql_query("INSERT INTO socio(socio_acao, socio_nome, socio_cep, socio_endereco, socio_num_res,
            socio_bairro, socio_cidade, socio_fone_res, socio_fone_cel, socio_rg, socio_cpf, socio_nascimento, socio_civil,
            socio_sexo, socio_profissao, socio_regime_trabalho, socio_local_trabalho, socio_fone_trabalho,
            socio_observacao, socio_email, socio_data_cadastro, socio_ativo, socio_cat            
           ) VALUES(" . $_POST['socio_acao'] . ",'" . $_POST['socio_nome'] . "','" . $_POST['socio_cep'] . "','" . $_POST['socio_endereco'] . "','" . $_POST['socio_num_res'] .
                "','" . $_POST['socio_bairro'] . "'," . $_POST['socio_cidade'] . ",'" . $_POST['socio_fone_res'] . "','" . $_POST['socio_fone_cel'] . "','" . $_POST['socio_rg'] .
                "','" . $_POST['socio_cpf'] . "'," . $_POST['socio_nascimento'] . ",'" . $_POST['socio_civil'] . "','" . $_POST['socio_sexo'] .
                "','" . $_POST['socio_profissao'] . "','" . $_POST['socio_regime_trabalho'] . "','" . $_POST['socio_local_trabalho'] . "','" . $_POST['socio_fone_trabalho'] . "','" . $_POST['socio_observacao'] .
                "','" . $_POST['socio_email'] . "'," . $_POST['socio_data_cadastro'] . "," . $_POST['socio_ativo'] . 
                "," . $_POST['socio_cat'] . ")");


//Get last inserted record (to return to jTable)
        $result = mysql_query("SELECT * FROM socio WHERE socio_id = LAST_INSERT_ID();");
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
    $result = mysql_query("UPDATE socio SET socio_acao =" . $_POST['socio_acao'] . ", socio_nome='" . $_POST['socio_nome'] . "',
            socio_cep = '" . $_POST['socio_cep'] . "', socio_endereco ='" . $_POST['socio_endereco'] ."', socio_num_res ='" . $_POST['socio_num_res'] ."',
            socio_bairro = '". $_POST['socio_bairro'] . "', socio_cidade =" . $_POST['socio_cidade'] . ", socio_fone_res = '" . $_POST['socio_fone_res'] . "', socio_fone_cel='" . $_POST['socio_fone_cel'] . "', socio_rg='" . $_POST['socio_rg'] ."', socio_cpf='" . $_POST['socio_cpf'] . "', socio_nascimento=" . $_POST['socio_nascimento'] . ", socio_civil='" . $_POST['socio_civil'] . "',
            socio_sexo='" . $_POST['socio_sexo'] ."', socio_profissao='" . $_POST['socio_profissao'] . "', socio_regime_trabalho='" . $_POST['socio_regime_trabalho'] . "', socio_local_trabalho='" . $_POST['socio_local_trabalho'] . "', socio_fone_trabalho='" . $_POST['socio_fone_trabalho'] . "',
            socio_observacao='" . $_POST['socio_observacao'] ."', socio_email='" . $_POST['socio_email'] . "', socio_data_cadastro=" . $_POST['socio_data_cadastro'] . ", socio_ativo=" . $_POST['socio_ativo'] . ", socio_cat=" . $_POST['socio_cat'] . "
            WHERE socio_id=" . $_POST['socio_id']);


        //Return result to jTable
        $jTableResult = array();
        $jTableResult['Result'] = "OK";
        print json_encode($jTableResult);
    }

    
    else if ($_GET["action"] == "desativar") {
        //Update record in database
    $result = mysql_query("UPDATE socio SET socio_acao =" . $_POST['socio_acao'] .", socio_ativo=".$_POST['socio_ativo']." 
            WHERE socio_id=" . $_POST['socio_id']);


        //Return result to jTable
        $jTableResult = array();
        $jTableResult['Result'] = "OK";
        print json_encode($jTableResult);
    }


    //Deleting a record (deleteAction)
    else if ($_GET["action"] == "delete") {
        //Delete from database
        $result = mysql_query("DELETE FROM socio WHERE socio_id = " . $_POST["socio_id"] . ";");

        //Return result to jTable
        $jTableResult = array();
        $jTableResult['Result'] = "OK";
        print json_encode($jTableResult);
    }


    /*
     * 
     * ACOES FOREIGN KEY
     */ else if ($_GET['action'] == 'acao') {   // POPULANDO AS OPCOES  
        $result = mysql_query(" SELECT DISTINCT * FROM acao AS a WHERE acao_tipo = 1 and NOT EXISTS (SELECT socio_acao from socio AS s WHERE s.socio_acao = a.acao_id)  ");
        //$result = mysql_query("SELECT * from acao");
        $rows = array();
        while ($row = mysql_fetch_array($result)) {
            $eil = array();
            $eil["DisplayText"] = $row["acao_id"];
            $eil["Value"] = $row["acao_id"];
            $rows[] = $eil;
        }
        $jTableResult = array();
        $jTableResult['Result'] = "OK";
        $jTableResult['Options'] = $rows;
        print json_encode($jTableResult);
        
    } 
    
//    else if ($_GET['action'] == 'padrinho') {   // POPULANDO AS OPCOES  
//        $result = mysql_query("SELECT * from socio");
//        $rows = array();
//        while ($row = mysql_fetch_array($result)) {
//            $eil = array();
//            $eil["DisplayText"] = $row["socio_nome"];
//            $eil["Value"] = $row["socio_nome"];
//            $rows[] = $eil;
//        }
//        $jTableResult = array();
//        $jTableResult['Result'] = "OK";
//        $jTableResult['Options'] = $rows;
//        print json_encode($jTableResult);
//    } 
    
//    else if ($_GET['action'] == 'cargo'){// POPULANDO AS OPCOES  
//        $result = mysql_query("SELECT * from cargo");
//        $rows = array();
//        while ($row = mysql_fetch_array($result)) {
//            $eil = array();
//            $eil["DisplayText"] = $row["cargo_descricao"];
//            $eil["Value"] = $row["cargo_id"];
//            $rows[] = $eil;
//        }
//        $jTableResult = array();
//        $jTableResult['Result'] = "OK";
//        $jTableResult['Options'] = $rows;
//        print json_encode($jTableResult);
//    } 
//    
//    
//    
//    
//    ACADEMIA
//    
//    else if ($_GET['action'] == 'academia'){// POPULANDO AS OPCOES  
//        $result = mysql_query("SELECT * from catfreq where catfreq_tipo = 4");
//        $rows = array();
//        while ($row = mysql_fetch_array($result)) {
//            $eil = array();
//            $eil["DisplayText"] = $row["catfreq_descricao"];
//            $eil["Value"] = $row["catfreq_id"];
//            $rows[] = $eil;
//        }
//        $jTableResult = array();
//        $jTableResult['Result'] = "OK";
//        $jTableResult['Options'] = $rows;
//        print json_encode($jTableResult);
//    } 
//    
//    
//    
//    
//    
//    else if ($_GET['action'] == 'exame') {   // POPULANDO AS OPCOES  
//        $result = mysql_query("SELECT * from exame");
//        $rows = array();
//        while ($row = mysql_fetch_array($result)) {
//            $eil = array();
//            $eil["DisplayText"] = $row["exame_dono"]." MEDICO : ".$row["exame_medico"];
//            $eil["Value"] = $row["exame_id"];
//            $rows[] = $eil;
//        }
//        $jTableResult = array();
//        $jTableResult['Result'] = "OK";
//        $jTableResult['Options'] = $rows;
//        print json_encode($jTableResult);
//        
//    } 
  else if ($_GET['action'] == 'categoria') {         
        $result = mysql_query("SELECT * from catfreq where catfreq_tipo = 1");
        $rows = array();
        while ($row = mysql_fetch_array($result)) {
            $eil = array();
            $eil["DisplayText"] = $row["catfreq_descricao"] ;
            $eil["Value"] = $row["catfreq_id"];
            $rows[] = $eil;
        }
        $jTableResult = array();
        $jTableResult['Result'] = "OK";
        $jTableResult['Options'] = $rows;
        print json_encode($jTableResult);
        
        
    }
    
    else if ($_GET['action'] == 'estado') {   // POPULANDO AS OPCOES  
        $result = mysql_query("SELECT * from tb_estados");
        $rows = array();
        while ($row = mysql_fetch_array($result)) {
            $eil = array();
            $eil["DisplayText"] = $row["uf"];
            $eil["Value"] = $row["id"];
            $rows[] = $eil;
        }
        $jTableResult = array();
        $jTableResult['Result'] = "OK";
        $jTableResult['Options'] = $rows;
        print json_encode($jTableResult);
    }
    else if ($_GET['action'] == 'cidade') {   // POPULANDO AS OPCOES  
        $estado = $_GET['estado'];
        $result = mysql_query("SELECT * from tb_cidades where estado = ".$estado);
        $rows = array();
        while ($row = mysql_fetch_array($result)) {
            $eil = array();
            $eil["DisplayText"] = $row["c_nome"];
            $eil["Value"] = $row["id"];
            $rows[] = $eil;
        }
        $jTableResult = array();
        $jTableResult['Result'] = "OK";
        $jTableResult['Options'] = $rows;
        print json_encode($jTableResult);
    }
    
    else if ($_GET['action'] == 'itemlocacao') {   // POPULANDO AS OPCOES  
        $socio = $_REQUEST['socio'];
        $socio_nome = $_REQUEST['socio_nome'];
        
//        MAIS UMA VERIFICACAO, TALVEZ ESSA NAO NECESSARIA
//        $s = mysql_query("SELECT socio_ativo from socio WHERE socio_id =" . $socio);
//        $situacao = mysql_result($s,0);
//        if($situacao == 1){
//        ...
//                else ...
       
//        $locacao = rand( 1, 1000000); gerando codigo da locacao
// 19/08 deixei a locacao auto_increment


       
        mysql_query("INSERT INTO locacao(locacao_data,locacao_pago,locacao_socio,locacao_socionome)VALUES(now(),0," . $socio.",'".$socio_nome."');");
       
        /* INSERIDO TODOS OS SOCIOS DO MES CORREPONDENTES COMO DEVENDO MENSALIDADE */
        header("Location: ../index.php?tabela=itemloc&&locacao=".  mysql_insert_id() ."&&socio_nome=".$socio_nome."&&socio_id=".$socio);
        // USANDO O MYSQL_INSERT_ID PARA RECULPERAR O ULTIMO ID INSERIDO NESSA SESSAO
        
        
    }
    
   


    /*
     * 
     * 
     *  INFORMACOES
     *
     * 
     * 
     * 
     */ 
    
  //  else if ($_GET["action"] == "informacoes") {
//        $id = (int) $_POST['id'];

// Selecionando mais três frases, a partir da última
//        $query = mysql_query("SELECT * FROM socio INNER JOIN tb_cidades on socio.socio_cidade=tb_cidades.id WHERE socio_id =" . $id);
//          
//         while ($detalhe = mysql_fetch_object($query)) {
//          
//          echo "<center><h3><b><u>$detalhe->socio_nome</u></b></h3></center><br>";  
           // echo "<td><b> $detalhe->socio_id</td>";
//            echo "<h4 style='color: red'><b><u>INFORMAÇÕES PESSOAIS</u></b></h4><br>";
//            echo "<b>ACAO : </b>$detalhe->socio_acao<br>";
//            echo "<b> NOME :</b>$detalhe->socio_nome<br>";                  
//            

}
catch (Exception $ex) {
    //Return error message
    $jTableResult = array();
    $jTableResult['Result'] = "ERROR";
    $jTableResult['Message'] = $ex->getMessage();
    print json_encode($jTableResult);
}
?>
   