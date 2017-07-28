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

Function Select-StringBetween {
    param (
        [Parameter(Mandatory,ValueFromPipeline)]$String,
        [Parameter(Mandatory)]$After,
        [Parameter(Mandatory)]$Before
    )
    process {
        (($String -split $After)[1] -split $Before)[0]
    }
}

function Convert-HereStringToValidateSet {
    param (
        [string]$HereString
    )
    '"' + (($HereString.split("`n") | sort -Unique) -join "`",`"") + '"'
}

function Remove-WhiteSpace {
    param (
        [Parameter(Mandatory,ValueFromPipeline)][String]$String
    )
    process {
        $String.TrimEnd().TrimStart()
    }
}
