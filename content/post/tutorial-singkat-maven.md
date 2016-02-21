+++
author = "Budi Ariyanto"
date = "2014-01-17T17:26:33+07:00"
description = ""
tags = ["tutorial"]
title = "Tutorial Singkat Maven"

+++
## Apa itu Maven?
Maven adalah suatu *tool* untuk menstandarkan dan *memanage* project, mempermudah proses *build* dalam suatu project, mendefinisikan secara jelas apa saja isi project dan mempermudah dalam membagi-bagikan (*share*) file .jar di semua project. Maven sering di-versuskan dengan ant, atau bahkan ada yang bilang sama saja. Menurut saya, maven mempunyai tujuan yang lebih luas daripada ant yang hanya fokus untuk *build tool* dan membuat task-task tertentu saja. Fitur-fitur ant ada pada maven bahkan maven bisa diintegrasikan dengan ant via maven plugin.

## Kenapa harus pakai Maven?
Suatu project pasti mempunyai struktur direktori. Struktur direktori project ini biasa disebut *project template*. Struktur direktori setiap orang atau setiap tim berbeda. Setiap tim menentukan standarnya sendiri, lalu jika ada orang baru masuk dalam tim tersebut, orang baru itu mengikuti standar project template yang sudah ada. Yang biasa dilakukan, orang baru tersebut membuat project baru di IDE, lalu melihat catatan project template yang sudah ada itu bagaimana. Struktur direktori project baru tersebut berusaha dibuat sama dengan struktur direktori standar project dengan membuat folder-folder, menambahkan file-file dan sebagainya. Dengan maven, pada umumnya kita cukup sekali membuat archetype untuk 1 jenis project. Setelah itu ketika membuat project baru, kita tinggal mengenerate project template dengan menggunakan archetype yang sudah dibuat tadi. Semua hal mengenai project template langsung bisa terkonfigurasi secara otomatis sesuai standar. Kalau ada keperluan khusus, baru kita tambahkan sendiri.

Selain permasalahan project template, hampir di setiap project kita menggunakan library. Jika kita menggunakan library dalam suatu project, berarti project kita dependen terhadap library tersebut. Maka library tersebut adalah dependency dari project kita. Nah, peran maven di sini adalah memanage dependency sehingga programmer dapat dengan mudah menambahkan library yang ingin digunakan. "Ah, cuma nambah dependency gitu aja kok harus pakai maven? Repot banget sih..". Perlu diketahui, library tidak selamanya *"stand-alone"*. Jangan berasumsi bahwa jika kita ingin menambahkan library A dan B, yang kita tambahkan ke project ya hanya A dan B. Sering kali misalnya library A dependen terhadap library B, C, D, E, F dan G. Library H dependen terhadap library I, J dan K. Jadi, library yang ingin kita tambahkan sebetulnya hanya 2 (A dan H), tapi karena harus menambahkan juga dependensinya(B, C, D, E, F, G, I, J, K) pada akhirnya ada 11 library yang harus ditambahkan. Belum lagi kalau ternyata semua dependensi itu harus didownload satu per satu, di tempat yang berbeda-beda pula. Belum lagi kalau source code kita karena sesuatu hal harus dipindahkan ke mesin lain. Dengan asumsi bahwa environmentnya berbeda, kita harus setting ulang semua path dari library tersebut supaya dapat ditemukan oleh IDE. Hal ini membuat pusing kepala. Yang tadinya saya mau mulai membuat kode program dengan nyaman, harus repot mengurus hal-hal yang demikian. Maven membantu menyelesaikan permasalahan ini.

Maven juga membantu dalam hal portability project. Saya pribadi menginginkan project dapat dibuka di IDE manapun dengan baik. Nah, kalau kita buat project baru di Netbeans nanti kalau ganti IDE menggunakan Eclipse project jadi tidak bisa dibuka. Kalau awalnya menggunakan Eclipse, dibuka menggunakan Netbeans harus menggunakan project importer milik Netbeans, yang saya sendiri masih ragu apakah bisa menyelesaikan semua kasus import project dengan baik. Untuk mengatasi hal ini, semua project saya buat menggunakan maven. Hati saya menjadi tenang. IDE java kelas kakap seperti Netbeans, Eclipse dan IntelliJ IDEA dapat membuka maven project dengan baik. Atau kalau project mau dibuka menggunakan editor seperti nano atau vim pun juga tidak masalah. *Last but not least*, hal-hal inilah yang membuat maven berperan penting dalam setiap project.

