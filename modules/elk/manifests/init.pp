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

  exec { "install kopf":
    cwd => "/home/vagrant",
    command => "sudo /usr/share/elasticsearch/bin/plugin -install lmenezes/elasticsearch-kopf",
    require => Exec['install-elasticsearch']
  }

  exec { "download-kibana4":
    cwd => "/opt/sites/kibana",
    command => "wget https://download.elasticsearch.org/kibana/kibana/kibana-4.0.2-linux-x64.tar.gz",
    creates => "/opt/sites/kibana/kibana-4.0.2-linux-x64.tar.gz",
  }

  exec { "install-kibana4":
    # unless => 'service logstash status',
    cwd => "/opt/sites/kibana",
    command => "tar xvfz kibana-4.0.2-linux-x64.tar.gz && mv /opt/sites/kibana/kibana*64/* /opt/sites/kibana",
    require => Exec["download-kibana4"],
  }

  exec { "download-logstash":
    cwd => "/var/cache/apt/archives",
    command => "wget http://download.elastic.co/logstash/logstash/packages/debian/logstash_1.5.0-rc3-1_all.deb",
    creates => "/var/cache/apt/archives/logstash_1.5.0-rc3-1_all.deb",
  }

  exec { "install-logstash":
    unless => 'service logstash status',
    cwd => "/var/cache/apt/archives",
    command => "dpkg -i logstash_1.5.0-rc3-1_all.deb && update-rc.d logstash defaults 95 10 && /etc/init.d/logstash restart",
    require => Exec["download-logstash"]
  }

}