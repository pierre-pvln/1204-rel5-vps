
<!-- Do not change this file. It's managed bij puppet.-->

<html>
<head>
<title>Get Site Info </title>
</head>
<body>

<?php
$server_os = php_uname('s');		      //  the software version of the os of the server
$server_version = php_uname('v');
$server_host = php_uname('n');

$database_server="";	//  the name of the server that is running the database
$database_sw="";		//  the software version of the database
$database_uid="";		//  the userid use dto connect to the database
$database_name="";		//  the of the database that contains the website

$web_server = getenv('server_name'); 	  //  the name of the server where the website is hosted 
$web_sw     = getenv('server_software');  //  the software version of the webserver
$web_user   = get_current_user();	      //  the username that the webserver process uses

if (extension_loaded('posix')) {
  $web_uid    = posix_getpwuid(getmyuid()); //  the user information in an array based on the uid
  $web_gid    = posix_getgrgid(getmygid()); //	the groupname that the webserver process uses
} else {
  $web_uid    = getmyuid();                 //  the value of the user 
  $web_gid    = getmygid();                 //	the value of the groupname that the webserver process uses
}
$web_root   = getenv('document_root');    //  the root directory that holds the website files 

$php_sw = phpversion();				      //  the version of the php software
$php_interface = php_sapi_name();

echo "<table>";
echo "<tr><td>Server OS:</td><td>$server_os</td></tr>";
echo "<tr><td>Server version:</td><td>$server_version</td></tr>";
echo "<tr><td>Server Hostname:</td><td>$server_host</td></tr>";
echo "<tr><td></td><td></td></tr>";
echo "<tr><td>Database Server:</td><td>$database_server</td></tr>";
echo "<tr><td>Database Software:</td><td>$database_sw</td></tr>";
echo "<tr><td>Database User:</td><td>$database_uid</td></tr>";
echo "<tr><td>Database Name:</td><td>$database_name</td></tr>";
echo "<tr><td></td><td></td></tr>";
echo "<tr><td>Webserver Name:</td><td>$web_server</td></tr>";
echo "<tr><td>Webserver Software:</td><td>$web_sw</td></tr>";
echo "<tr><td>Webserver Username:</td><td>$web_user</td></tr>";
echo "<tr><td>Webserver UserID:</td><td>" . $web_uid['name'] . "</td></tr>";
echo "<tr><td>Webserver GroupID:</td><td>" . $web_gid['name'] . "</td></tr>";
echo "<tr><td>Webserver Document Root:</td><td>$web_root</td></tr>";
echo "<tr><td></td><td></td></tr>";
echo "<tr><td>PHP Software:</td><td>$php_sw</td></tr>";
echo "<tr><td>PHP Interface:</td><td>$php_interface</td></tr>";
echo "</table>"; 

echo "<pre>";
print_r( get_loaded_extensions() );
echo "</pre>";

//echo "<pre>";
//print_r( phpinfo() );
//echo "</pre>";

error_reporting(E_ALL);
$disabled_functions = ini_get('disable_functions');
if ($disabled_functions!="") {
  $arr = explode(",", $disabled_functions);
  sort($arr);
  echo "Disabled Functions:</br>";
  for ($i=0; $i<count($arr); $i++)
    {
    echo $i." - ".$arr[$i]."</br>";
    }
} else {
    echo "No functions disabled";
}


// TODO: store the information in a file



?>

</body>
</html>