<!--more-->

## Installasi dan Konfigurasi Maven
Maven bisa didownload di [maven website](http://maven.apache.org). Saya merekomendasikan menggunakan Maven 3. Setelah didownload, cara menginstallnya cukup diekstrak saja. Setelah diekstrak, Anda harus setting environment variable supaya Anda dapat menjalankan maven dengan mudah.

```bash
M2_HOME = /path/to/your/maven/installation/directory
PATH = $PATH:$M2_HOME
```
Sebagai catatan, setting untuk environment variable berbeda-beda caranya. Sesuaikan dengan OS yang Anda gunakan.

Kalau Anda menggunakan linux, coba cek dulu di package repository distro yang Anda pakai ada maven atau tidak. Kalau ada, barang kali Anda bisa mencoba menginstall maven menggunakan repository dari distro tersebut supaya lebih mudah. Kalau saya pribadi lebih suka download dari website maven, install dan konfigurasi sendiri.

## POM (Project Object Model)
POM pasti ada dalam setiap project maven. Letaknya di root directory project dan bernama `pom.xml`. POM berisi deskripsi dan konfigurasi project. Contohnya di dalam POM ada `groupId`, `artifactId`, `version`, nama project, website project, siapa developernya, deklarasi project dependensi, deklarasi maven plugin dan konfigurasi pluginnya dan lain sebagainya. Bentuk umum POM seperti ini:

```xml
<project xmlns="http://maven.apache.org/POM/4.0.0"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/POM/4.0.0
                      http://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>

  <!-- The Basics -->
  <groupId>...</groupId>
  <artifactId>...</artifactId>
  <version>...</version>
  <packaging>...</packaging>
  <dependencies>...</dependencies>
  <parent>...</parent>
  <dependencyManagement>...</dependencyManagement>
  <modules>...</modules>
  <properties>...</properties>

  <!-- Build Settings -->
  <build>...</build>
  <reporting>...</reporting>

  <!-- More Project Information -->
  <name>...</name>
  <description>...</description>
  <url>...</url>
  <inceptionYear>...</inceptionYear>
  <licenses>...</licenses>
  <organization>...</organization>
  <developers>...</developers>
  <contributors>...</contributors>

  <!-- Environment Settings -->
  <issueManagement>...</issueManagement>
  <ciManagement>...</ciManagement>
  <mailingLists>...</mailingLists>
  <scm>...</scm>
  <prerequisites>...</prerequisites>
  <repositories>...</repositories>
  <pluginRepositories>...</pluginRepositories>
  <distributionManagement>...</distributionManagement>
  <profiles>...</profiles>
</project>
```

Kita bisa lihat ada 4 bagian dalam 1 POM. Basic, build settings, project information dan environment settings. Yang paling sering dituliskan dalam POM adalah bagian basic dan build settings. Anda bisa membaca referensi tentang `pom.xml` secara lengkap di [sini](http://maven.apache.org/pom.html).

## Archetypes
Archetype bisa diartikan sebagai deskripsi dari project template. Archetype maven sebetulnya sudah ada dan siap digunakan. Untuk mengecek sekaligus menggunakannya, Anda bisa menjalankan perintah 

```bash
$ mvn archetype:generate
```

Tapi, karena archetype yang tersedia sangat general, maka kadang kala kita perlu membuat archetype sendiri yang sesuai dengan kebutuhan kita.

## Membuat Sendiri Archetype
Membuat archetype bisa dengan 2 cara. Kita buat project template sendiri dengan membuat folder-folder sendiri, disusun sendiri, menambah resource yang diperlukan lalu membuat `pom.xml`nya. Cara kedua dengan menggenerate general archetype terlebih dahulu menggunakan maven. Karena cara kedua menurut saya lebih bagus, mari kita bahas.

Buka terminal, buat folder baru, misalkan namanya `archetypeku` lalu masuklah ke folder tersebut. Untuk menggenerate general archetype, kita dapat menjalankan perintah berikut

```bash
$ mvn archetype:generate
   -DgroupId=[group id project kita]
   -DartifactId=[artifact id project kita]
   -DarchetypeArtifactId=maven-archetype-archetype
```

Setelah digenerate, akan terbentuk struktur direktori sebagai berikut

```
archetypeku
|-- pom.xml
`-- src
    `-- main
        `-- resources
            |-- META-INF
            |   `-- maven
            |       `--archetype.xml
            `-- archetype-resources
                |-- pom.xml
                `-- src
                    |-- main
                    |   `-- java
                    |       `-- App.java
                    `-- test
                        `-- java
                            `-- AppTest.java
```

File-file hasil generate ini punya kesalahan. Kesalahannya ada pada file ```pom.xml``` yang ada di dalam folder ```archetype-resources```. Buka ```pom.xml``` menggunakan text editor apa saja, lalu ganti bagian groupId, artifactId dan version sehingga tampak seperti berikut

```xml
<groupId>${groupId}</groupId>
<artifactId>${artifactId}</artifactId>
<version>${version}</version>
```

Setelah kesalahan dibetulkan, kita bisa dengan tenang menambahkan apa saja yang diperlukan ke dalam ```pom.xml``` tadi, misalnya deklarasi dependensi yang diperlukan dan informasi-informasi lain tentang project. Kita juga bisa menambahkan folder-folder yang diperlukan, tapi jangan lupa untuk mendaftarkan folder-folder tambahan tadi ke dalam archetype descriptor(`archetype.xml`). Contoh archetype.xml adalah sebagai berikut

```xml
<archetype>
<archetype>
  <id>archetypeku</id>
  <sources>
    <source>src/main/java/App.java</source>
  </sources>
  <resources>
		<resource>src/main/resources</resource>
  </resrouces>
  <testSources>
    <source>src/test/java/AppTest.java</source>
  </testSources>
  <siteResources>
    <siteResource>src/site</siteResource>
  </siteResources>
</archetype>
```

Tag `id` nilainya harus sama dengan tag `id` pada archetype `pom.xml` yang terletak pada root directory.

`<sources>, <resources>, <testSources>, <testResources>` dan `<siteResources>` tag mencerminkan pengelompokan pada project. Misalkan seperti yang tampak pada contoh archetype descriptor di atas

```
    <sources> = src/main/java
    <resources> = src/main/resources
    <testSources> = src/test/java
    <testResources> = src/test/resources
    <siteResources> = src/site
```

Berarti, di dalam folder `archetype-resources` harus ada folder-folder:

```
src/main/java
src/main/resources
src/test/java
src/test/resources
src/site
```

Di dalam folder `src/main/java` harus ada file `App.java` dan di dalam folder `src/test/java` harus ada file `AppTest.java`. Ini berarti bisa dikatakan apa yang sudah dideklarasikan di dalam archetype deskriptor harus dibuat secara nyata di dalam folder archetype-resources. Setelah semua ini selesai, berarti archetype Anda sudah siap dideploy.

## Mendeploy Archetype
Untuk mendeploy archetype di mesin lokal kita, masuk ke root directory archetype project dan jalankan perintah

```bash
$ mvn install
```

Jika hasilnya sukses, berarti archetype sudah bisa digunakan, tapi ya hanya di mesin lokal kita. Nah, bagaimana caranya supaya teman-teman 1 tim kita bisa menggunakannya? Kita bisa mendeploynya ke repository maven internal kita misalnya. Saya sendiri menggunakan nexus. Saya akan membahas bagaimana mendeploy archetype bikinan sendiri ke repository nexus, tapi saya akan berasumsi Anda sudah menginstall nexus sendiri. Kalau Anda belum tau tentang nexus dan ingin menginstallnya, Anda bisa baca dokumentasi dari [website resminya](http://www.sonatype.org/nexus/).

## Mendeploy Archetype Buatan Sendiri ke Repository Nexus
Sebelum mendeploy ke nexus, jangan lupa konfigurasi untuk authorization ke server repository nexus. Coba lihat di `~/.m2/settings.xml`. Kalau belum ada setting untuk authorization, tambahkan konfigurasi ini

```xml
<settings>
<servers>
        <server>
                <id>snapshots</id>
                <username>usernameAnda</username>
                <password>passwordAnda</password>
        </server>
			<server>
                <id>releases</id>
                <username>usernameAnda</username>
                <password>passwordAnda</password>
        </server>
</servers>
</settings>
```

Kalau sudah, masuk ke root directory project archetype yang Anda buat, lalu jalankan perintah

```bash
$ mvn deploy
```

Kalau sukses, berarti archetype Anda sudah ada di server nexus, archetype catalog juga sudah diupdate dan teman-teman 1 tim Anda sudah bisa menikmati archetype yang Anda buat. Bagaimana caranya?

## Menggenerate Project Menggunakan Archetype Buatan Sendiri
Jalankan perintah

```bash
$ mvn archetype:generate -DarchetypeCatalog=http://<host>:<port>/<path/to/repositories>
```

