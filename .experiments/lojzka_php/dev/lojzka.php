<!doctype html>
<html lang="si">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <title></title>
    <style>
        .someMargins {  padding: 2%; 
        padding-top: 1%;	
        padding-bottom: 1%;	}

        .btn {  
        margin-top: 0.5rem;
        opacity: 0.9;
        }
    </style>
  </head>

  <body>
  <div class="someMargins">
      
    <div class="someMargins">
    <form method="post" action="lojzka.php">
    <div class="form-group">
        <label for="exampleFormControlTextarea1">Vsak naslov v svojo vrstico, primer: NAP-NASLOV JE TO-20211028-084-F1</label>
        <textarea class="form-control" name="input" id="exampleFormControlTextarea1" rows="5"><?php
        // Always check an input variable is set before you use it
        if (isset($_POST['input'])) {
        
        echo $_POST['input'];}
        
        ?></textarea>
    </div>
    <div class="form-group row"><div class="col-sm-10">

        <button class="btn btn-primary" type="submit">Preveri</button>
    </div></div>

    </form>
  </div>
   
    <?php

    // Always check an input variable is set before you use it
    if (isset($_POST['input'])) {
        
        $arr = array_filter(explode("\r\n", $_POST['input']));
        
        echo '<div class="someMargins"><pre class="form-group form-control">';
        foreach ($arr as &$value) {
            $value = trim($value);
            echo shell_exec("/home/ticho/bin/lojzka '$value' 2>&1");
        }
        echo '</pre></div>'; 
    
    } 

    ?>
   

  </div>


</body>
</html>
