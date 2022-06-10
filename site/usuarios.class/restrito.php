<?php
include './conecta.php';
include './usuarios.class.parte4.php';
$usu = new Usuario();

$usu->iniciaSessao;
if($usu->verificaDadosLembrados()){
    echo "usuario logado com sucesso";
}
else{
    echo "usuario nao logado";
}
$usu->usuarioLogado();


?>
