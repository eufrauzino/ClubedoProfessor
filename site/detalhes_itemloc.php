<!--
To change this template, choose Tools | Templates
and open the template in the editor.
-->
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
        $con = mysql_connect("localhost", "root", "");
        mysql_select_db("clubesys", $con);
        $id = $_REQUEST['id'];
        echo '<table>';
        echo '<tr>';
        echo '<th>itemobj_id</th>';
        echo '<th>itemobj_tipoloc</th>';
        echo '<th>itemobj_locacao</th>';
        echo '<th>itemobj_parente</th>';
        echo '<th>itemobj_evento</th>';
        echo '<th>itemobj_responsavel</th>';
        echo '<th>itemobj_data</th>';
        echo '</tr>';
        $result = mysql_query('SELECT itemobj_id, itemobj_tipoloc, itemobj_locacao, itemobj_parente, itemobj_evento, itemobj_responsavel, itemobj_data FROM itemlocacao where itemobj_id='.$id);
        while ($row = mysql_fetch_array($result)) {
            
            echo '<tr>';
            echo '<td>' . $row['itemobj_id'] . '</td>';
            echo '<td>' . $row['itemobj_tipoloc'] . '</td>';
            echo '<td>' . $row['itemobj_locacao'] . '</td>';
            echo '<td>' . $row['itemobj_parente'] . '</td>';
            echo '<td>' . $row['itemobj_evento'] . '</td>';
            echo '<td>' . $row['itemobj_responsavel'] . '</td>';
            echo '<td>' . $row['itemobj_data'] . '</td>';
            echo '</tr>';
        }
        
        echo '</table>';
        mysql_close();
        ?>
    </body>
</html>
