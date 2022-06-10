<?php
include './conecta.php';
include './usuarios.class.parte4.php';

$usuario = $_POST["usuario"];
$senha = $_POST["senha"];
$lembrar = false;

$usu = new Usuario();
$usu->logaUsuario($usuario, $senha, $lembrar=false);
    echo $usu->lembrarDados($usuario, $senha);
//    echo "logado";
   header("Location: restrito.php?usuario=".$usuario);  



?>
