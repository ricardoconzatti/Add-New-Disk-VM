######################################################################
# Created By @RicardoConzatti | July 2019
# Latest Update: July 2019
# @RicardoConzatti | www.Solutions4Crowds.com.br
$VMname = 'LAB-S2D-01','LAB-S2D-02','LAB-S2D-03' # VMs name [multiples VMs = 'VM1','VM2','VM3' ||| one VM = 'VM1']
$DiskSize = '100','50','50','80' # Disk size (GB) [just one VM disk is NOT supported]
#
$DiskType = "Flat" # Flat, RawPhysical, RawVirtual or Unknown
$StorageFormat = "EagerZeroedThick" # EagerZeroedThick, Thick, Thick2GB, Thin or Thin2GB 
$ControllerType = "ParaVirtual" # ParaVirtual, Default, VirtualBusLogic, VirtualLsiLogic or VirtualLsiLogicSAS
$SCSIBusSharingMode = "Physical" # Physical, Virtual or NoSharing
#
If ($VMname.Count -eq 1) {
	$GetController = Get-VM -Name $VMname | New-HardDisk -CapacityGB $DiskSize[0] -DiskType $DiskType -StorageFormat $StorageFormat | New-ScsiController -Type $ControllerType -BusSharingMode $SCSIBusSharingMode # Add disk controller and first disk
	$ControllerName = $GetController.Name
	$TotalDisk = 1
	
	While ($DiskSize.Count -ne $TotalDisk) {
		Get-VM -Name $VMname | New-HardDisk -CapacityGB $DiskSize[$TotalDisk] -DiskType $DiskType -StorageFormat $StorageFormat -Controller $ControllerName | Out-Null # add another disks
		$TotalDisk++;
	}
	Get-VM -Name $VMname | Get-HardDisk | Select Name,CapacityGB,StorageFormat,Filename
}
Else {
	$TotalVM = 0
	While ($VMname.Count -ne $TotalVM) {
		$GetController = Get-VM -Name $VMname[$TotalVM] | New-HardDisk -CapacityGB $DiskSize[0] -DiskType $DiskType -StorageFormat $StorageFormat | New-ScsiController -Type $ControllerType -BusSharingMode $SCSIBusSharingMode # Add disk controller and first disk
		$ControllerName = $GetController.Name
		$TotalDisk = 1
		While ($DiskSize.Count -ne $TotalDisk) {
			Get-VM -Name $VMname[$TotalVM] | New-HardDisk -CapacityGB $DiskSize[$TotalDisk] -DiskType $DiskType -StorageFormat $StorageFormat -Controller $ControllerName | Out-Null # add another disks
			$TotalDisk++;
		}
		Get-VM -Name $VMname[$TotalVM] | Get-HardDisk | Select Name,CapacityGB,StorageFormat,Filename
		write-host "====="
		$TotalVM++;
	}
}
