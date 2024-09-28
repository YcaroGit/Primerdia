<?php
   $conexion = null;

   function conectar ()
   {
        global $conexion;
        $conexion = mysqli_connect ( 'localhost','root','','animales_cuidadores' );
        mysqli_set_charset ($conexion, 'utf8');
   }
   
    //function getTodosANIMALES ()
   // {
   //     global $conexion;
   //     $respuesta = mysqli_query ($conexion, " SELECT * FROM ANIMALES");
  //      
  //      return $respuesta->fetch_all();
   // }
    function getANIMALESPorUser ()
        {
            global $conexion;
            //session_start();
            $respuesta = mysqli_query ($conexion, "SELECT A.nombre, A.fechaNacimiento, A.genero FROM asignacion P 
            INNER JOIN animales A ON P.idAnimal = A.idanimal WHERE EMAIL='".$_SESSION['email']."'");
            
            return $respuesta->fetch_all();
    }

    function getCuidador ()
    {
        global $conexion;
        //session_start();
        $respuesta = mysqli_query ($conexion, "SELECT * FROM CUIDADOR WHERE Super<>1");
        return $respuesta->fetch_all();
}
    function getnombrecuidador ()/////para poder seguir..... sin array--
    {
    global $conexion;
    $respuesta = mysqli_query($conexion, "SELECT nombre FROM CUIDADOR");
    $nombres = '';
    while ($row = mysqli_fetch_assoc($respuesta)) 
    {$nombres .= $row['nombre'] . ', '; }
    $nombres = rtrim($nombres, ', ');
    return $nombres;
    }

    function gettodosHABITATS ()
    {
        global $conexion;
        $respuesta = mysqli_query ($conexion, " SELECT * FROM HABITATS");
        
        return $respuesta->fetch_all();
    }
    

    function validarLogin ($email, $clave,)
    {
        global $conexion;
        $consulta = "SELECT * FROM CUIDADOR WHERE email = '" .$email."' AND clave='".$clave."'";
        $respuesta = mysqli_query ($conexion, $consulta);

        if ($fila = mysqli_fetch_row($respuesta))
        {
            session_start();
             $_SESSION['email'] = $email;
             $_SESSION['Super'] = $fila[5];
             return true;
        }
        return false;
    }

    function esSuper()
        {
            global $conexion;
            //session_start();
            return $_SESSION['Super'];

        }

       

    function haIniciadoSesion ()
    {
        global $conexion;
        session_start();

        return isset ( $_SESSION['email'] );
    }

    function desconectar ()
    {
        global $conexion;
        mysqli_close($conexion);
    }



?>