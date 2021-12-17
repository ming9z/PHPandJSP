<?php
$connect = mysqli_connect("localhost","choimik1076" ,"dkffh4189" ,"choimik1076" ) or die("connect fail");
$id = trim(strip_tags(addslashes( $_GET[id])));
$number = trim(strip_tags(addslashes( $_GET[number])));
$query = "delete from board where number="$number";
$result = $connect->query($query);

$URL = "./index.php";


if($result) {
?>
        <script>
            alert("삭제되었습니다.");
            location.replace("<?php echo $URL?>");
        </script>
<?php    }
    else {
        echo "fail";
    }
?>
