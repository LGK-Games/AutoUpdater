<?php
$ipserver = "127.0.0.1";
$user 	  = "root";
$senha	  = "12345690";
$db 	  = "painel";
$conexao = mysql_connect($ipserver,$user,$senha) or die (mysql_error());
$banco = mysql_select_db($db, $conexao) or die(mysql_error());

## ----------------------------------------
## Status do servidor na página inicial do site
$loginserver = @fsockopen($ipserver, 2106, $errno, $errstr, 1);
$gameserver = @fsockopen($ipserver, 7777, $errno2, $errstr2, 1);


// Exibir quantidade de players online?
$explon = 1; // 1 = Sim | 0 = Não
?>