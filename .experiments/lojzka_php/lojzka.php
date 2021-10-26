<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <title>preverba</title>
    <style>
        .someMargins {  padding: 2%; 
        padding-top: 1%;	
        padding-bottom: 1%;	}
    </style>
  </head>

  <body>
  <div class="someMargins">
   
    <?php

    // Always check an input variable is set before you use it
    if (isset($_POST['input'])) {
      // Escape any html characters
      //echo htmlentities($_POST['input']);

      $arr = array_filter(explode("\r\n", $_POST['input']));

      //print_r(array_values($arr));

     

      echo "<pre>".shell_exec('/home/b/bin/lojzka '.join(' ',$arr)) ."</pre>";
      //shell_exec('sh get_countries.sh '.join(' ',$array));

      /*foreach ($arr as &$value) {
        //echo "$value\n<br>";
       
        echo "<pre>".shell_exec("/home/b/bin/lojzka '$value' 2>&1")."</pre>";
        
      } */
    
    } 

    ?>
   

  </div>


</body>
</html>