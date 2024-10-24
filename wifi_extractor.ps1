$csv_file = "$PSScriptRoot\wifi_credentials.csv"
"Profile Name,Password" | Out-File -FilePath $csv_file -Encoding utf8

$profiles = netsh wlan show profiles | Select-String "All User Profile" | ForEach-Object {
    $_ -replace '.*:\s*', ''
}

foreach ($profile in $profiles) {
    $profile = $profile.Trim()
    $passwordInfo = netsh wlan show profile "$profile" key=clear | Select-String "Key Content"
    if ($passwordInfo) {
        $password = $passwordInfo -replace '.*:\s*', ''
        $password = $password.Trim()
        "$profile,$password" | Out-File -FilePath $csv_file -Append -Encoding utf8
    } else {
        "$profile,None or Not Available" | Out-File -FilePath $csv_file -Append -Encoding utf8
    }
}

Write-Host "Wi-Fi credentials saved to $csv_file"
