


taskkill /f /im trustedinstaller.exe
sc.exe stop trustedinstaller
cd\
c:
remove-item token
md token
$sp = read-host "enter program name"
save-module -name ntobjectmanager -path c:\token
install-module -name ntobjectmanager
set-ExecutionPolicy unrestricted
import-module ntobjectmanager
sc.exe start TrustedInstaller
Set-NtTokenPrivilege SeDebugPrivilege
$p = Get-NtProcess -Name TrustedInstaller.exe
$proc = New-Win32Process $sp -CreationFlags NewConsole -ParentProcess $p
write-host "complete!"
pause
