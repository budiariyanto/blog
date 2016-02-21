+++
author = "Budi Ariyanto"
date = "2014-01-25T17:50:04+07:00"
description = ""
tags = ["opinion"]
title = "Memilih Distro Linux"

+++
Saya sudah cukup lama berkelana gonta-ganti distro linux, sejak akhir tahun 2006. Distro yang pernah saya pakai adalah [Ubuntu](http://www.ubuntu.com), [openSUSE](http://www.opensuse.org), [Fedora](http://fedoraproject.org), [Mint](http://www.linuxmint.com), [Slackware](http://www.slackware.com) dan [Arch](http://www.archlinux.org). Pernah juga hanya sekedar coba-coba Backtrack(sekarang namanya [Kali Linux](http://www.kali.org)), [Slax](http://www.slax.org) dan [Puppy](http://puppylinux.org). Orang yang baru berkenalan dengan linux biasanya bernasib sama seperti saya waktu dulu. Bingung dengan banyaknya pilihan distro linux yang sudah seperti hutan belantara. Karena bingung, akhirnya bertanya ke sana kemari distro linux yang ini dengan yang itu bagus yang mana? Jawaban orang-orang yang ditanya pun bervariasi. Orang-orang biasanya menjawab dengan hal-hal yang bagus-bagus mengenai distro linux yang dia gunakan. Karena semuanya bagus, bertanya kepada orang-orang yang sudah menggunakan distro linux tidak menjawab kebingungan saya. Yang ada malah tambah bingung karena kok semuanya bagus. Akhirnya ya harus coba-coba sendiri. Lama kelamaan, saya tau bahwa distro linux itu memang ada faktor selera dan masing-masing distro linux mempunyai rancangan dan tujuan masing-masing. Jadi, tidak ada distro linux yang paling bagus. Semua tergantung selera dan kebutuhan. Maka dari itu, saya ingin membantu Anda yang baru berkenalan dengan linux, dengan membagikan pengalaman saya mengenai perjalanan saya belajar linux. Semoga membantu.

<!--more-->

## Bagaimana Caranya Agar Betul-Betul Mengerti Cara Kerja Linux?
Distro linux adalah distribusi linux. Perbedaan yang paling kelihatan antara distro satu dengan yang lain adalah apa yang Anda dapat ketika pertama kali selesai menginstall distro tersebut. Misalnya kalau kita menginstall Ubuntu, selesai menginstall akan ada GUI bernama Unity(jaman dulu menggunakan GNOME), ada aplikasi office, transmission(untuk download via torrent), firefox dan lain-lain. Kalau install Arch, tidak ada GUI. Harus install sendiri. Yang ada hanya aplikasi CLI yang sangat umum. Tapi apapun distronya, intinya itu adalah linux. Jadi seharusnya mau menggunakan distro apapun kita tetap mengerti cara kerjanya. Nah bagaimana caranya agar kita tidak hanya mengerti distro linux, tapi sampai mengerti cara kerja linux itu sendiri? Berikut ini tips dari saya:

1. Gunakanlah linux yang design-nya sederhana. Yang sederhana design distronya lho ya. Bukan pemakaiannya yang sederhana. Pemakaiannya justru terkesan ribet. Karena sistemnya sederhana, kita harus banyak belajar menggunakan command line interface, compile aplikasi dan dependensinya secara manual, konfigurasi environment variable, system services, partisi, struktur direktori dan lain sebagainya. Maka dari itu, supaya bisa belajar dengan nikmat, pilih distro yang dokumentasinya lengkap. Pilihan saya untuk belajar linux adalah Slackware.

1. Karena harus banyak membaca dokumentasi atau referensi dalam bahasa inggris, ya belajarlah bahasa inggris. Tidak usah sampai bisa berbicara menggunakan bahasa inggris. Cukup sampai bisa membaca dan mengerti kalimat-kalimat dalam bahasa inggris saja.

1. Kalau tidak berani mencoba tidak akan bisa. Perlu diingat, hasil percobaan itu ada 2. Berhasil atau gagal. Kalau berhasil ya syukur, kalau gagal separah-parahnya bisa menlenyapkan seisi harddisk. Maka dari itu saya sangat menyarankan Anda membeli harddisk external untuk membackup semua data yang penting. Yang tidak penting mau ikutan dibackup juga terserah :) Yang penting ada backupnya.

1. Apa daya peralatan untuk percobaan sangat minimal. Misalkan hanya punya 1 laptop atau PC. Ya kalau situasi dan kondisinya seperti ini bisa dengan menginstall linux dan sistem operasi yang lain secara berdampingan(*dual-boot*). 

