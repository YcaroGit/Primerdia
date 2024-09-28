<?php
    require 'funciones.php';
    $email = $_POST['txtEmail'];
    $clave = $_POST['txtClave'];
    conectar ();

    if (validarLogin($email, $clave) )
        {
            if (esSuper())
            header ('location: ../Admin.php');
         else header ('Location: ../Panel.php');
            
        }  else {
      

     
?>
    <script>
        alert(' Revisa el email o contraseñas. ');
        location.href = "../index.html";
    </script>


<?php
   } desconectar();
     
?>