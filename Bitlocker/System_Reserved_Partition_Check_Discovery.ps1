$Status = Manage-Bde -Status | Where-object {$_ -like "ERROR: There are no disk volumes that can be protected with BitLocker Drive"}

IF ($Status -eq $Null) {
    $Result = $true
} ELSE {
    $Result = $false
}

$Result