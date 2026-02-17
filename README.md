# FFmpeg-Loudnorm-PS ![Status](https://img.shields.io/badge/Status-PRODUCTION%20READY-brightgreen)

## 🎙️ **Fini les pubs TV inaudibles/assourdissantes !**

**Transforme tes vidéos** (rando 🎸, guitare 🎵, projets pro) en **volume constant pro** selon **EBU R128** (-23 LUFS), norme **France Télévisions**, BBC, ARD.

```
Vidéo originale → -21.1 LUFS (trop fort/faible)
       ↓ 2 clics
normalise.mp4   → -23.0 LUFS ✅ (TV parfaite)
```

**Vidéo intacte** (`-c:v copy`) + **True Peak sûr** (-1.5 dBTP).

## ⚙️ **2 commandes PowerShell**

```powershell
# TV/France Télé (-23 LUFS)
.\normalize.ps1 -InputFile "rando.mp4" -TargetLUFS "23"

# YouTube (-16 LUFS)
.\normalize.ps1 -InputFile "guitare.mp4" -TargetLUFS "16"
```

---

## 🎛️ Fonctionnalités

- ✅ **EBU R128** certifiée (-23 LUFS)
- ✅ **YouTube** (-16 LUFS) 
- ✅ **Vidéo intacte** (`-c:v copy`)
- ✅ **PowerShell natif** Windows 11
- ✅ **FFmpeg 8.0.1** optimisé (gyan.dev)

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

# Télécharge normalize.ps1 + README.md depuis GitHub
# Test file
ffmpeg -f lavfi -i testsrc=duration=10:size=1280x720:rate=24 -f lavfi -i sine=frequency=1000:duration=10 -c:v libx264 -c:a aac -shortest test.mp4
```

## 📖 Usage

```powershell
# TV/Broadcast (-23 LUFS)
.\normalize.ps1 -InputFile "video.mp4" -TargetLUFS "23"

# YouTube/Spotify (-16 LUFS)
.\normalize.ps1 -InputFile "video.mp4" -TargetLUFS "16"

# Nom sortie personnalisé
.\normalize.ps1 -InputFile "input.mp4" -OutputFile "pro.mp4" -TargetLUFS "23"
```

### **Exemple réel** :
```
[1/2] Scan audio...
Input Integrated: -21.1 LUFS  ← COPIE ces 4 valeurs
Input True Peak:  -13.3 dBTP
Input LRA:         0.1 LU  
Input Threshold: -31.1 LUFS

[2/2] Normalisation...
TERMINE: normalise.mp4 (-23 LUFS) ✅
```

## ✅ Validation résultat

```powershell
# AVANT
ffmpeg -i input.mp4 -af "loudnorm=I=-23:TP=-1.5:LRA=11:print_format=summary" -f null -

# APRÈS → Input Integrated: -23.0 LUFS ✅
ffmpeg -i normalise.mp4 -af "loudnorm=I=-23:TP=-1.5:LRA=11:print_format=summary" -f null -
```

## 🎵 Standards supportés

| Plateforme | LUFS | Commande |
|------------|------|----------|
| **TV/France Télé** | **-23** | `-TargetLUFS "23"` |
| **YouTube** | **-16** | `-TargetLUFS "16"` |
| **Spotify** | **-14** | `-TargetLUFS "14"` |

## 🛠️ FFmpeg 8.0.1 (Setup recommandé)

```powershell
# Vérification
ffmpeg -version     # 8.0.1-full_build gyan.dev ✅
where.exe ffmpeg    # 1 seul résultat

# Test loudnorm
ffmpeg -f lavfi -i sine=1000:duration=5 -af "loudnorm=I=-23:TP=-1.5:LRA=11:print_format=summary" -f null -
```

**Gestion multi-versions** :
```powershell
# Si conflit Chocolatey
choco uninstall ffmpeg-full -y
winget upgrade Gyan.FFmpeg
```

## 📁 Structure projet

```
FFmpeg-Loudnorm-PS/
├── README.md        ← Ce fichier
├── normalize.ps1    ✅ Script v5.0
├── test.mp4         💿 Source test (ignoré)
└── normalise.mp4    🎯 -23 LUFS (ignoré)
```

## 👨‍💻 Auteur

**valorisa** - DevOps Engineer (Montpellier, FR)  
**Passions** : Randonnée 🥾 | Guitare 🎸 | Infrastructure as Code

## 📄 Licence

MIT - Usage libre perso/commercial

## 🙏 Credits

- [Korben.info](https://korben.info/ffmpeg-normaliser-volume-audio-lufs-loudnorm.html)
- [FFmpeg loudnorm](https://ayosec.github.io/ffmpeg-filters-docs/8.0/Filters/Audio/loudnorm.html)
- [Gyan.dev FFmpeg builds](https://www.gyan.dev/ffmpeg/builds/)

---

**🏆 Projet certifié EBU R128 • PowerShell natif • Windows 11 • FFmpeg 8.0.1** 🚀🎸🥾
```

