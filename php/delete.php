
<?php                    $connect = mysqli_connect("localhost","choimik1076" ,"dkffh4189" ,"choimik1076" ) or die("connect fail");

$number = trim(strip_tags(addslashes( $_GET[number])));

$query = "delete from board where number=".$number;
$result = $connect->query($query);

if($result==false){

echo 'problem';

}

else


{
header("Location:index.php");

}
?>
