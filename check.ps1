$vms = Get-AzVM -Status
foreach ($vm in $vms)
 {
  if ($vm.PowerState -eq "VM running")
  { $details= Get-AzVM -ResourceGroupName $vm.ResourceGroupName -Name $vm.Name -Status | select -ExpandProperty VMAgent | select -ExpandProperty Statuses | select DisplayStatus,Message
 Write-Host $vm.Name $details.DisplayStatus $details.Message
 }
 else
 { Write-Host $vm.Name $vm.PowerState }
 }
