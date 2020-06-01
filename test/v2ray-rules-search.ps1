param($type = "all", $link)

$direct = "direct-list"
$proxy = "proxy-list"
$reject = "reject-list"



function get_info([int]$typenum, [string]$link) {
    $address
    if ($typenum -eq 1)
    {
        $address = $direct
    }
    elseif ($typenum -eq 2)
    {
        $address = $proxy
    }
    elseif ($typenum -eq 3)
    {
        $address = $reject
    }
    elseif ($typenum -eq 4)
    {
        $address = "*-list"
    }
    Select-String -Pattern "$link" -Path "$PSScriptRoot/$address"
}

if (!($link)){
    "Usage: v2rulesearch <type> <link>`n`nSome useful types are:`n`n"
    "direct or d: only search direct link"
    "proxy or p: only search proxy link"
    "reject or r: only search reject link"
    "all or a: search all types of link, the dafult option"
}
else {
    if ($type -eq "direct" -or $type -eq "d") {
        get_info 1 $link
    }
    elseif ($type -eq "proxy" -or $type -eq "p") {
        get_info 2 $link
    }
    elseif ($type -eq "reject" -or $type -eq "r"){
        get_info 3 $link
    }
    elseif ($type -eq "all" -or $type -eq "a"){
        get_info 4 $link
    }
}
