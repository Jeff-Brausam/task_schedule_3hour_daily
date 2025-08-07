$PathToScript = ""
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-NoProfile -ExecutionPolicy Bypass -File $PathToScript.ps1"
$trigger = New-ScheduledTaskTrigger -Once -At "08:00" -RepetitionInterval (New-TimeSpan -Hours 3) -RepetitionDuration (New-TimeSpan -Days 1)      
$principal = New-ScheduledTaskPrincipal -UserId "YOUR_USERNAME" -LogonType Interactive -RunLevel Highest
$settings = New-ScheduledTaskSettingsSet -Hidden -StartWhenAvailable
Register-ScheduledTask -TaskName "MyNewTask" -Action $action -Trigger $trigger -Settings $settings -Principal $principal