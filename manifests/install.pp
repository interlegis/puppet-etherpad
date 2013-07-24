#init.pp

class etherpad::install inherits etherpad {

	$prereqs = [
		"gzip",
		"git-core",
		"curl",
		"build-essential",
		"libssl-dev",
		"pkg-config",
		"unzip",
		"apache2-utils",
		"abiword",
        ]

	#Install NodeJS PPA
	include apt
        apt::key {"C7917B12":
                keyserver => "keyserver.ubuntu.com",
        }

        apt::ppa { "chris-lea":
                ensure => present,
                key => "C7917B12",
                ppa => "node.js",
                require => Apt::Key["C7917B12"],
        }


        #install Prereqs
        package { $prereqs:
                ensure => present,
        }

	#Install NodeJS
	package { "nodejs": 
		ensure => present, 
		require => Apt::Ppa["chris-lea"],
	}

	user { 'etherpad':
        	ensure => 'present',
		home => '/home/etherpad',
		managehome => true,
    	}

	file { "$installdir":
		owner => "etherpad", group => "etherpad", 
		recurse => true, 
		ensure => "directory",
		require => Package[$prereqs],
    	}

	exec { "git clone etherpad":
                cwd => "$installdir",
                command => "git clone https://github.com/interlegis/etherpad-lite.git .",
                creates => "$installdir/.git",
                logoutput => true,
                timeout => 600,
                require => File[$installdir],
        }

	file { "$installdir/settings.json":
                owner => 'etherpad', group => 'etherpad', mode => '440',
                content => template('etherpad/settings.json.erb'),
                require => File[$installdir],
        }
	
	file { "/etc/init.d/etherpad-lite":
                owner => 'root', group => 'root', mode => '755',
                content => template('etherpad/initscript.erb'),
                require => Exec["git clone etherpad"],
        }

	
	file { $logFolder:
                owner => 'etherpad', group => 'etherpad', mode => '664',
		ensure => directory,
                require => Exec["git clone etherpad"],
	}

	service { "etherpad-lite":
        	ensure => running,
        	enable => true,
        	hasstatus => true,
        	require => [
			Package[$prereqs],
			Exec["git clone etherpad"],
			File["/etc/init.d/etherpad-lite"],
			File[$logFolder],
		],
    	}

}       
