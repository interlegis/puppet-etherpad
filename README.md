puppet-etherpad
===============

Etherpad installation and management module for Puppet.

Default parameters (undef parameters are required to be manually specified):


 $installdir = "/opt/etherpad-lite",
 $pagetitle = "Etherpad",
 $ip = "0.0.0.0",
 $port = "80",
 $sessionkey = undef,
 $dbtype = "postgres",
 $dbuser = undef,
 $dbhost = undef,
 $dbpasswd = undef,
 $dbname = "etherpad-lite",
 $defaultPadText = "Welcome to Etherpad!\\n\\nThis pad text is synchronized as you type, so that everyone viewing this page sees the same text. This allows you to collaborate seamlessly on documents!\\n\\nGet involved with Etherpad at http:\\/\\/etherpad.org\\n",
 $requireSession = false,
 $editOnly = false,
 $minify = true,
 $maxAge = 21600,
 $requireAuthentication = false,
 $requireAuthorization = false,
 $users = [ { name => admin, password => "changeme1", is_admin => "true" } ],
 $loggingLevel = "INFO",
 $logFolder = "/var/log/etherpad-lite",
