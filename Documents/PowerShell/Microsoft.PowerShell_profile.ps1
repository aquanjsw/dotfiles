Import-Module "gsudoModule" -ErrorAction SilentlyContinue

Set-PSReadLineOption -EditMode Emacs
Set-Alias which where.exe

function t   { wsl trans       -t zh $args }
function tje { wsl trans -s ja -t en $args } 
function tjz { wsl trans -s ja -t zh $args } 
function tr  { wsl trans             $args } 
function tze { wsl trans -s zh -t en $args } 
function tzj { wsl trans -s zh -t ja $args } 

# Extract ncm id from share link in clipboard and set it back to clipboard
function rvc {
  $result = $(Get-Clipboard) -match 'id=(\d+)&'
  if (! $result) {
    Write-Host "Invalid clipboard content:" -ForegroundColor Red
      Get-Clipboard
      return
  }
  $id = $Matches[1]
  $content = "$id"
  Set-Clipboard "$content"
  Write-Host "Set clipboard: $content" -ForegroundColor Green
}

function prompt {
  Write-Host "[$env:COMPUTERNAME] " -ForegroundColor Green -NoNewLine
  Write-Host "$($ExecutionContext.SessionState.Path.CurrentLocation)>" -NoNewLine
  return " "
}

function dotfiles {
  git --git-dir=$env:USERPROFILE\.dotfiles --work-tree=$env:USERPROFILE $args
}

