## FFmpeg-Loudnorm-PS 

**Normalisation audio EBU R128 sous PowerShell (Windows 11)**

Script 2-pass FFmpeg `loudnorm` → **-23 LUFS** (TV) ou **-16 LUFS** (YouTube).

## 🎛️ Fonctionnalités

- ✅ **EBU R128** certifiée (-23 LUFS)
- ✅ **YouTube** (-16 LUFS) 
- ✅ **Vidéo intacte** (`-c:v copy`)
- ✅ **PowerShell natif**
- ✅ **FFmpeg 8.0.1** optimisé

## 📋 Prérequis

```powershell
# FFmpeg 8.0.1+ (WinGet Gyan)
winget install Gyan.FFmpeg
ffmpeg -version  # libavfilter 11.4.100+
```

## 🚀 Installation

```powershell
mkdir ~/Projets/FFmpeg-Loudnorm-PS
cd ~/Projets/FFmpeg-Loudnorm-PS

# Copie normalize.ps1 + README.md
# Test file
ffmpeg -f lavfi -i testsrc=duration=10:size=1280x720:rate=24 -f lavfi -i sine=frequency=1000:duration=10 -c:v libx264 -c:a aac -shortest test.mp4
```

## 📖 Usage

```powershell
# TV/Broadcast (-23 LUFS)
.\normalize.ps1 -InputFile "video.mp4" -TargetLUFS "23"

# YouTube (-16 LUFS)
.\normalize.ps1 -InputFile "video.mp4" -TargetLUFS "16"

# Custom output
.\normalize.ps1 -InputFile "input.mp4" -OutputFile "pro.mp4" -TargetLUFS "23"
```

**Exemple** :
```text
Input Integrated: -21.1 LUFS  → Note 4 valeurs
Input True Peak:  -13.3 dBTP
Input LRA:         0.1 LU  
Input Threshold: -31.1 LUFS

→ normalise.mp4 : -23.0 LUFS ✅
```

## ✅ Validation

```powershell
# AVANT
ffmpeg -i input.mp4 -af "loudnorm=I=-23:TP=-1.5:LRA=11:print_format=summary" -f null -

# APRÈS → Input Integrated: -23.0 LUFS ✅
ffmpeg -i normalise.mp4 -af "loudnorm=I=-23:TP=-1.5:LRA=11:print_format=summary" -f null -
```

## 🎵 Standards

| Plateforme | LUFS | Commande |
|------------|------|----------|
| **TV/France** | -23 | `-TargetLUFS "23"` |
| **YouTube** | -16 | `-TargetLUFS "16"` |
| **Spotify** | -14 | `-TargetLUFS "14"` |

## 🛠️ FFmpeg 8.0.1 (Setup actuel) ✅

```powershell
# Vérification
ffmpeg -version     # 8.0.1-full_build gyan.dev
where.exe ffmpeg    # 1 seul résultat

# Test loudnorm
ffmpeg -f lavfi -i sine=1000:duration=5 -af "loudnorm=I=-23:TP=-1.5:LRA=11:print_format=summary" -f null -
```

**Multi-versions** :
```powershell
choco uninstall ffmpeg-full -y  # ← DÉJÀ FAIT !
winget upgrade Gyan.FFmpeg      # Futur
```

## 📁 Structure

```text
FFmpeg-Loudnorm-PS/
├── README.md        ← Ce fichier
├── normalize.ps1    ✅ Script v5.0
├── test.mp4         💿 Source test
└── normalise.mp4    🎯 -23 LUFS
```

## 👨‍💻 Auteur

**valorisa** - DevOps Engineer (Montpellier, FR)  
**Passions** : Randonnée 🥾 | Guitare 🎸 | Infrastructure

## 📄 Licence

MIT - Usage libre perso/commercial

## 🙏 Credits

- [Korben.info](https://korben.info/ffmpeg-normaliser-volume-audio-lufs-loudnorm.html) [korben](https://korben.info/ffmpeg-normaliser-volume-audio-lufs-loudnorm.html)
- FFmpeg `loudnorm` EBU R128 [ayosec.github](https://ayosec.github.io/ffmpeg-filters-docs/8.0/Filters/Audio/loudnorm.html)
- Gyan.dev builds [gyan](https://www.gyan.dev/ffmpeg/builds/)

***

**Projet certifié -  PowerShell natif -  Windows 11 -  EBU R128** 🚀🎸

