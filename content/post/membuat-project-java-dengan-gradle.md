+++
author = "Budi Ariyanto"
date = "2014-06-16T03:29:56+07:00"
description = ""
tags = ["tutorial"]
title = "Membuat Project Java Dengan Gradle"

+++
Build tools adalah sebuah tools atau alat untuk mengcompile suatu project berisi source code yang kita buat. Build tools banyak macamnya dan sudah ada sejak lama.

## Kenapa Kita Butuh Build Tools
Setelah kita selesai ngoding, tentunya kita compile aplikasi kita. Nah proses peng**compile**an biasanya mencakup banyak hal, misalnya yang paling mendasar adalah mengubah source code menjadi binary. Proses ini kadang menjadi rumit ketika code yang kita buat menggunakan satu atau lebih library eksternal. Project kita menjadi dependen(bergantung) kepada library yang kita gunakan. Ternyata library yang kita gunakan pun dependen terhadap library lainnya lagi. Semuanya ini kalau kita selesaikan satu per satu secara manual bisa membuat pusing kepala.

Masalah lainnya lagi adalah ketika packaging. Packaging project adalah aktivitas kita sebelum mendistribusikan project kita. Dalam kegiatan packaging ini, kita seleksi file-file mana saja yang harus diikutsertakan, bagaimana layoutnya, apa tipe packagenya dan sebagainya. Nah build tools ini mempunyai kemampuan untuk membantu kita dalam mengerjakan hal ini. Cukup sekali melakukan konfigurasi saja, selanjutnya biar build tools yang melakukannya. Jadi intinya adalah build tools ini membantu mengotomatisasi pekerjaan kita dalam hal distribusi dan build project. Pertanyaannya, apa build tools yang bagus untuk project Java? Menurut saya ada 2 yaitu [Maven](http://maven.apache.org) dan [Gradle](http://www.gradle.org). Maven sebelumnya sudah pernah saya bahas secara singkat di [sini](blog/2014/01/17/tutorial-singkat-maven/) dan di [sini](blog/2014/05/19/maven-multi-module-project/). Sekarang saya akan membahas Gradle.

## Gradle
Gradle adalah build tools modern yang sedang booming akhir-akhir ini, terutama di kalangan penggemar bahasa pemrograman Java. Gradle ini mirip seperti build tools lain, contohnya make atau rake. Konfigurasi build automation pada gradle menggunakan bahasa pemrograman Groovy. Pada artikel ini saya tidak membahas tentang bahasa pemrograman Groovy, tapi saya ambil yang penting-pentingnya saja supaya kita dapat membuat project Java menggunakan Gradle diintegrasikan dengan Maven. Wah kenapa Maven masih ikut-ikut?

Jadi begini, kegunaan Gradle sedikit berbeda dengan Maven. Gradle adalah build tools yang tidak spesifik terhadap satu bahasa pemrograman tertentu, sedangkan Maven spesifik untuk membantu membuat project yang kita buat menggunakan Java. Kalau kita perhatikan di ebook-ebook Gradle yang ada, pasti tutorial yang ada di dalam buku tersebut malah membahas bagaimana membuat project dan task Gradle secara umum menggunakan bahasa pemrograman Groovy, bukan langsung membahas bagaimana membuat project Java dengan menggunakan Gradle. Nah nanti kita akan membahas bagaimana membuat task dan mengatur project yang kita buat menggunakan Gradle, tapi masih menggunakan maven untuk memanage dependency project yang ada.

Jadi, Gradle bisa digunakan untuk project apa saja karena kita bisa membuat task sendiri di dalamnya dimana task tersebut kita sendiri yang membuatnya mau jadi bagaimana. Itulah sekilas tentang Gradle.

## Menginstall Gradle
Berikut ini langkah-langkah setup gradle di komputer kita:

1. Download gradle di websitenya lalu ekstrak di direktori mana saja.
1. Buat environment variable bernama ```GRADLE_HOME``` dan isi valuenya dengan path menuju direktori gradle yang diekstrak tadi.
1. Logout dari sistem, login lagi. Selesai. :)

<!--more-->

## Java Project Layout
Project layout sebetulnya terserah kita mau bagaimana. Tapi java punya konvensi terhadap project layout ini. Project layout yang saya gunakan biasanya ada 3 yaitu untuk project java, java web dan java enterprise. Untuk mendukung contoh penggunaan Gradle pada pembahasan artikel ini, saya akan memilih menggunakan project layout java. Layoutnya seperti ini:
```
 +-projectRootDir
  +-src
   +-main
   | +-java
   | +-resources
   +-test
    +-java
    +-resources
```

Layout di atas adalah layout untuk project tunggal. Nanti kita akan buat menjadi layout multi project menggunakan Gradle. Multi project pengertiannya adalah ada satu atau banyak project di dalam satu project. Kenapa harus multi project? Karena menurut saya project akan lebih jelas peranannya karena lebih modular dan lebih gampang memaintainnya.

## Gradle Project dan Task
Untuk membuat project Gradle, cukup buat direktori biasa. Misalkan direktorinya kita beri nama ```coba_gradle```. Direktori ini nantinya akan berlaku sebagai root project. Untuk membuatnya menjadi root project Gradle, di dalam direktori ```coba_gradle``` kita **harus** membuat file bernama ```build.gradle```. Sudah, cukup itu saja. :) 

Gradle task adalah task yang kita coding sendiri menggunakan bahasa pemrograman Groovy. Karena kita akan membuat project java kita akan menggunakan **plugin** java pada Gradle. Apa peran atau fungsi plugin? Plugin pada Gradle adalah untuk meringankan kita dalam membuat task. Jika kita menggunakan plugin maka kita tidak perlu membuat task lagi.

