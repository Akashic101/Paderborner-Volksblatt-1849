# Place this file in the folder with the textfiles in which you want
# to replace every occurence of "ſ" with "s"

$txtFiles = Get-ChildItem -Name *.txt

ForEach ($file in $txtFiles) {
    (Get-Content $file) | ForEach-Object {
        $_ -replace 'ſ','s'
    } | Set-Content $file
}