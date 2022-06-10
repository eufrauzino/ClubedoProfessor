<?php
   $con = mysql_connect("localhost", "root", "");
    mysql_select_db("clubesys", $con);
	

        
        $result = mysql_query("SELECT COUNT(*) AS RecordCount FROM itemlocacao ");
        $row = mysql_fetch_array($result);
        $recordCount = $row['RecordCount'];

        //Get records from database
        $result = mysql_query("SELECT * FROM (itemlocacao AS i INNER JOIN tipolocacao AS t ON i.itemobj_tipoloc = t.obj_tipo_id) INNER JOIN dependencia AS d ON d.objeto_id = t.obj_tipo_obj;");

        //Add all records to an array
        $rows = array();
        while ($row = mysql_fetch_array($result)) {
//       $year = date('Y',  strtotime($row['itemobj_data']));
//	 $month = date('m', $row['itemobj_data']);
//	 $day = date('d', $row['itemobj_data']);
         
         
           $rows[] = array(
		'id'	=> $row['itemobj_id'],
		'title'	=> $row['objeto_descricao'],
             
                'start' =>  $row['itemobj_data'],
                'url' => "http://yahoo.com/"
               );
        }

        //Return result to jTable
        $jTableResult = array();
        $jTableResult['Result'] = "OK";
        $jTableResult['TotalRecordCount'] = $recordCount;
        $jTableResult['Records'] = $rows;
        echo json_encode($rows);
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
