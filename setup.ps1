# https://github.com/git-for-windows/git/releases/download/v2.46.1.windows.1/Git-2.46.1-64-bit.exe
# https://nodejs.org/dist/v20.17.0/node-v20.17.0-x64.msi
# https://github.com/neovim/neovim/releases/latest/download/nvim-win64.msi

$Git     = Get-ChildItem -Filter "Git*.exe"
$Node    = Get-ChildItem -Filter "node*.msi"
$Nvim    = Get-ChildItem -Filter "nvim*.msi"
$InitVim = Get-Content -Path ".\init.vim"
$InitVim = $InitVim | % { if ($_ -match "USERNAME") { $_ -replace "USERNAME", $env:USERNAME } else { $_ } }

Start-Process -FilePath $Git.FullName -ArgumentList "/VERYSILENT /NORESTART" -NoNewWindow -Wait

Start-Process -FilePath "msiexec.exe" -ArgumentList "/i `"$($Node.FullName)`" /qn /norestart" -NoNewWindow -Wait

Start-Process -FilePath "msiexec.exe" -ArgumentList "/i `"$($Nvim.FullName)`" /qn /norestart" -NoNewWindow -Wait

Invoke-WebRequest -UseBasicParsing -Uri https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim | New-Item -Path $env:USERPROFILE\AppData\Local\nvim\autoload\plug.vim -Force

Copy-Item -Path ".\coc-settings.json" -Destination "C:\Users\Stephen\AppData\Local\nvim\"

$InitVim | Out-File -FilePath "C:\Users\Stephen\AppData\Local\nvim\init.vim"
