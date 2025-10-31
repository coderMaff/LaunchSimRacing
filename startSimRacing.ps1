#Start SimRacing script
[xml]$config = Get-Content ".\startSimRacing.xml"

$gameOver = $args -contains "-gameover"
$layoutProfile = if ($gameOver) { "Work" } else { "SimRacing" }

function getAppPath($appNode) {
    $regPath = $appNode.RegistryPath
    $valueName = $appNode.ValueName
    $exe = $appNode.Exe
    $fallbackPath = $appNode.InstallPath

    try {
        $regValue = (Get-ItemProperty -Path $regPath -ErrorAction Stop).$valueName

        if ((Test-Path $regValue) -and ((Get-Item $regValue).PSIsContainer)) {
            return Join-Path $regValue $exe
        }
        else {
            return $regValue
        }
    }
    catch {
        if ($fallbackPath -and $exe) {
            return Join-Path $fallbackPath $exe
        }
        elseif ($fallbackPath) {
            return $fallbackPath
        }
        else {
            return $null
        }
    }
}

function getToolPath($toolName) {
    $toolNode = $config.SimRacingConfig.Tools.Tool | Where-Object { $_.name -eq $toolName }
    return $toolNode.'#text'
}

function startApp($appNode) {
    $name = $appNode.name
    $exe = $appNode.Exe
    $path = getAppPath $appNode

    # Check if process is already running
    $isRunning = Get-Process -Name ([System.IO.Path]::GetFileNameWithoutExtension($exe)) -ErrorAction SilentlyContinue

    if ($isRunning) {
        Write-Host "$name is already running. Skipping launch."
    }
    elseif ($path -and (Test-Path $path)) {
        Start-Process $path
    }
    else {
        Write-Warning "$name not found. Check XML config."
    }
}

function ensureMonitorLayout {
    $layout = $config.SimRacingConfig.MonitorLayouts.$layoutProfile.Monitor
    $multiTool = getToolPath "MultiMonitorTool"

    $positionOrder = @{ Left = 0; Center = 1; Right = 2 }
    $sorted = $layout | Sort-Object { $positionOrder[$_.Position] }

    $xOffset = 0
    $monitorArgs = @()
    $primary = "1";

    foreach ($mon in $sorted) {
        $id = $mon.id
        $res = $mon.Resolution
        $rate = $mon.RefreshRate
        $width, $height = $res -split "x"
        $name = "\\.\DISPLAY$id"

        $arg = "Name=$name Width=$width Height=$height DisplayFrequency=$rate PositionX=$xOffset PositionY=0"

        if ($mon.isPrimary -eq "true") {
            $primary = "$id"
        }

        $monitorArgs += "`"$arg`""
        $xOffset += [int]$width
    }


    Write-Host "Running: $multiTool /SetPrimary $primary /SetMonitors $($monitorArgs -join ' ')"
    Start-Process -FilePath $multiTool -ArgumentList "/SetPrimary $primary /SetMonitors $($monitorArgs -join ' ')" -WindowStyle Hidden
}

# ✅ Apply power plan from config
$scheme = $config.SimRacingConfig.PowerPlan.Scheme
if ($scheme) {
    powercfg -setactive $scheme
}

if (!$gameOver) {

    # 🔇 Kill background clutter
    $config.SimRacingConfig.KillTasks.Task | ForEach-Object {
        Write-Host "Killing task: $_"
        Get-Process $_ -ErrorAction SilentlyContinue | Stop-Process -Force -ErrorAction SilentlyContinue
    }

    # 🚀 Launch apps
    $config.SimRacingConfig.Apps.App | ForEach-Object {
        startApp $_
    }
}
else {
    # 🛑 Game over - close sim racing apps
    $config.SimRacingConfig.Apps.App | ForEach-Object {
        $exe = $_.Exe
        $processName = [System.IO.Path]::GetFileNameWithoutExtension($exe)
        Write-Host "Closing app: $processName"
        Get-Process -Name $processName -ErrorAction SilentlyContinue | Stop-Process -Force -ErrorAction SilentlyContinue
    }
}

# 🖥️ Validate and enforce monitor layout
ensureMonitorLayout

# 📝 Log
Add-Content ".\startup.log" "$(Get-Date): Sim racing environment launched [$layoutProfile]"