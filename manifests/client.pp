# documentation goes here
Class winrm::client (
  Integer       $network_delayms         = 5000,
  String        $urlprefix               = wsman,
  Boolean       $allow_unencrypted       = true,
  [Array]String $trustedhosts            = [],
  Boolean       $client_auth_basic       = true,
  Boolean       $client_auth_digest      = true,
  Boolean       $client_auth_kerberos    = true,
  Boolean       $client_auth_negotiate   = true,
  Boolean       $client_auth_certificate = true,
  Boolean       $client_auth_credssp     = true,
  Integer       $default_http_port       = 5985,
  Integer       $default_https_port      = 5986,
){
  # lint:ignore:140chars
  exec { 'networkdelaysms':
    command  => "Set-Item -Path WSMan:\localhost\Client\NetworkDelayms -Value ${network_delayms}",
    provider => powershell,
    onlyif   => "if((Get-ChildItem -Path WSMan:\\localhost\\Client\\NetworkDelayms).value -ne ${network_delayms}){ exit 0 }else{ exit 1 }",
  }

  exec { 'urlprefix':
    command  => "Set-Item -Path WSMan:\localhost\Client\URLPrefix -Value ${urlprefix}",
    provider => powershell,
    onlyif   => "if((Get-ChildItem -Path WSMan:\\localhost\\Client\\URLPrefix).value -ne ${urlprefix}){ exit 0 }else{ exit 1 }",
  }

  exec { 'allowunencrypted':
    command  => "Set-Item -Path WSMan:\localhost\Client\AllowUnencrypted -Value ${allow_unencrypted}",
    provider => powershell,
    onlyif   => "if((Get-ChildItem -Path WSMan:\\localhost\\Client\\AllowUnencrypted).value -ne ${allow_unencrypted}){ exit 0 }else{ exit 1 }",
  }

  if !empty($trustedhosts) {
    exec { 'trustedhosts':
      command  => "Set-Item -Path WSMan:\localhost\Client\TrustedHosts -Value ${trusted_hosts}",
      provider => powershell,
      onlyif   => "if((Get-ChildItem -Path WSMan:\\localhost\\Client\\TrustedHosts).value -ne ${trusted_hosts}){ exit 0 }else{ exit 1 }",
    }
  }

  exec { 'client_auth_basic':
    command  => "Set-Item -Path WSMan:\localhost\Client\Auth\Basic -Value ${client_auth_basic}",
    provider => powershell,
    onlyif   => "if((Get-ChildItem -Path WSMan:\\localhost\\Client\\Auth\\Basic).value -ne ${client_auth_basic}){ exit 0 }else{ exit 1 }",
  }

  exec { 'client_auth_digest':
    command  => "Set-Item -Path WSMan:\localhost\Client\Auth\Digest -Value ${client_auth_digest}",
    provider => powershell,
    onlyif   => "if((Get-ChildItem -Path WSMan:\\localhost\\Client\\Auth\\Digest).value -ne ${client_auth_digest}){ exit 0 }else{ exit 1 }",
  }

  exec { 'client_auth_kerberos':
    command  => "Set-Item -Path WSMan:\localhost\Client\Auth\Kerberos -Value ${client_auth_kerberos}",
    provider => powershell,
    onlyif   => "if((Get-ChildItem -Path WSMan:\\localhost\\Client\\Auth\\Kerberos).value -ne ${client_auth_kerberos}){ exit 0 }else{ exit 1 }",
  }

  exec { 'client_auth_negotiate':
    command  => "Set-Item -Path WSMan:\localhost\Client\Auth\Negotiate -Value ${client_auth_negotiate}",
    provider => powershell,
    onlyif   => "if((Get-ChildItem -Path WSMan:\\localhost\\Client\\Auth\\Negotiate).value -ne ${client_auth_negotiate}){ exit 0 }else{ exit 1 }",
  }

  exec { 'client_auth_certificate':
    command  => "Set-Item -Path WSMan:\localhost\Client\Auth\Certificate -Value ${client_auth_certificate}",
    provider => powershell,
    onlyif   => "if((Get-ChildItem -Path WSMan:\\localhost\\Client\\Auth\\Certificate).value -ne ${client_auth_certificate}){ exit 0 }else{ exit 1 }",
  }

  exec { 'client_auth_credssp':
    command  => "Set-Item -Path WSMan:\localhost\Client\Auth\CredSSP -Value ${client_auth_credssp}",
    provider => powershell,
    onlyif   => "if((Get-ChildItem -Path WSMan:\\localhost\\Client\\Auth\\CredSSP).value -ne ${client_auth_credssp}){ exit 0 }else{ exit 1 }",
  }

  exec { 'default_http_port':
    command  => "Set-Item -Path WSMan:\localhost\Client\DefaultPorts\HTTP -Value ${default_http_port}",
    provider => powershell,
    onlyif   => "if((Get-ChildItem -Path WSMan:\\localhost\\Client\\DefaultPorts\\HTTP).value -ne ${default_http_port}){ exit 0 }else{ exit 1 }",
  }

  exec { 'default_https_port':
    command  => "Set-Item -Path WSMan:\localhost\Client\DefaultPorts\HTTPS -Value ${default_https_port}",
    provider => powershell,
    onlyif   => "if((Get-ChildItem -Path WSMan:\\localhost\\Client\\DefaultPorts\\HTTPS).value -ne ${default_https_port}){ exit 0 }else{ exit 1 }",
  }

  # lint:endignore
}
