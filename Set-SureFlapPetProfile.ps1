param (
	[string]$deviceID,
	[string]$petID,
	[string]$profileNo = 2 #  2 = indoor (default), 3 = outdoor
)
# usage: .\Set-SureFlapPetPosition.ps1 device_id pet_id profile_number

. ./Get-SureFlapToken.ps1

$uri = $endpoint + "/api/device/$deviceID/tag/$petID"

$headers = @{}
$headers.Add("Authorization","Bearer $token" ) | Out-Null

$postParams = @{
 "profile" = $profileNo
} | ConvertTo-Json

$postParams

$res = Invoke-RestMethod -Method Put -Uri $uri -Headers $headers -Body $postParams -ContentType "application/json"
$res.data