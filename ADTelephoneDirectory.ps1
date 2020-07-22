Scrapes a HTML Table Extract out of AD, filtering on VOIP numbers, and then add a CSS and JQuery header and footer to the page; 

Automate it to run every night and post the file into a SharePoint upload folder.

#
# Telephone Directory

# Damian Houston, Infrastructure Consultant
#
# 2015-04-29 v 1.0
#
Import-Module ActiveDirectory

$a = "`r`n"
# jQuery Filter
$c =" `r`n"
$c = $c + "`r`n"
$c = $c + "`r`n"

$d = "
xxx Staff Telephone Directory
`r`n"
$d = $d + "
`r`n"
$d = $d + ' Search by Name: 
'
$d = $d + "
`r`n"
Get-ADUser -filter * -Properties * | ? {$_.ipphone -ne $null} | sort name | ConvertTo-Html Name,Office,ipphone,OfficePhone,HomePhone,MobilePhone $a -body "$c $d" -PostContent "

brought to you by Damian
" |ForEach-Object { $_ -replace ("ipphone", "Ext") -replace ("", "
") } &gt; \\sharepoint\ContentImport$\UsersPhoneEXTs.html
