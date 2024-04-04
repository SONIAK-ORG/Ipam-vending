param (
  [Parameter()]
  [String]$IPAM_API_SCOPE = "$($Env:IPAM_API_SCOPE)",

  [Parameter()]
  [String]$IPAM_URL = "$($Env:IPAM_URL)",

  [Parameter()]
  [Int]$IPAM_SIZE = "$($Env:IPAM_SIZE)"
)

$accessToken = ConvertTo-SecureString (Get-AzAccessToken -ResourceUrl api://03885f20-6165-4a52-8eed-45d86b8c9efe).Token -AsPlainText



$body = @{
    'size' = $IPAM_SIZE
} | ConvertTo-Json

$headers = @{
  'Accept' = 'application/json'
  'Content-Type' = 'application/json'
}

$response = Invoke-RestMethod `
 -Method 'Post' `
 -Uri $IPAM_URL `
 -Authentication 'Bearer' `
 -Token $accessToken `
 -Headers $headers `
 -Body $body

# Echoing the response
Write-Host "Response CIDR: $($response.cidr)"
Write-Host "Response ID: $($response.id)"

Write-Output "cidr=$($response.cidr)" >> $Env:GITHUB_OUTPUT
Write-Output "id=$($response.id)" >> $Env:GITHUB_OUTPUT