1. Harddisk untuk backup sudah dibeli dan data sudah dibackup. Seharusnya tidak ada lagi alasan untuk menyerah kecuali mesin yang Anda pakai tiba-tiba rusak total atau meledak. Jangan menyerah ketika belum terbiasa menggunakan linux. Rasanya memang aneh dan tidak enak, tapi begitu sudah terbiasa Anda tidak akan kembali lagi menginstall OS lama Anda yang mungkin sangat mudah terkena virus dan tidak stabil itu. :p

Setelah nyaman dengan Slackware, barulah coba beralih ke distro lain. Saya rasa kira-kira paling lama 1 minggu Anda sudah bisa mengerti distro lain yang baru Anda pakai itu. Kok bisa? Karena sudah mengerti cara kerja *low-level*-nya. Cara yang *low-level* saja bisa kok, apalagi yang cuma *klak-klik klak-klik* pakai mouse begitu. Distro yang lebih kompleks biasanya menawarkan kemudahan di sisi pengguna. Istilah populernya *user-friendly*. Semakin *user-friendly*, cara kerja sistem yang sebenarnya semakin tersembunyi. Maka dari itu kalau kita langsung menggunakan distro yang *user-friendly*, kita biasanya akan "terjebak" dengan kemudahan yang ditawarkan, sehingga sudah malas belajar hal-hal yang bersifat *low-level*. Kalau sudah begini ya kita hanya bisa menggunakan distro tersebut, tapi tidak bisa menggunakan linux yang sebenarnya.

## Distro Linux Yang Mana Yang Harus Saya Pilih?
Setelah mengerti cara kerja linux, inilah saatnya memilih distro yang sesuai dengan kebutuhan dan selera kita. Berdasarkan pengalaman saya, ada 4 kelompok distro linux berdasarkan tujuannya atau *by designnya*, yaitu:

1. Minimalis  
Distro minimalis adalah distro yang design sistemnya sederhana. Pilihan saya untuk distro minimalis ini adalah Slackware dan Arch. Lebih spesifik lagi, kalau kita membutuhkan sistem yang super stabil pakailah Slackware. Cocok untuk dipasang di server maupun desktop. Kalau suka atau butuh sistem yang bisa memberikan sensasi seperti membangun distro sendiri, aplikasi-aplikasinya selalu *up to date* menggunakan versi rilis yang terakhir dan menggunakan teknologi yang baru muncul(dikenal dengan istilah *bleeding edge*), pakailah Arch.

1. User-friendly / beginner / desktop  
Sesuai sebutannya, distro yang *user-friendly* adalah distro yang mudah digunakan. Saya menyarankan Mint atau Ubuntu karena sangat populer(banyak yang pakai), cukup stabil dan benar-benar mudah. Kendala mungkin ada, tapi hanya sedikit. *Tweaking* sebentar langsung jalan dengan baik. Biasa diinstall di komputer desktop atau laptop.

1. Khusus server  
Distro jenis ini sangat memprioritaskan kestabilan sistem daripada teknologi terbaru yang ada saat ini. Kelebihannya, sistemnya sangat stabil tapi kekurangannya adalah aplikasi-aplikasinya banyak yang sudah "kuno". Saran saya adalah Debian. Walaupun Debian dikategorikan sebagai distro untuk server, tapi banyak juga orang yang menginstallnya di desktop atau laptop dengan mengikuti *branch* Debian testing atau sekalian *branch* unstable(Sid). Kalau tidak suka Debian alternatifnya bisa menggunakan Slackware.

1. Tujuan sangat spesifik  
Misalnya kita ingin melakukan *security penetration test*, kita bisa gunakan Kali Linux. Kalau butuh OS yang bisa diinstall dan dijalankan lewat flashdisk, kita bisa install puppy atau slax. Saya sendiri memilih slax karena based on Slackware yang notabene stabil.

## Distro Paling "Josss" Menurut Saya
Untuk desktop/laptop saya memilih Ubuntu. Alasannya:

1. Karena pekerjaan saya membuat program, maka saya mau linux yang mudah digunakan dan cukup stabil.
1. Semua hardware berjalan dengan baik di laptop saya.
1. Aplikasi yang tersedia super lengkap.
1. Komunitasnya aktif sehingga kalau ada permasalahan menyelesaikannya bisa lebih cepat.

Untuk server saya memilih Slackware. Alasannya:

1. Super stabil.
1. Cukup secure.
1. Tidak "kuno-kuno" amat karena biasanya paling lama 1 tahun sudah keluar versi baru dengan aplikasi-aplikasi yang sudah diupdate. Kalau Debian bisa 2 - 3 tahun baru rilis.
1. Aplikasi bawaannya cukup lengkap.

Begitulah kira-kira pengalaman saya. Kalau Anda mau ngikut silahkan, mau eksplorasi sendiri juga boleh. Ikuti kebutuhan dan selera Anda :)
