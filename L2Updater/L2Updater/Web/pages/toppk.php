<div align="center">
<div align="center" class="title">Top Pk's</div>

<div style="margin-top:10px;">Listados os <b>Top 10</b> Players.</div>

	<table class="rank">
		<tr class="destaque">
			<td align="Center">Pos:</td>
			<td align="Center">Nome</td>
			<td align="Center">Clan</td>
			<td align="Center">Pk's</td>
		</tr>
<?php

//$max_limite = 10; // não altere para não deformar o index , Não colocar mais que 10!
$buscar = mysql_query("SELECT obj_Id, char_name, clanid, pkkills FROM ".$db.".characters WHERE accesslevel = 0 ORDER BY pkkills DESC LIMIT 10", $conexao);

  $ranking = 1;
  $i = 1;
  while($dados=mysql_fetch_array($buscar)){
  
  $ranking_auto = $ranking++;
	  if($ranking_auto == 1){
		 $exibir_rank = '<img src="images/top1.gif" />';
	  }else if($ranking_auto == 2){
		  $exibir_rank = '<img src="images/top2.gif" />';
	  }else if($ranking_auto == 3){
		  $exibir_rank = '<img src="images/top3.gif" />';
	  }else{
		 $exibir_rank = $i."&ordm;";
	  }
  ?>
  <tr<?php if($i % 2 == 0){ echo " class='one'"; } else { echo " class='two'"; }?>>
    <td align="center"><?php echo $exibir_rank; ?></td>
    <td align="Center"><?php echo $dados['char_name']; ?></td>
    <td align="Center"><?php   $buscarClan = mysql_query("SELECT clan_name FROM ".$db.".clan_data WHERE clan_id = '".$dados['clanid']."'  LIMIT 1", $conexao);
			if(mysql_num_rows($buscarClan) > 0) { 
				echo mysql_result($buscarClan, 0, 0);
				} else {
				echo "-";
				}
	?></td>
    <td align="Center"><?php echo $dados['pkkills']; ?></td>
  </tr>
  <?php $i++; }  ?>
</table>
