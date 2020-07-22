Function New-ScheduledTaskFolder
    {
     Param(
         [Parameter(Mandatory=$true, Position=0)]
         [string]$TaskPath
           )

     $ErrorActionPreference = "stop"

     $scheduleObject = New-Object -ComObject schedule.service

     $scheduleObject.connect()

     $rootFolder = $scheduleObject.GetFolder("\")
        Try {$null = $scheduleObject.GetFolder($TaskPath)}
        Catch { $null = $rootFolder.CreateFolder($TaskPath) }
        Finally { $ErrorActionPreference = "continue" }
     }

     New-ScheduledTaskFolder dummyTest
