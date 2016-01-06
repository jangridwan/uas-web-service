<?php
function getConnection()
{
        $dbhost="127.0.0.1";
        $dbuser="root";
        $dbpass="ridwan";
        $dbname="uas-web";
        $dbh = new PDO("mysql:host=$dbhost;dbname=$dbname", $dbuser, $dbpass);
        $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        return $dbh;
}
