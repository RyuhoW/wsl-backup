#----Wsl Auto Backup----#
$get_date = Get-Date -Format yyyyMMdd

Set-Variable -name date -value $get_date -Option Constant

$ubuntufile =  Get-ChildItem -name "<your path>"

if($ubuntufile -match $date){
    echo 'Ubuntu backup already completed'
    }else{
	
    wsl --export Ubuntu C:\<your path>\Ubuntu$date.tar 

	$ubuntufile_count = ($ubuntufile).Count

		if($ubuntufile_count -gt 6){
			Get-ChildItem "C:\<your path>" | Sort-Object -Descending | Select-Object -Last 1 | Remove-Item
		}
}
