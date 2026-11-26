# 11.7.9.408 shards

Source folder `11.7.9.408` is 668.66 MB. GitHub rejects any single file larger than
100 MB, so the two oversized files were split into 90 MB chunks. All other files are
copied unchanged.

## Contents

| File | Size | Note |
| --- | --- | --- |
| `HwHmosHiVoicePC.hap.part001` .. `part004` | 90/90/90/35.31 MB | split from `HwHmosHiVoicePC.hap` (320.14 MB) |
| `HwHmosVAssistant.hap.part001` .. `part003` | 90/90/32.24 MB | split from `HwHmosVAssistant.hap` (222.55 MB) |
| other files | < 100 MB each | unchanged copies |

## Reassemble

```powershell
powershell -ExecutionPolicy Bypass -File .\reassemble.ps1
```

Restored files are written to `./restored/`.

## Verify (SHA256 of original files)

```
BAF6805DC7708338169F81B75BF0D583918E791106ECD1DC55779D159C1C2491  HwHmosHiVoicePC.hap
51CAB0F1038B2BB4E797226465715BF5454C11A5664B9E212459EB11B9ADAFD7  HwHmosVAssistant.hap
```

```powershell
Get-FileHash .\restored\HwHmosHiVoicePC.hap -Algorithm SHA256
Get-FileHash .\restored\HwHmosVAssistant.hap -Algorithm SHA256
```
