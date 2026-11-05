# wifi_extractor

Exports every saved Wi-Fi profile on a Windows machine, with its key, into a CSV
next to the script.

```
Profile Name,Password
HomeNetwork,plaintextkey
```

## Usage

1. Copy the folder to the machine you are auditing.
2. Right-click `run_wifi_extractor.bat`, run as administrator. `netsh wlan show
   profile key=clear` needs elevation.
3. The results land in `wifi_credentials.csv` beside the batch file.

## Why I wrote it

I was cleaning up an old laptop and could not remember which networks it still
held keys for. `netsh wlan show profiles` gives you names one at a time, and I
wanted a list I could read and then wipe. It also turned out to be a decent
exercise in PowerShell parsing, since `netsh` output is localised and the field
labels change with the Windows display language.

## Warning

This is credential extraction, even when the machine is yours. Only run it on
hardware you own or administer, and treat the CSV as a secret file: it contains
plaintext Wi-Fi keys.

`wifi_credentials.csv` is in `.gitignore` for that reason. The sample file in
the repo is fake data.

## Requirements

Windows 10 or 11, PowerShell 5.1 or later, administrator rights.
