<?php

include './conecta.php';

if ($_GET['evento'] == 'locacao') {
    $result = mysql_query("SELECT COUNT(*) AS RecordCount FROM itemlocacao ");
    $row = mysql_fetch_array($result);
    $recordCount = $row['RecordCount'];

    //Get records from database
    $result = mysql_query("SELECT * FROM (itemlocacao AS i INNER JOIN tipolocacao AS t ON i.itemobj_tipoloc = t.obj_tipo_id) INNER JOIN dependencia AS d ON d.objeto_id = t.obj_tipo_obj INNER JOIN evento AS e ON t.obj_tipo_evento = e.evento_id;");
    //$result2 = mysql_query("SELECT * FROM (itemlocacao AS i INNER JOIN tipolocacao AS t ON i.itemobj_tipoloc = t.obj_tipo_id) INNER JOIN dependencia AS d ON d.objeto_id = t.obj_tipo_obj INNER JOIN evento AS e ON t.obj_tipo_evento = e.evento_id INNER JOIN depinativo AS depinativo ON d.objeto_id=depinativo.depinativo_dep;");

    //Add all records to an array
    $rows = array();
    while ($row = mysql_fetch_array($result)) {
//       $year = date('Y',  strtotime($row['itemobj_data']));
//	 $month = date('m', $row['itemobj_data']);
//	 $day = date('d', $row['itemobj_data']);


        $rows[] = array(
            'id' => $row['itemobj_id'],
            'title' => $row['objeto_descricao'],
            'start' => $row['itemobj_data'],
            'valor' => $row['obj_tipo_valor'],
            'evento' => $row['evento_descricao'],
            'ativo' => $row['obeto_disponivel'],
            'foto' => $row['objeto_foto'],
//                'url' => "http://yahoo.com/"
        );
    }


    echo json_encode($rows);
} else if ($_GET['evento'] == 'situacao'){

    $result2 = mysql_query("SELECT * FROM dependencia AS d INNER JOIN depinativo AS depinativo ON d.objeto_id=depinativo.depinativo_dep;");

//Add all records to an array
    $rows = array();
    while ($row = mysql_fetch_array($result2)) {
//       $year = date('Y',  strtotime($row['itemobj_data']));
//	 $month = date('m', $row['itemobj_data']);
//	 $day = date('d', $row['itemobj_data']);


        $rows[] = array(
            'id' => $row['depinativo_id'],
            'title' => $row['objeto_descricao'],
            'start' => $row['depinativo_inicio'],
            'end' => $row['depinativo_fim'],
//                'url' => "http://yahoo.com/"
        );
    }


    echo json_encode($rows);
}
//	echo json_encode(array(
//	
//		array(
//			'id' => 111,
//			'title' => "Event1",
//			'start' => "$year-$month-10",
//			'url' => "http://yahoo.com/"
//		),
//		
//		array(
//			'id' => 222,
//			'title' => "Event2",
//			'start' => "$year-$month-20",
//			'end' => "$year-$month-22",
//			'url' => "http://yahoo.com/"
//		)
//	
//	));
?>
