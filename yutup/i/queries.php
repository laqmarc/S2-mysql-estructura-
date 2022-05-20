
<?php

//VIDEO QUERIES
$query = "SELECT * FROM `video`";
$result1 = mysqli_query($con, $query);
while($row1 = mysqli_fetch_array($result1)):;
$id=$row1[0];
$title=$row1[1];
$description=$row1[2];
$file_name=$row1[4];
$thumbnail=$row1[6];
$reproductions=$row1[7];
$time_created=$row1[10];
endwhile;


//USER QUERIES
$query2 = "SELECT * FROM `user`";
$result2 = mysqli_query($con, $query2);
while($row2 = mysqli_fetch_array($result2)):;
$id_user=$row2[0];
$email=$row2[1];
$username=$row2[3];
$birth_date=$row2[4];
$gender_id=$row2[5];
$country=$row2[6];
$cp=$row2[7];
$time_created_user=$row2[8];
endwhile;


//VIDEO TAG QUERIES
$query3 = "SELECT * FROM video_tag 
LEFT JOIN tags
ON tags.id = video_tag.id_tag
WHERE id_video = 2";
$result3 = mysqli_query($con,$query3);

//CHANNEL QUERIES
$query4 = "SELECT * FROM channel
WHERE user_id = 1";
$result4 = mysqli_query($con,$query4);
while($row4 = mysqli_fetch_array($result4)):;
$name_channel=$row4[1];
$description_channel=$row4[2];
endwhile;

//VIDEO-LIKE QUERIES
$query5 = "SELECT count(video_id) FROM video_like WHERE video_id = 2 AND state_id = 1";
$result5 = mysqli_query($con,$query5);
while($row5 = mysqli_fetch_array($result5)):;
$number_likes = $row5[0];
endwhile;

//VIDEO-DISLIKE QUERIES
$query6 = "SELECT count(video_id) FROM video_like WHERE video_id = 2 AND state_id = 2";
$result6 = mysqli_query($con,$query6);
while($row6 = mysqli_fetch_array($result6)):;
$number_dislikes = $row6[0];
endwhile;

//VIDEO-COMMENTS
$query7 = "SELECT text, time_created from video_comments WHERE video_id = 2";
$result7 = mysqli_query($con,$query7);
while($row7 = mysqli_fetch_array($result7)):;
$text_comment = $row7[0];
$time_text_comment = $row7[1];
endwhile;
?>
