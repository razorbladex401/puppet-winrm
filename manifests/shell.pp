# documentation goes here
Class winrm::shell (
  Boolean    $allow_remote_shell_access = true,
  Integer    $idle_timeout              = 7200000,
  Integer    $max_concurrent_users      = 2147483647,
  Integer    $max_shell_runtime         = 2147483647,
  Integer    $max_processes_per_shell   = 2147483647,
  Integer    $max_memory_per_shellmb    = 2147483647,
  Integer    $max_shells_per_user       = 2147483647,
){

  # lint:ignore:140chars
  exec { 'allowremoteshellaccess':
    command  => "Set-Item -Path WSMan:\\localhost\\Shell\\AllowRemoteShellAccess -Value ${allow_remote_shell_access}",
    provider => powershell,
    onlyif   => "if((Get-ChildItem -Path WSMan:\\localhost\\Shell\\AllowRemoteShellAccess).value -ne ${allow_remote_shell_access}){ exit 0 }else{ exit 1 }",
  }

  exec { 'idletimeout':
    command  => "Set-Item -Path WSMan:\\localhost\\Shell\\IdleTimeout -Value ${idle_timeout}",
    provider => powershell,
    onlyif   => "if((Get-ChildItem -Path WSMan:\\localhost\\Shell\\IdleTimeout).value -ne ${idle_timeout}){ exit 0 }else{ exit 1 }",
  }

  exec { 'maxconcurrentusers':
    command  => "Set-Item -Path WSMan:\\localhost\\Shell\\MaxConcurrentUsers -Value ${max_concurrent_users}",
    provider => powershell,
    onlyif   => "if((Get-ChildItem -Path WSMan:\\localhost\\Shell\\MaxConcurrentUsers).value -ne ${max_concurrent_users}){ exit 0 }else{ exit 1 }",
  }

  exec { 'maxshellruntime':
    command  => "Set-Item -Path WSMan:\\localhost\\Shell\\MaxShellRunTime -Value ${max_shell_runtime}",
    provider => powershell,
    onlyif   => "if((Get-ChildItem -Path WSMan:\\localhost\\Shell\\MaxShellRunTime).value -ne ${max_shell_runtime}){ exit 0 }else{ exit 1 }",
  }

  exec { 'maxprocessespershell':
    command  => "Set-Item -Path WSMan:\\localhost\\Shell\\MaxProcessesPerShell -Value ${max_processes_per_shell}",
    provider => powershell,
    onlyif   => "if((Get-ChildItem -Path WSMan:\\localhost\\Shell\\MaxProcessesPerShell).value -ne ${max_processes_per_shell}){ exit 0 }else{ exit 1 }",
  }

  exec { 'maxmemorypershellmb':
    command  => "Set-Item -Path WSMan:\\localhost\\Shell\\MaxMemoryPerShellMB -Value ${max_memory_per_shellmb}",
    provider => powershell,
    onlyif   => "if((Get-ChildItem -Path WSMan:\\localhost\\Shell\\MaxMemoryPerShellMB).value -ne ${max_memory_per_shellmb}){ exit 0 }else{ exit 1 }",
  }

  exec { 'maxshellsperuser':
    command  => "Set-Item -Path WSMan:\\localhost\\Shell\\MaxShellsPerUser -Value ${max_shells_per_user}",
    provider => powershell,
    onlyif   => "if((Get-ChildItem -Path WSMan:\\localhost\\Shell\\MaxShellsPerUser).value -ne ${max_shells_per_user}){ exit 0 }else{ exit 1 }",
  }
  # lint:endignore
}
