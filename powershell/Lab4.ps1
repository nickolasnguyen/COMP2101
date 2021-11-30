echo "Computer System Information"
get-ciminstance win32_computersystem|format-list

echo "Operating System Information"
get-ciminstance win32_operatingsystem|format-list name,version

echo "Processor Information"
get-ciminstance win32_processor|format-list Description, MaxClockSpeed, NumberOfCores, L1CacheSize, L2CacheSize, L3CacheSize

echo "RAM Information"
get-ciminstance win32_physicalmemory| format-table Vendor, Description, Capacity, BankLabel

echo "Disk Information"
$diskdrives = Get-CIMINstance CIM_diskdrive
foreach ($disk in $diskdrives){
    $partitions = $disk|get-cimassociatedinstance -resultclassname CIM_Diskpartition
    foreach ($partition in $partitions){
        $logicaldisks = $partition | Get-CimAssociatedInstance -resultclassname CIM_logicaldisk
        foreach ($logicaldisk in $logicaldisks) {
            new-object -typename psobject -property @{Manufacturer=$disk.Manufacturer
                                                      Location=$partition.deviceid
                                                      drive=$logicaldisk.deviceid
                                                      "Size(GB)"=$logicaldisks.size / 1gb -as [int]
                                                      }
        }
   }
}
Echo " "
Echo "Network Adapter Configuration"
get-ciminstance win32_networkadapterconfiguration | where-object ipenabled | format-table description,Index,IPAddress,IPSubnet, DNSDomain, DNSServerSearchOrder

Echo "Video Card Information"
get-ciminstance win32_videocontroller| format-list Vendor, Description, VideoModeDescription