$test_directory = [System.IO.Path]::Combine([Environment]::GetFolderPath('startmenu'), 'Programs', 'Scoop Apps')
$music_icon = [System.IO.Path]::Combine($(appdir neteasemusic), "current", "resource", "format.ico")
$music_icon = New-Object System.IO.FileInfo($music_icon)
$wsShell = New-Object -ComObject WScript.Shell
$wsShell = $wsShell.CreateShortcut("$test_directory\UnblockNeteaseMusic.lnk")
$wsShell.IconLocation = $music_icon.FullName
$wsShell.Save()
