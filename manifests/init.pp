class vimrc {
  file { '/etc/vim/vimrc.local':
    ensure => present,
    source => 'puppet:///modules/vimrc/vimrc',
    require => Package['vim'],
  }
  file {'/home/wa':
    ensure => directory,
    owner => 'wa',
    mode => "0750",
  }
  file {'/home/wa/.vim':
    recurse => true,
    ensure => 'directory',
    source => 'puppet:///modules/vimrc',
    require => User['wa'],
  }
  package {'vim':
    ensure => latest,
  }
  user { 'wa':
      ensure => 'present',
      comment => 'wa,,,',
      home => '/home/wa',
      managehome => true,
      password => '$1$8MXElfGt$7y3XfgMsrroNoI.hNV94p1',
      shell => '/bin/bash',
      groups => ['adm','sudo','cdrom','dip','plugdev','lpadmin','sambashare'],
      
  }


}
