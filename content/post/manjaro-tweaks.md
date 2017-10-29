+++
title = "Manjaro Troubleshooting"
description = "Troubleshooting permasalahan di Manjaro linux"
author = "Budi Ariyanto"
date = 2017-09-14T23:26:59+07:00
tags = ["linux"]
+++

[Manjaro](https://manjaro.org) adalah salah satu distro linux yang masih baru. Distro ini based on [Arch Linux](https://www.archlinux.org). Manjaro menarik sekali untuk dicoba. Setelah saya coba, ada beberapa masalah di hardware. Nah pada artikel ini, saya akan share permasalahan yang saya hadapi dan solusinya. Sebagai informasi, saya menggunakan laptop Acer E5-475G-541U. Siapa tau solusi yg saya share di sini berguna untuk Anda meskipun beda laptop, karena permasalahan yg sama bisa saja terjadi di berbagai macam laptop yang berbeda.

## Sound Related
### Ada bunyi buzz/crackling seperti bunyi listrik ketika laptop tidak dalam kondisi dicharge dan sound device tidak dalam keadaan bekerja (idle).
Bunyi buzz/crackling ini disebabkan karena Manjaro menggunakan [TLP](http://linrunner.de/en/tlp/tlp.html). TLP ini berfungsi mengatur power di setiap device yang ada di laptop termasuk sound device. Sayangnya ternyata tidak semua device lancar menggunakan TLP. Di laptop saya, ketika sound device idle maka TLP akan melakukan power save pada sound device tersebut, sehingga mungkin listrik yang dialirkan dihemat. Tapi efek sampingnya adalah terjadinya bunyi buzz/crackling. Untuk menonaktifkan TLP pada sound device, perintahnya adalah:

1. Buka file `/etc/default/tlp` menggunakan text editor favorit Anda.
1. Cari bagian `SOUND_POWER_SAVE_ON_BAT=1`.
1. Ganti menjadi `SOUND_POWER_SAVE_ON_BAT=0`
1. Restart laptop.

## VGA Related
### Waktu nonton video terjadi video tearing
Video tearing adalah semacam visual glitch pada video ketika dimainkan.
Contohnya video tearing bisa dilihat [di sini](https://en.wikipedia.org/wiki/Screen_tearing).
Sebetulnya hal ini tidak terlalu menjadi masalah. Hanya saja mengganggu
kesempurnaan menonton ketika kita menonton film yg kita suka. Untuk mengatasi
hal ini, ikuti langkah berikut:

1. Edit file `/etc/X11/mhwd.d/intel.conf` menggunakan text editor favorit Anda.
1. Cari bagian device, lalu tambahkan `Option  "TearFree" "true"` pada section
   device. Kira-kira seperti ini:
   ```
   Section "Device"
        Identifier  "Intel Graphics"
        Driver      "intel"
        Option      "TearFree" "true"
   EndSection
   ```
