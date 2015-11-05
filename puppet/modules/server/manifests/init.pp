class server ( $hostname ) {

    # Few packages
    $packages = ["curl", "tidy", "screen", "vim", "htop", "tmux"]
    package { $packages:
        ensure  => latest,
        require => Exec['update'],
    }

    # ScreenRC
    file { ".screenrc":
        ensure  => file,
        path    => '/root/.screenrc',
        source  => 'puppet:///modules/server/.screenrc',
    }
    file { ".screenrc for vagrant":
        ensure  => file,
        path    => '/home/vagrant/.screenrc',
        source  => 'puppet:///modules/server/.screenrc',
    }

    # Tmux config
    file { ".tmux.conf":
        ensure  => file,
        path    => '/root/.tmux.conf',
        source  => 'puppet:///modules/server/.tmux.conf',
    }
    file { ".tmux.conf for vagrant":
        ensure  => file,
        path    => '/home/vagrant/.tmux.conf',
        source  => 'puppet:///modules/server/.tmux.conf',
    }

}
