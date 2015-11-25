class apache ( $server_name, $document_root ) {

    include apache::service
    class { "apache::install" :
        server_name   => "$server_name",
        document_root => "$document_root",
    } ~> Class['apache::service']

}
