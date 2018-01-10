# This only works on a machine that has the Dell CCTK tool available on it.
# It also has to have had the CCTK run the TPM activation task and output a log file which this script reads.

$Log = "C:\ProgramData\SCCM_Dell_ActivateTPM.log"

$Status = C:\ProgramData\CCTK\cctk.exe --tpmactivation

IF ($Status -eq "tpmactivation=activate"){

    IF (Test-Path $Log) {
        $InstallDate = (Get-ChildItem $Log).CreationTime
        $OS_Info = Get-WmiObject win32_operatingsystem
        $LastBootTime = ($OS_Info.ConvertToDateTime($OS_Info.lastbootuptime))
        $TimeSpan = New-TimeSpan -Start $LastBootTime -End $InstallDate
        IF ( $TimeSpan.TotalMilliseconds -lt 0 ) {$Result = $true}
        IF ( $TimeSpan.TotalMilliseconds -gt 0 ) {$Result = $false}
    } ELSE {
            $Result = $true
    }
} ELSE { 
        $Result = $FALSE 
}

$Result