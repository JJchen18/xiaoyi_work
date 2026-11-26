# Reassemble files split into *.partNNN chunks.
# Usage: powershell -ExecutionPolicy Bypass -File .\reassemble.ps1
$ErrorActionPreference = 'Stop'

$dir = Split-Path -Parent $MyInvocation.MyCommand.Path
$outDir = Join-Path $dir 'restored'
New-Item -ItemType Directory -Force -Path $outDir | Out-Null

$bases = Get-ChildItem $dir -File |
    Where-Object { $_.Name -match '\.part\d{3}$' } |
    ForEach-Object { $_.Name -replace '\.part\d{3}$', '' } |
    Sort-Object -Unique

foreach ($base in $bases) {
    $parts = Get-ChildItem $dir -File -Filter "$base.part*" | Sort-Object Name
    $outPath = Join-Path $outDir $base
    $out = [System.IO.File]::Create($outPath)
    try {
        foreach ($part in $parts) {
            $in = [System.IO.File]::OpenRead($part.FullName)
            try { $in.CopyTo($out) } finally { $in.Dispose() }
        }
    } finally {
        $out.Dispose()
    }
    Write-Host "Restored $base from $($parts.Count) part(s)"
}

Write-Host "Done. Output: $outDir"
