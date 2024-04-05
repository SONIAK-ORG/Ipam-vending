param (
  [Parameter()]
  [Int]$IPAM_SIZE = "$($Env:IPAM_SIZE)",

  [Parameter()]
  [String]$engineClientId = "$($Env:ENGINE_CLIENT_ID)",

  [Parameter()]
  [String]$appName = "$($Env:APP_NAME)",

  [Parameter()]
  [String]$space = "$($Env:SPACE)",

  [Parameter()]
  [String]$block = "$($Env:BLOCK)"
)


# Retrieve the access token
$accessTokenRaw = Get-AzAccessToken -ResourceUrl api://$engineClientId
$accessToken = $accessTokenRaw.Token


# Build the request URL
$requestUrl = "https://$appName.azurewebsites.net/api/spaces/$space/blocks/$block/reservations"


$body = @{
    'size' = $IPAM_SIZE
} | ConvertTo-Json

$headers = @{
  'Accept' = 'application/json'
  'Content-Type' = 'application/json'
  'Authorization' = "Bearer $accessToken"  # Correct way to include the bearer token
}

$response = Invoke-RestMethod `
 -Method 'Post' `
 -Uri $requestUrl `
 -Headers $headers `
 -Body $body

# Echoing the response
Write-Host "Response CIDR: $($response.cidr)"
Write-Host "Response ID: $($response.id)"

Write-Output "cidr=$($response.cidr)" >> $Env:GITHUB_OUTPUT
Write-Output "id=$($response.id)" >> $Env:GITHUB_OUTPUT
