<?php

 
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
require_once '../../dompdf/dompdf_config.inc.php';
require_once '../actions/conecta.php';
require_once './functions.php';
$id = $_GET['socio'];
$result = mysql_query("SELECT * FROM socio AS s INNER JOIN pagmensalidade as p ON s.socio_id = p.pag_mens_socio INNER JOIN mespagamento as m on p.pag_mens_mes=m.mespag_id where pag_mens_status =0 and socio_id =".$id." ORDER BY pag_mens_mes");
$data = date("d/m/Y");
$nome = "recibo.pdf";
$html = "<html><body>"
        . "CLUBE DO PROFESSOR DO NOROESTE<br>Paranavaí,$data"
        . "<h4 style='color:red'>RELATÓRIO DE SOCIOS DEVENDO MENSALIDADE </h4>";
$html.="<table border='0' cellpading='5' cellspacing='5'>
     <tr style='background-color: lightcoral'>
        <td>ACAO</td>
        <td>NOME</td>
        <td>MES</td>
        <td>ANO</td>
        <td>VALOR</td>
    </tr>    
     ";

while ($linha = mysql_fetch_array($result)) {
    $html.=" <tr><td> " . $linha['socio_acao'] . "</td>";
    $html.=" <td> " . $linha['socio_nome'] . "</td>";
    $html.=" <td> " . mostraMes($linha['mespag_mes']) . "</td>";
    $html.=" <td> " . $linha['mespag_ano'] . "</td>";
    $html.=" <td> " . formata_dinheiro($linha['pag_mens_valor']) . "</td></tr>";
};



$html = utf8_decode($html);
$dompdf = new DOMPDF();
$dompdf->load_html($html);
$dompdf->render();
$dompdf->stream($nome);
?>
 