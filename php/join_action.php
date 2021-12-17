<?php

        $connect = mysqli_connect('localhost', 'choimik1076', 'dkffh4189', 'choimik1076') or die("fail");


        $id=trim(strip_tags(addslashes( $_GET[id])));
        $pw=trim(strip_tags(addslashes( $_GET[pw])));
        $email=trim(strip_tags(addslashes( $_GET[email])));

        $date = date('Y-m-d H:i:s');


        $query = "insert into member (id, pw, email, date, permit) values ('$id', '$pw', '$email', '$date', 0)";


        $result = $connect->query($query);


        if($result) {
        ?>      <script>
                alert('가입 되었습니다.');
                location.replace("./login.php");
                </script>

<?php   }
        else{
?>              <script>

                        alert("fail");
                </script>
<?php   }

        mysqli_close($connect);
?>
