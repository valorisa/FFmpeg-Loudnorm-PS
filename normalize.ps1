param(
    [Parameter(Mandatory=$true)]
    [string]$InputFile,
    [string]$OutputFile = "normalise.mp4",
    [string]$TargetLUFS = "23"
)

Write-Host "FFmpeg Loudnorm PS v5.0 - $TargetLUFS LUFS" -ForegroundColor Cyan
Write-Host "[1/2] Scan audio (ATTENDS FIN)..." -ForegroundColor Yellow

# PASS 1 - Syntaxe corrigée
ffmpeg -i $InputFile -af "loudnorm=I=-$TargetLUFS`:TP=-1.5:LRA=11:print_format=summary" -f null -

Write-Host "COPIE les 4 valeurs de la derniere ligne:" -ForegroundColor Red
$i = Read-Host "Input Integrated"
$tp = Read-Host "Input True Peak" 
$lra = Read-Host "Input LRA"
$thresh = Read-Host "Input Threshold"

# PASS 2
Write-Host "[2/2] Normalisation..." -ForegroundColor Yellow
$afilter = "loudnorm=I=-$TargetLUFS`:TP=-1.5:LRA=11:measured_I=$i`:measured_TP=$tp`:measured_LRA=$lra`:measured_thresh=$thresh"
ffmpeg -i $InputFile -c:v copy -af $afilter -y $OutputFile

Write-Host "TERMINE: $OutputFile (-$TargetLUFS LUFS)" -ForegroundColor Green
