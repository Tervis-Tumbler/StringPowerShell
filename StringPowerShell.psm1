function Test-ShouldBeAlphaNumeric {
    param(
        $Name, 
        $string
    )
    if ($string -notmatch "^[a-zA-Z0-9]+$") { 
        throw "The $name should only contain alphanumeric characters." 
    }
    $true
}

Function ConvertTo-TitleCase {
    param(
        [Parameter(ValueFromPipeline)][String]$Input
    )
    (Get-Culture).TextInfo.ToTitleCase($Input.ToLower())
}