Selanjutnya kita akan bahas isi dari file ```build.gradle``` ini yang merupakan konfigurasi dari root project yang kita buat. Saya beri contoh isi filenya:

```groovy
// Dengan apply java plugin, kita dibuatkan task-task untuk membuild program java kita
// Untuk mengeceknya, kita bisa jalankan perintah: gradle tasks
// nanti akan tampil task-task apa saja yang available. Bandingkan daftar tasknya ketika kita belum apply plugin java
apply plugin: 'java'

// Ini adalah project properties. Saya menggunakannya untuk listing masing-masing versi dari dependency yang digunakan
// Project properties ini digunakan ketika mendeklarasikan dependency
project.ext {
    JUNIT_VERSION = '4.11'
    SPRING_CORE_VERSION = '4.0.5.RELEASE'
}

// Konfigurasi untuk semua project
allprojects {
    // Konfigurasi repository maven
    // Kita menggunakan 2 repository. Local dan maven central
    repositories {
        // Konfigurasi repository lokal maven. Kita arahkan ke komputer lokal di direktori
        // /home/budi/.m2/repository
        // Bisa juga diarahkan ke local repository server seperti nexus atau artifactory
        maven {
            url "file://home/budi/.m2/repository"
        }

        // Special Gradle notation yang berguna untuk memberitahu Gradle bahwa kita menggunakan repository maven central
        mavenCentral() 
    }    
}

// Konfigurasi untuk tiap subproject
// Nantinya ketika kita membuat subproject, konfigurasi ini akan diwariskan ke subproject tersebut
subprojects {
    apply plugin: 'java'

    // Supaya kita tidak usah repot membuat maven task.
    apply plugin: 'maven'
                
    // Konfigurasi maven plugin supaya mengupload artifact ke path yang kita inginkan
    uploadArchives {
        repositories {
            mavenDeployer {
                // Path kita set ke direktori komputer lokal /home/budi/.m2/repository
                repository(url: "file://home/budi/.m2/repository/")
            }
        }
    }
    
    // Deklarasi dependency untuk setiap subproject
    dependencies {
        // Syntaxnya adalah <scope> "<groupId>:<artifactId>:<version>"
        // Scope ada 4, yaitu compile, runtime, testCompile, testRuntime
        // compile: dependency diperlukan saat compile ataupun development
        // runtime: dependency diperlukan saat runtime
        // testCompile: dependency diperlukan saat ngetes-ngetes program
        // testRuntime: dependency diperlukan saat program yang untuk ngetes-ngetes berjalan
        
        // Sebagai contoh, kita menggunakan 2 library. JUnit dan spring-context
        // Bisa kita lihat pada deklarasi version menggunakan variable dari project properties
        testCompile "junit:junit:${project.JUNIT_VERSION}"
        compile "org.springframework:spring-context:${project.SPRING_CORE_VERSION}"
    }
}

```

## Membuat Subproject
Root project sudah dibuat. Saatnya kita membuat subproject. Untuk membuatnya sangat gampang. Cukup membuat direktori baru di dalam direktori root project. Misalkan kita buat namanya ```coba_gradle_subproject```. Di dalam direktori ini, kita buat layout project java yang sudah dibahas sebelumnya. Jangan lupa kita juga wajib membuat file ```build.gradle``` di dalam direktori ```coba_gradle_subproject``` ini. Sebagai contoh, isinya hanya seperti ini:

```groovy
version = '1.0.0.SNAPSHOT'
```

Walaupun isinya hanya seperti itu, namun karena root project sudah mendefinisikan konfigurasi pada block ```subprojects```, maka otomatis subproject ini mewarisi apa yang sudah dideklarasikan di sana, dari plugin dan dependencynya. Variabel version ini perlu kita deklarasikan supaya nanti ketika subproject ini kita compile menjadi bentuk jar misalnya, filenamenya akan ditambahkan version dari project ini. Jadi misalkan versionnya kita set ```1.0.0.SNAPSHOT```, maka file yang tercipta nantinya akan bernama ```coba_gradle_subproject-1.0.0.SNAPSHOT.jar```.

Pada file ini, kita juga bisa mendeklarasikan lagi konfigurasi yang sama dengan yang sudah ada di root project atau yang lain. Nantinya Gradle pertama kali akan membaca ```build.gradle``` dari direktori subproject, lalu membaca lagi ```build.gradle``` dari direktori root project dan mengakumulasikannya.

Nah, subproject sudah dibuat. Bagaimana caranya supaya root project mengenali subproject ini? Mari kita kembali lagi ke direktori ```coba_gradle```. Dalam direktori tersebut, buatlah file bernama ```settings.gradle``` dan deklarasikan subprojectnya di dalam file tersebut seperti berikut:

```groovy
include 'coba_gradle_subproject'

// tambahkan subproject lain jika ada
// include 'subproject2'
// include 'subproject3'
// dst...
```

Gambaran akhir dari struktur direktorinya adalah sebagai berikut:

```
 +-coba_gradle
   +-coba_gradle_subproject
   |  +-src
   |  |  +-main
   |  |  | +-java
   |  |  | +-resources
   |  |  +-test
   |  |    +-java
   |  +-build.gradle
   +-build.gradle
   +-settings.gradle
```

Setup project sudah selesai :). Kekurangan dari Gradle ini adalah belum mempunyai archetype generator seperti maven. Jadi setiap kali kita membuat subproject, kita membuat layout direktori secara manual. Ke depannya Gradle diharapkan mempunyai fitur seperti maven archetype.
