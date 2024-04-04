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

try {
    $accessTokenRaw = Get-AzAccessToken -ResourceUrl api://$engineClientId -ErrorAction Stop
    $accessToken = $accessTokenRaw.Token

    $requestUrl = "https://$appName.azurewebsites.net/api/spaces/$space/blocks/$block/reservations"
    
    $body = @{
        'size' = $IPAM_SIZE
    } | ConvertTo-Json

    $headers = @{
      'Accept' = 'application/json'
      'Content-Type' = 'application/json'
      'Authorization' = "Bearer $accessToken"
    }

    $response = Invoke-RestMethod -Method 'Post' -Uri $requestUrl -Headers $headers -Body $body -ErrorAction Stop

    Write-Host "Response CIDR: $($response.cidr)"
    Write-Host "Response ID: $($response.id)"

    Write-Output "cidr=$($response.cidr)" >> $Env:GITHUB_OUTPUT
    Write-Output "id=$($response.id)" >> $Env:GITHUB_OUTPUT
} catch {
    Write-Error "Error encountered: $_"
    exit 1
}
