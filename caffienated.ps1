<#
.SYNOPSIS
    Slightly move mouse and depress scroll lock key twice every 4 minutes.
.DESCRIPTION
    This script will depress the scroll lock key twice, enabling and disabling scroll
    lock. Slight overkill, including any mouse movement, but it should not be noticeable.
    This will prevent the screen from locking for just about any setup.  Just right click
    and choose Run with PowerShell when you want to keep your screen from locking.
.NOTES
    File Name      : caffienated.ps1
    Author         : Iron_Geek
#>
Clear-Host
Echo "Moving mouse and Scroll lock..."
Add-Type -AssemblyName System.Windows.Forms

$WShell = New-Object -com "Wscript.Shell"
$PlusOrMinus = 1
while ($true)
{
  $p = [System.Windows.Forms.Cursor]::Position
  $x = $p.X + $PlusOrMinus
  $y = $p.Y + $PlusOrMinus
  [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($x, $y)
  $WShell.sendkeys("{SCROLLLOCK}")
  Start-Sleep -Milliseconds 100
  $WShell.sendkeys("{SCROLLLOCK}")
  Start-Sleep -Seconds 240
  Echo "Moving mouse and scroll lock..."
  $PlusOrMinus *= -1
}
