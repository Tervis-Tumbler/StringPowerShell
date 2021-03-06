﻿function Test-ShouldBeAlphaNumeric {
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
        $String -replace "\s", ""
    }
}

function Measure-String {
    param (
        [Parameter(Mandatory,ValueFromPipeline)][String]$String,
        [Switch]$Length
    )
    process {
        $Result = [PSCustomObject]@{}
        if ($Length) { 
            $Result | Add-Member -MemberType NoteProperty -Name Lenght -Value $String.Length
        }
    }
}

function Get-StringLength {
    param (
        [Parameter(Mandatory,ValueFromPipeline)][String]$String
    )
    process {
        $String.Length
    }
}

function Convert-NumberToLetter {
    param([parameter(Mandatory)]$Number)
  
    $Alphabet = @()
    97..122|foreach-object{$Alphabet+=[char]$_}
    $Alphabet[$Number]
}

function ConvertFrom-ListOfNames {
    param (
        [string]$InputText
    )
    $Formatted = $InputText.Split("`n").Trim()
    $Formatted | foreach {
        $Name = ($_ -Replace ("\s+",";")).split(";")
        [PSCustomObject][Ordered]@{
            GivenName = $Name[0]
            Surname = $Name[$Name.Count - 1]
        }
    }
}

function Convert-MacToWindowsNetworkPath {
    param (
        [Parameter(ValueFromPipeline)]
        [string]$MacNetworkPath
    )

    $MacNetworkPath.Split(":")[1].Replace("/","\")
}

function Convert-WindowsToMacNetworkPath {
    param (
        [Parameter(ValueFromPipeline)]
        [string]$WindowsNetworkPath
    )

    "smb:" + $WindowsNetworkPath.Replace("\","/")
}