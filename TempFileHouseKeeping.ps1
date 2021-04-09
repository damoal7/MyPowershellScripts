$Limit=(Get-Date).AddDays(-7)
cd $env:temp

$tempfolders = @(
	"C:\Windows\Temp\*",
	"C:\Windows\Prefetch\*",
	"C:\Documents and Settings\*\Local Settings\temp\*",
	"C:\Users\*\AppData\Local\Temp\*",
  "C:\Temp\";
  ""
)

Get-ChildItem -path $tempfolders -file -Recurse -force | Where-Object {$_.CreationTime -lt $Limit } | Remove-Item -Force
Get-ChildItem -path $tempfolders -recurse | Where {$_.PSIsContainer -and @(Get-ChildItem -LiteralPath:$_.fullname).Count -eq 0} |Remove-Item

#Remove-Item $tempfolders -force -recurse
