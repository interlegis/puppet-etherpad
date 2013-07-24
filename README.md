puppet-etherpad
===============

Etherpad installation and management module for Puppet.

Default parameters (undef parameters are required to be manually specified):


 $installdir = "/opt/etherpad-lite", <br>
 $pagetitle = "Etherpad", <br>
 $ip = "0.0.0.0", <br>
 $port = "80", <br>
 $sessionkey = undef, <br>
 $dbtype = "postgres", <br>
 $dbuser = undef, <br>
 $dbhost = undef, <br>
 $dbpasswd = undef, <br>
 $dbname = "etherpad-lite", <br>
 $defaultPadText = "Welcome to Etherpad!\\n\\nThis pad text is synchronized as you type, so that everyone viewing this page sees the same text. This allows you to collaborate seamlessly on documents!\\n\\nGet involved with Etherpad at http:\\/\\/etherpad.org\\n", <br>
 $requireSession = false, <br>
 $editOnly = false, <br>
 $minify = true, <br>
 $maxAge = 21600, <br>
 $requireAuthentication = false, <br>
 $requireAuthorization = false, <br>
 $users = [ { name => admin, password => "changeme1", is_admin => "true" } ], <br>
 $loggingLevel = "INFO", <br>
 $logFolder = "/var/log/etherpad-lite",<br> 
