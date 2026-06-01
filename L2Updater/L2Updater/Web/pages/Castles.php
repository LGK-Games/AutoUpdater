<div align="center">
<div align="center" class="title">Castle Siege</div>

<div style="margin-top:10px;">Confira os Status dos Castles.</div>
	
	<table class="rank">
	<tr class="destaque">
	<td>Castelo:</td>
	<td>Clan:</td>
	<td>Lord Castle:</td>
	<td>Próxima Siege:</td>
</tr>
<?php

$sql = mysql_query("SELECT * FROM ".$db.".castle ORDER BY siegeDate ASC", $conexao);
$i = 1;
while($c = mysql_fetch_array($sql)) {

	  $cl = mysql_query("SELECT * FROM ".$db.".clan_data WHERE hasCastle = '".$c['id']."'", $conexao);
	  $clan = mysql_fetch_array($cl);
	  
	  $l = mysql_query("SELECT char_name FROM ".$db.".characters WHERE obj_Id = '".$clan['leader_id']."'", $conexao);
	  $lord = mysql_fetch_array($l);

?>

  <tr<?php if($i % 2 == 0){ echo " class='one'"; } else { echo " class='two'"; }?>>
	<td><span><?php echo $c['name'];?></td>
	<td><?php echo !empty($clan['clan_name']) ? $clan['clan_name'] : "-"; ?></td>
	<td><?php if(mysql_num_rows($l) > 0) { echo mysql_result($l, 0, 0); } else { echo "-"; } ?></td>
	<td><?php echo @date('D\, j M Y H\:i',$c['siegeDate']/1000); ?></td>
  </tr>
<?php
 $i++;}
?>
</table>