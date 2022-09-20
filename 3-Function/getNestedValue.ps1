## Usage: ./getNestedValue.ps1 "address.city.code"
param (
	[Parameter(Mandatory=$true)][string]$nested_key
)

$dataObj = @"
            { 
            name: "Amit",
            address: {
                        state: "Uttarakhand",
                        city: {
                            code: "hal",
                            name: "Haldwani",
                            postal: "263139",
                            street: {
                                number: "12",
                                house: "53A",
                                area: "South Park"
                            }
                        }
                     }
            }
"@

$Obj = $dataObj | ConvertFrom-Json

Function getNestedValue ($object,$key)
{
    if ($nested_key.IndexOf(".") -lt 0)
    {
        Write-Host $Obj.$nested_key
    }
    else
    {
        $key_array = $nested_key.Split(".")
        foreach ($item in $key_array) 
        {
            $Obj = $Obj.$item
        }
    Write-Host $Obj
    }
}

getNestedValue("$obj","$nested_key")