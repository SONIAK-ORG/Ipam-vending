# param (
#   [Parameter()]
#   [Int]$IPAM_SIZE = "$($Env:IPAM_SIZE)",

#   [Parameter()]
#   [String]$engineClientId = "$($Env:ENGINE_CLIENT_ID)",

#   [Parameter()]
#   [String]$appName = "$($Env:APP_NAME)",

#   [Parameter()]
#   [String]$space = "$($Env:SPACE)",

#   [Parameter()]
#   [String]$block = "$($Env:BLOCK)"
# )

param (
  [Parameter()]
  [Int]$IPAM_SIZE = "24",

  [Parameter()]
  [String]$engineClientId = "03885f20-6165-4a52-8eed-45d86b8c9efe",

  [Parameter()]
  [String]$appName = "ipam-oxyskfjzsz5pw",

  [Parameter()]
  [String]$space = "Postman",

  [Parameter()]
  [String]$block = "Posted"
)

$accessToken = ConvertTo-SecureString (Get-AzAccessToken -ResourceUrl api://$engineClientId).Token -AsPlainText

$requestUrl = "https://$appName.azurewebsites.net/api/spaces/$space/blocks/$block/reservations"

$body = @{
    'size' = $IPAM_SIZE
} | ConvertTo-Json

$headers = @{
  'Accept' = 'application/json'
  'Content-Type' = 'application/json'
}

$response = Invoke-RestMethod `
 -Method 'Post' `
 -Uri $requestUrl ` # Correctly using $requestUrl for the API call
 -Authentication 'Bearer' `
 -Token $accessToken `
 -Headers $headers `
 -Body $body

# Echoing the response
Write-Host "Response CIDR: $($response.cidr)"
Write-Host "Response ID: $($response.id)"

Write-Output "cidr=$($response.cidr)" >> $Env:GITHUB_OUTPUT
Write-Output "id=$($response.id)" >> $Env:GITHUB_OUTPUT
