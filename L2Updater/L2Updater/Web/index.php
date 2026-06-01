<?php require("config/configs.php");
error_reporting(E_ALL); 
date_default_timezone_set('America/Sao_Paulo');
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Lineage II</title>
<link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="css/ddsmoothmenu.css" />
<link rel="stylesheet" type="text/css" href="css/paginas.css" />

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/ddsmoothmenu.js">
</script>
<script language="javascript" type="text/javascript">
function clearText(field)
{
    if (field.defaultValue == field.value) field.value = '';
    else if (field.value == '') field.value = field.defaultValue;
}
</script>
<script type="text/javascript">

ddsmoothmenu.init({
	mainmenuid: "top_nav", //menu DIV id
	orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
	classname: 'ddsmoothmenu', //class added to menu's outer DIV
	//customtheme: ["#1c5a80", "#18374a"],
	contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
})

</script>
</head>

<body scroll="no">

<div id="templatemo_wrapper"><!-- END of templatemo_header -->
    
    <div id="templatemo_menu">
    	<div id="top_nav" class="ddsmoothmenu">
            <ul>
                <li><a href="./?page=home" class="selected">Inicio</a></li>
								
				<li><a href="./?page=toppvp">Top PVP</a></li>
				
				<li><a href="./?page=toppk">Top PK</a></li>	
				
			    <li><a href="./?page=information">Servidor</a></li>
				
				<li><a href="./?page=Castles">Castles</a></li>
				 
			    <li><a href="./?page=oly">Olímpiadas</a></li>
			      
				<li><a href="./?page=tvt">Eventos</a></li> 
            </ul>
            <br style="clear: left" />
        </div> <!-- end of ddsmoothmenu -->
        <div id="menu_second_bar">                   
    	</div>
    </div> <!-- END of templatemo_menu -->
    
    <div id="templatemo_middle">
	
	<div class="lateral">
	<div style="margin-top:10px; height:270px; width:220px; background: url(images/server.png) no-repeat;" >

	<table style=" font-size:15px; margin-top:50px; margin-left:10px; float:left;">
	<tr><td width="100">Game Server:</td><td width="100"><?php echo $gameserver ? '<font color=#00CC00>ONLINE</font>' : '<font color=#FF0000>OFFLINE</font>'; ?></td></tr>
	<tr><td width="100"> Login Server:</td><td width="100"><?php echo $loginserver ? '<font color=#00CC00>ONLINE</font>' : '<font color=#FF0000>OFFLINE</font>'; ?></td></tr>
	</table>
	
	
	<table style=" font-size:15px; margin-top:50px; margin-left:10px; float:left;">
	<tr><td width="100"> Versão:</td><td width="100">Interlude</td></tr>
	<tr><td width="100">Xp:</td><td width="100">500x</td></tr>
	<tr><td width="100">Sp:</td><td width="100">500x</td></tr>
	<tr><td width="100">Adenas:</td><td width="100">1000x</td></tr>
	<?php if($explon == 1) {
	$searchPlayersOnline = mysql_query("SELECT COUNT(*) AS quant FROM ".$db.".characters WHERE online = '1' LIMIT 3000", $conexao);
	$spoFet = mysql_fetch_array($searchPlayersOnline);
	echo "<tr><td width='100'>Players Online:</td><td width='100'><font color=#00CC00>".intval($spoFet['quant'])."</font></td></tr>";}	
	?>	
    </table>	
	</div>
	</div>
	
	<div class="central_div">
	<img src="images/divisoria.png" />
	</div>
	
	<div class="central_area">
	<?php
	//Script de paginação anti SQL inject								
	
	$pasta = "pages/";       // Caminho da pasta onde estão os seus arquivos PHP
	$home = "home";         // Página principal
	#======== Não edite daqui para baixo ========#
	$pags_array = array();
	$diretorio = dir($pasta);
	while($arquivo = $diretorio -> read()){
	  if($arquivo != "." && $arquivo != ".."){
			array_push($pags_array, str_replace(".php", "", $arquivo));
	  }
	}
	$diretorio -> close();
	$pagina = !empty($_GET["page"]) ? trim($_GET["page"]) : $home;
	if(!in_array($pagina, $pags_array)){
	  $pagina = $home;
	}
	if(isset($pagina)){
	  if(file_exists($pasta.$pagina.'.php')){
			@include_once($pasta.$pagina.".php");
	  }else{
			session_destroy();
			echo"<meta HTTP-EQUIV='Refresh' CONTENT='0;URL=./'>";
	  }
	}else{
		@include_once($pasta.$home.".php");
	}
?>
    </div> <!-- END of templatemo_middle -->
    
 </div>   
</div> <!-- END of templatemo_wrapper -->

</body>
</html>