#Setup Trigger, Task, Settings

$pickliTrigger = New-ScheduledTaskTrigger -Weekly -DaysOfWeek Friday -At 17:00pm
$pickliAction = New-ScheduledTaskAction -Execute "SFC" -Argument "/Scannow"
$pickliSetting = New-ScheduledTaskSettingsSet -Compatibility Win8 -AllowStartIfOnBatteries -StartWhenAvailable -DontStopIfGoingOnBatteries

$pickliTask = New-ScheduledTask -Trigger $pickliTrigger -Action $pickliAction -Settings $pickliSetting -Description "System File Checker weekly Fridays run at 5pm"

#Create/Register Scheduled Task
Register-ScheduledTask -TaskPath \PICKLI\ -TaskName "System File Checker weekly Fridays run at 5pm" -InputObject $pickliTask -User "NT AUTHORITY\SYSTEM"