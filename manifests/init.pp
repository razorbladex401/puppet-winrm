# Class: winrm
#
#
#
class winrm (
  Integer $max_envelope_sizekb   = 500,
  Integer $max_timeoutms         = 60000,
  Integer $max_batch_items       = 32000,
  Integer $max_provider_requests = 4294967295,
){

  # lint:ignore:140chars
  exec { 'MaxEnvelopeSizekb':
    command  => "Set-Item -Path WSMan:\localhost\MaxEnvelopeSizekb -Value ${max_envelope_sizekb}",
    provider => powershell,
    onlyif   => "if((Get-ChildItem -Path WSMan:\\localhost\\MaxEnvelopeSizekb).value -ne ${max_envelope_sizekb}){ exit 0 }else{ exit 1 }",
  }

  exec { 'MaxTimeoutms':
    command  => "Set-Item -Path WSMan:\localhost\MaxTimeoutms -Value ${max_timeoutms}",
    provider => powershell,
    onlyif   => "if((Get-ChildItem -Path WSMan:\\localhost\\MaxEnvelopeSizekb).value -ne ${max_timeoutms}){ exit 0 }else{ exit 1 }",
  }

  exec { 'MaxBatchItems':
    command  => "Set-Item -Path WSMan:\localhost\MaxBatchItems -Value ${max_batch_items}",
    provider => powershell,
    onlyif   => "if((Get-ChildItem -Path WSMan:\\localhost\\MaxBatchItems).value -ne ${max_batch_items}){ exit 0 }else{ exit 1 }",
  }

  exec { 'MaxProviderRequests':
    command  => "Set-Item -Path WSMan:\localhost\MaxProviderRequests -Value ${max_provider_requests}",
    provider => powershell,
    onlyif   => "if((Get-ChildItem -Path WSMan:\\localhost\\MaxProviderRequests).value -ne ${max_provider_requests}){ exit 0 }else{ exit 1 }",
  }
  # lint:endignore


  include ::winrm::client
  include ::winrm::service
  include ::winrm::shell

  Class['::winrm::client']
  ->Class['::winrm::service']
  ->Class['::winrm::shell']

}
