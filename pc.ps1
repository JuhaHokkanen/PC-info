$Size = Get-ChildItem $env:userprofile -Recurse | Measure-Object -Property Length -Sum | Select-Object -ExpandProperty Sum
$SizeMB = "{0:N2}" -f ($Size / 1MB)
$SizeGB = "{0:N2}" -f ($Size / 1GB)
$bios = Get-CIMInstance win32_OperatingSystem | Select PSComputername
$Proc = Get-CIMInstance Win32_processor |  Select-Object -First 1
$memory = Get-CIMInstance Win32_physicalmemory 
$system= Get-CIMInstance Win32_ComputerSystem
$localdisk=Get-CIMInstance Win32_Logicaldisk -filter "deviceid='C:'"

Write-Output ("Profilename:  " +  $env:USERNAME)
Write-Output ("Profile size (MB): " + $SizeMB)
Write-Output ("Profile size:(GB): " +  $SizeGB)
Write-Output ("ComputerName "         + $proc.SystemName)
Write-Output ("Model "                + $system.Model)
Write-Output ("Processor Number "     + $system.NumberOfProcessors)
Write-Output ("Processor Name "       + $proc.name)
Write-Output ("RAM (GB) "             + $system.TotalPhysicalMemory / 1GB)
Write-Output ("Used RAM slot "        + $memory.count)
Write-Output ("Local Disk C size "         + $localdisk.size / 1GB)

