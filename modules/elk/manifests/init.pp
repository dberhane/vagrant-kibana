class elk {

  file { ["/opt/sites", "/opt/sites/kibana", "/opt/sites/test"]:
    ensure  => "directory",
    owner   => "vagrant",
    group   => "vagrant",
    mode    => 755,
    recurse => true,
  }

  exec { "install-java8":
    command => "add-apt-repository -y ppa:webupd8team/java && sudo apt-get update && echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections && echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections && sudo apt-get -y install oracle-java8-installer",
    require => Class["bootstrap"]
  }

  exec { "install-elasticsearch":
    unless => 'service elasticsearch status',
   # cwd => "/home/vagrant",
    command => "wget -O - http://packages.elasticsearch.org/GPG-KEY-elasticsearch | sudo apt-key add - && echo 'deb http://packages.elasticsearch.org/elasticsearch/1.4/debian stable main' | sudo tee /etc/apt/sources.list.d/elasticsearch.list && sudo apt-get update && sudo apt-get -y install elasticsearch=1.4.4",
  }

# custom configuration
  file{ '/etc/elasticsearch/elasticsearch.yml' :
    ensure => present,
    source => 'puppet:///modules/elk/elasticsearch.yml',
    require => Exec["install-elasticsearch"]
  }

# restart elasticsearch service
  service { "elasticsearch":
    ensure => running,
    require => [Exec['install-elasticsearch'], File['/etc/elasticsearch/elasticsearch.yml']],
  }


  exec { "download-kibana4":
    cwd => "/home/vagrant",
    command => "wget https://download.elasticsearch.org/kibana/kibana/kibana-4.0.1-linux-x64.tar.gz",
    creates => "/home/vagrant/kibana-4.0.1-linux-x64.tar.gz",
  }

}