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
         $conn = mysql_connect("localhost", "root", "");
         mysql_select_db("clubesys", $conn);  
         
         $result = mysql_query('SELECT * FROM mespagamento');
         ?>
        <select>
         <?php
         while ($row = mysql_fetch_array($result)) {
             ?><option value="<?php echo $row['mespag_id']?>"><?php echo $row['mespag_mes']?></option>
              <?php            
         }
        
        
        ?>
        </select>
    </body>
</html>
