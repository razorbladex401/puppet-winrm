# documentation goes here
Class winrm::service (
  String           $rootsddl                           = 'O:NSG:BAD:P(A;;GA;;;BA)(A;;GR;;;IU)S:P(AU;FA;GA;;;WD)(AU;SA;GXGW;;;WD)',
  Integer          $max_concurrent_operations          = 4294967295,
  Integer          $max_concurrent_operations_per_user = 1500,
  Integer          $enumeration_timeoutms              = 240000,
  Integer          $max_connections                    = 300,
  Integer          $maxpacketretrievaltimeseconds      = 120,
  Boolean          $allow_unencrypted                  = true,
  [Array]String    $ipv4filter                         = '*',
  [Array]String    $ipv6filter                         = '*',
  Boolean          $enablecompatibilityhttplistener    = false,
  Boolean          $enablecompatibilityhttpslistener   = false,
  String           $certificate_thumbprint             = '',
  Boolean          $allow_remote_access                = true,
  Boolean          $service_auth_basic                 = true,
  Boolean          $service_auth_digest                = true,
  Boolean          $service_auth_kerberos              = true,
  Boolean          $service_auth_negotiate             = true,
  Boolean          $service_auth_certificate           = false,
  Boolean          $service_auth_credssp               = false,
  String           $service_auth_cbthardeninglevel     = 'Relaxed',
){

  # lint:ignore:140chars
  exec { 'roodsddl':
    command  => "Set-Item -Path WSMan:\localhost\Service\RootSDDL -Value ${rootsddl}",
    provider => powershell,
    onlyif   => "if((Get-ChildItem -Path WSMan:\\localhost\\Service\\RootSDDL).value -ne ${rootsddl}){ exit 0 }else{ exit 1 }",
  }

  exec { 'maxconcurrentoperations':
    command  => "Set-Item -Path WSMan:\localhost\Service\MaxConcurrentOperations -Value ${max_concurrent_operations}",
    provider => powershell,
    onlyif   => "if((Get-ChildItem -Path WSMan:\\localhost\\Service\\MaxConcurrentOperations).value -ne ${max_concurrent_operations}){ exit 0 }else{ exit 1 }",
  }

  exec { 'maxconcurrentoperationsperuser':
    command  => "Set-Item -Path WSMan:\localhost\Service\MaxConcurrentOperationsPerUser -Value ${max_concurrent_operations_per_user}",
    provider => powershell,
    onlyif   => "if((Get-ChildItem -Path WSMan:\\localhost\\Service\\MaxConcurrentOperationsPerUser).value -ne ${max_concurrent_operations_per_user}){ exit 0 }else{ exit 1 }",
  }

  exec { 'enumerationtimeoutms':
    command  => "Set-Item -Path WSMan:\localhost\Service\EnumerationTimeoutms -Value ${enumeration_timeoutms}",
    provider => powershell,
    onlyif   => "if((Get-ChildItem -Path WSMan:\\localhost\\Service\\EnumerationTimeoutms).value -ne ${enumeration_timeoutms}){ exit 0 }else{ exit 1 }",
  }

  exec { 'maxconnections':
    command  => "Set-Item -Path WSMan:\localhost\Service\MaxConnections -Value ${max_connections}",
    provider => powershell,
    onlyif   => "if((Get-ChildItem -Path WSMan:\\localhost\\Service\\MaxConnections).value -ne ${max_connections}){ exit 0 }else{ exit 1 }",
  }

  exec { 'maxpacketretrievaltimeseconds':
    command  => "Set-Item -Path WSMan:\localhost\Service\MaxPacketRetrievalTimeSeconds -Value ${maxpacketretrievaltimeseconds}",
    provider => powershell,
    onlyif   => "if((Get-ChildItem -Path WSMan:\\localhost\\Service\\MaxPacketRetrievalTimeSeconds).value -ne ${maxpacketretrievaltimeseconds}){ exit 0 }else{ exit 1 }",
  }

  exec { 'allowunencrypted':
    command  => "Set-Item -Path WSMan:\localhost\Service\AllowUnencrypted -Value ${false}",
    provider => powershell,
    onlyif   => "if((Get-ChildItem -Path WSMan:\\localhost\\Service\\AllowUnencrypted).value -ne ${AllowUnencrypted}){ exit 0 }else{ exit 1 }",
  }

  exec { 'ipv4filter':
    command  => "Set-Item -Path WSMan:\localhost\Service\IPv4Filter -Value ${ipv4filter}",
    provider => powershell,
    onlyif   => "if((Get-ChildItem -Path WSMan:\\localhost\\Service\\IPv4Filter).value -ne ${ipv4filter}){ exit 0 }else{ exit 1 }",
  }

  exec { 'ipv6filter':
    command  => "Set-Item -Path WSMan:\localhost\Service\IPv6Filter -Value ${ipv6filter}",
    provider => powershell,
    onlyif   => "if((Get-ChildItem -Path WSMan:\\localhost\\Service\\IPv6Filter).value -ne ${ipv6filter}){ exit 0 }else{ exit 1 }",
  }

  exec { 'enablecompatibilityhttplistener':
    command  => "Set-Item -Path WSMan:\localhost\Service\EnableCompatibilityHttpListener -Value ${enablecompatibilityhttplistener}",
    provider => powershell,
    onlyif   => "if((Get-ChildItem -Path WSMan:\\localhost\\Service\\EnableCompatibilityHttpListener).value -ne ${enablecompatibilityhttplistener}){ exit 0 }else{ exit 1 }",
  }

  exec { 'enablecompatibilityhttpslistener':
    command  => "Set-Item -Path WSMan:\localhost\Service\EnableCompatibilityHttpsListener -Value ${enablecompatibilityhttpslistener}",
    provider => powershell,
    onlyif   => "if((Get-ChildItem -Path WSMan:\\localhost\\Service\\EnableCompatibilityHttpsListener).value -ne ${enablecompatibilityhttpslistener}){ exit 0 }else{ exit 1 }",
  }

  if !empty($certificate_thumbprint) {
    exec { 'certificatethumbprint':
      command  => "Set-Item -Path WSMan:\localhost\Service\CertificateThumbprint -Value ${certificate_thumbprint}",
      provider => powershell,
      onlyif   => "if((Get-ChildItem -Path WSMan:\\localhost\\Service\\CertificateThumbprint).value -ne ${certificate_thumbprint}){ exit 0 }else{ exit 1 }",
    }
  }

  exec { 'allowremoteaccess':
    command  => "Set-Item -Path WSMan:\localhost\Service\AllowRemoteAccess -Value ${allow_remote_access}",
    provider => powershell,
    onlyif   => "if((Get-ChildItem -Path WSMan:\\localhost\\Service\\AllowRemoteAccess).value -ne ${allow_remote_access}){ exit 0 }else{ exit 1 }",
  }

  exec { 'service_auth_basic':
    command  => "Set-Item -Path WSMan:\localhost\Service\Auth\Basic -Value ${service_auth_basic}",
    provider => powershell,
    onlyif   => "if((Get-ChildItem -Path WSMan:\\localhost\\Service\\Auth\Basic).value -ne ${service_auth_basic}){ exit 0 }else{ exit 1 }",
  }

  exec { 'service_auth_digest':
    command  => "Set-Item -Path WSMan:\localhost\Service\Auth\Digest -Value ${service_auth_digest}",
    provider => powershell,
    onlyif   => "if((Get-ChildItem -Path WSMan:\\localhost\\Service\\Auth\Digest).value -ne ${service_auth_digest}){ exit 0 }else{ exit 1 }",
  }

  exec { 'service_auth_kerberos':
    command  => "Set-Item -Path WSMan:\localhost\Service\Auth\Kerberos -Value ${service_auth_kerberos}",
    provider => powershell,
    onlyif   => "if((Get-ChildItem -Path WSMan:\\localhost\\Service\\Auth\Kerberos).value -ne ${service_auth_kerberos}){ exit 0 }else{ exit 1 }",
  }

  exec { 'service_auth_negotiate':
    command  => "Set-Item -Path WSMan:\localhost\Service\Auth\Negotiate -Value ${service_auth_negotiate}",
    provider => powershell,
    onlyif   => "if((Get-ChildItem -Path WSMan:\\localhost\\Service\\Auth\Negotiate).value -ne ${service_auth_negotiate}){ exit 0 }else{ exit 1 }",
  }

  exec { 'service_auth_certificate':
    command  => "Set-Item -Path WSMan:\localhost\Service\Auth\Certificate -Value ${service_auth_certificate}",
    provider => powershell,
    onlyif   => "if((Get-ChildItem -Path WSMan:\\localhost\\Service\\Auth\Certificate).value -ne ${service_auth_certificate}){ exit 0 }else{ exit 1 }",
  }

  exec { 'service_auth_credssp':
    command  => "Set-Item -Path WSMan:\localhost\Service\Auth\CredSSP -Value ${service_auth_credssp}",
    provider => powershell,
    onlyif   => "if((Get-ChildItem -Path WSMan:\\localhost\\Service\\Auth\CredSSP).value -ne ${service_auth_credssp}){ exit 0 }else{ exit 1 }",
  }

  exec { 'service_auth_cbthardeninglevel':
    command  => "Set-Item -Path WSMan:\localhost\Service\Auth\CbtHardeningLevel -Value ${service_auth_cbthardeninglevel}",
    provider => powershell,
    onlyif   => "if((Get-ChildItem -Path WSMan:\\localhost\\Service\\Auth\CbtHardeningLevel).value -ne ${service_auth_cbthardeninglevel}){ exit 0 }else{ exit 1 }",
  }
  # lint:endignore
}
