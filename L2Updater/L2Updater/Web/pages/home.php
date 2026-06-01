<div align="center">
<div style="margin-left:20px;" class="title">Últimas Atualizações</div>
<div class="modals">
  <?php
  $busca = "SELECT * FROM web_updaters ORDER BY data DESC";
  
  $total_reg = "1"; // número de registros por página
  
   $pagina=$_GET['pagina'];
  if (!$pagina) {
  $pc = "1";
  } else {
  $pc = $pagina;
  }
  
  $inicio = $pc - 1;
  $inicio = $inicio * $total_reg;
  ?>
   
  <div style="margin-top:10px; float:right; margin-right:53px;">  
  <?php
  $limite = mysql_query("$busca LIMIT $inicio,$total_reg");
  $todos = mysql_query("$busca");
 
  $tr = mysql_num_rows($todos); // verifica o número total de registros
  $tp = $tr / $total_reg; // verifica o número total de páginas
 
  // vamos criar a visualização
  while ($dados = mysql_fetch_array($limite)) {  
  $data = $dados["data"];
  $titulo = $dados["titulo"];
  $texto = $dados["texto"];
  $administrador = $dados["administrador"];          
  ?> 
  
<table height="180">
<tr>    
<td align="center">
<table>
<tr><td height="30" align="center"><span style="color:#DDD; font-size:22px; font-weight:bold;"> <?php echo $titulo; ?> </span></td></tr>
<tr><td height="10"  align="center"></td></tr>
<tr><td height="" width="250" align="center"><span style="color:#eadfdf; font-size:12px;"> <?php echo nl2br($texto); ?> </td></tr>
<tr><td height="10"  align="center"></td></tr>
<tr><td height="30" align="center"><span style="color:#eadfdf; font-size:10px;"> Postado por:<b> <?php echo $administrador; ?> </b><br/> <?php echo $data; ?> </span> </td></tr>
</table>  
</td>  
</tr>
</table>    
<?php    }?>  
 </div>
 
 <div style="margin-top:8px; float:right; margin-right:102px;">
 <?php
  // agora vamos criar os botões "Anterior e próximo"
  $anterior = $pc -1;
  $proximo = $pc +1;
  if ($pc>1) {
  echo " <a href='?pagina=1'>< Início&nbsp;</a> ";
  }else{
  echo " Início ";
  }
  
   if($pc<4){
	$pi=1;
	$pf=5;
  }else{
	$pi=$pc-2;
	$pf=$pc+2;
  }
  if($pf>$tp){
   $pf = $tp;
  }
  while($pi<=$pf) {
    echo " | ";
    if($pi!=$pc){
      echo "<a href='?pagina=$pi'> &nbsp$pi&nbsp</a> ";
	}else{
	 echo "$pi";
	}
	$pi++;
  }
  
  echo " | ";
  if ($pc<$tp) {
  echo " <a href='?pagina=$proximo'>&nbsp;Próxima ></a>";
  }else{
  echo " Próxima ";
  }  
  ?>
</div>	
</div>
</div>
