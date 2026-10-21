$stopped = 0

# 1. Stop process listening on default Jarvis port 47821
$conn = Get-NetTCPConnection -LocalPort 47821 -ErrorAction SilentlyContinue | Where-Object { $_.OwningProcess -gt 0 }
if ($conn) {
    $pids = $conn.OwningProcess | Select-Object -Unique
    foreach ($p in $pids) {
        $proc = Get-Process -Id $p -ErrorAction SilentlyContinue
        if ($proc -and ($proc.ProcessName -match 'python')) {
            Write-Host "Stopping Jarvis server on port 47821 (PID $p)..."
            Stop-Process -Id $p -Force -ErrorAction SilentlyContinue
            $stopped++
        }
    }
}

# 2. Stop any remaining background python/pythonw processes running dodaios or jarvis
Get-CimInstance Win32_Process | Where-Object {
    ($_.Name -match 'python') -and ($_.CommandLine -match 'dodaios|jarvis')
} | ForEach-Object {
    Write-Host "Stopping Jarvis process (PID $($_.ProcessId))..."
    Stop-Process -Id $_.ProcessId -Force -ErrorAction SilentlyContinue
    $stopped++
}

if ($stopped -gt 0) {
    Write-Host "Jarvis stopped successfully."
} else {
    Write-Host "No running Jarvis processes found."
}
