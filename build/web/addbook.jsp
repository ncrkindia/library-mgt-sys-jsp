<?php
session_start();
if($_SESSION['library_status']==0)
{
	exit();
}
$_SESSION['viewport'] = 4;
?>
<html>
	<head>
	</head>
	<body>
		<font size="+2" face="Courier New, Courier, monospace"  color="#553F00" >
		<div align="center">
			<frameset cols="50%,*"  name="addbook"  framespacing="4"  frameborder="yes" bordercolor="#FF99CC">
				<frame src="addbook_detail.php" name="addbook_detail" />
				<frame src="addbook_no.php" name="addbook_no" />
			</frameset>
		</div>
		</font>
	</body>
</html>