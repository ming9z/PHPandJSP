<?php
    $connect = mysqli_connect("localhost", "choimik1076", "dkffh4189", "choimik1076") or die ("connect fail");
    $number = trim(strip_tags(addslashes( $_GET[number])));
    $title = trim(strip_tags(addslashes( $_GET[title])));
    $content = trim(strip_tags(addslashes( $_GET[content])));
    $date = date('Y-m-d H:i:s');
    $query = "update board set title='$title', content='$content', date='$date' where number=$number";
    $result = $connect->query($query);
    if($result) {
?>
        <script>
            alert("수정되었습니다.");
            location.replace("./view?number=<?=$number?>");
        </script>
<?php    }
    else {
        echo "fail";
    }
?>
