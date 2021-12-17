
<?php
                $connect = mysqli_connect("localhost", "choimik1076", "dkffh4189", "choimik1076") or die("fail");

                $id = trim(strip_tags(addslashes( $_GET[name])));
                $pw = trim(strip_tags(addslashes( $_GET[pw])));
                $title = trim(strip_tags(addslashes( $_GET[title])));
                $content = trim(strip_tags(addslashes( $_GET[content])));
                $date = date('Y-m-d H:i:s');

                $URL = './index.php';


                $query = "insert into board (number,title, content, date, hit, id, password)
                        values(null,'$title', '$content', '$date',0, '$id', '$pw')";


                $result = mysqli_query($connect, $query);
                if($result){
?>                  <script>
                        alert("<?php echo "글이 등록되었습니다."?>");
                        location.replace("<?php echo $URL?>");
                    </script>
<?php
                }
                else{
                        echo "FAIL";
                }

                mysqli_close($connect);
?>
