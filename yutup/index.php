<?php
require_once("./i/header.php"); 
require_once("./i/queries.php"); 

?>
<main>
<div class="container">
    <div class="videoplayer">
        <video id="video" controls poster="<?php echo $thumbnail?>">
            <source src="<?php echo $file_name?>.mp4"  type="video/mp4">
            <source src="<?php echo $file_name?>.ogg" type="video/ogg">
            <source src="<?php echo $file_name?>.webm" type="video/webm">
        </video>
    </div>
    <div class="videoinfo">
        <!-- tags -->
            <p><table><tr><th></th></tr><tr><td><?php while($row3 = mysqli_fetch_array($result3)): echo $row3[3] . " "; endwhile?></td></tr></table></p>
        <!-- title -->
            <h1><?php echo $title?></h1>
        <!-- views, date, description -->
            <p><?php echo $reproductions?> views <span><?php echo $time_created?></span><span> <?php echo $description?></span></p>
        <!-- other info -->
        <p><?php echo $number_likes ?> LIKE<span> <?php echo $number_dislikes ?> DISLIKE</span></p>
           
    </div>

    <div class="channel">
       <h2> <?php echo $name_channel ?></h2>
       <p><?php echo $description_channel ?></p>
    </div>

    <div class="comments">
        <h3>Comments</h3>
    <p><?php echo $text_comment ?> <span><?php echo $time_text_comment ?></span></p>


    </div>
</div>

</main>

<?php 

require_once("./i/footer.php");

?>