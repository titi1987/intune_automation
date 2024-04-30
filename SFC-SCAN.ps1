# Create a new scheduled task trigger to run weekly on Fridays at 17:00 PM
$pickliTrigger = New-ScheduledTaskTrigger -Weekly -DaysOfWeek Friday -At 17:00pm

# Create a new scheduled task action to execute the System File Checker with the "scannow" argument
$pickliAction = New-ScheduledTaskAction -Execute "SFC" -Argument "/Scannow"

# Set up the task settings: compatible with Windows 8 and newer, allows the task to start if on batteries, starts as soon as possible, and doesn't stop if switched to batteries
$pickliSetting = New-ScheduledTaskSettingsSet -Compatibility Win8 -AllowStartIfOnBatteries -StartWhenAvailable -DontStopIfGoingOnBatteries

# Combine the trigger, action, and settings into a new scheduled task with a description
$pickliTask = New-ScheduledTask -Trigger $pickliTrigger -Action $pickliAction -Settings $pickliSetting -Description "System File Checker weekly Fridays run at 5pm"

#Create/Register Scheduled Task
Register-ScheduledTask -TaskPath \PICKLI\ -TaskName "System File Checker weekly Fridays run at 5pm" -InputObject $pickliTask -User "NT AUTHORITY\SYSTEM"
