# HeadsUp 🎤

Game tebak lagu ala "Heads Up!" buat dimainkan rame-rame.

## Cara Main
1. Satu orang taroh hp di jidat, layar menghadap ke atas
2. Temen-temen nyanyi, hum, atau kasih clue soal lagu di layar
3. **Bener** → pencet ✓ BENER (atau miringin hp ke bawah ~40°)
4. **Gak tau** → pencet ⟳ SKIP (atau miringin hp ke atas ~40°)
5. Dapet sebanyak mungkin dalam 60 detik!

## Cara Buka di Xcode
1. Buka `HeadsUp.xcodeproj`
2. Pilih target iPhone / simulator
3. Ganti `PRODUCT_BUNDLE_IDENTIFIER` di Build Settings jadi bundle ID kamu sendiri
4. Tekan ▶ Run

## Struktur File
```
HeadsUp/
├── HeadsUp.swift      — Entry point @main
├── ContentView.swift       — Root navigation antar screen
├── Models.swift            — Song struct + data semua kategori
├── GameViewModel.swift     — Game logic, timer, state
├── HomeView.swift          — Layar awal + pilih kategori
├── CountdownView.swift     — Hitung mundur 3-2-1
├── PlayingView.swift       — Main game + CoreMotion tilt
└── ResultView.swift        — Score + riwayat lagu
```

## Requirements
- Xcode 15+
- iOS 17+
- Device fisik (CoreMotion / tilt tidak bekerja di simulator)

## Fitur
- 4 kategori: Indonesia, Hits Global, Dangdut, Nostalgia
- Tilt detection pakai CoreMotion (miringin hp buat bener/skip)
- Pilih durasi: 30 / 60 / 90 detik
- Score, akurasi, dan riwayat lagu di akhir ronde
# HeadsUp
