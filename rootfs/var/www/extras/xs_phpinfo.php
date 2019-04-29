<?php

define('ADMIN_USERNAME','admin');    // Admin Username
define('ADMIN_PASSWORD','admin');    // Admin Password
define('THOUSAND_SEPARATOR',true);

///////////////// Password protect ////////////////////////////////////////////////////////////////
if (!isset($_SERVER['PHP_AUTH_USER']) || !isset($_SERVER['PHP_AUTH_PW']) || $_SERVER['PHP_AUTH_USER'] != ADMIN_USERNAME ||$_SERVER['PHP_AUTH_PW'] != ADMIN_PASSWORD) {
  Header("WWW-Authenticate: Basic realm=\"PHP Info Login\"");
  Header("HTTP/1.0 401 Unauthorized");
  echo "<html><body><h1>Rejected!</h1><big>Wrong Username or Password!</big></body></html>";
  exit;
}

phpinfo();

?>
