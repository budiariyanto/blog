+++
author = "Budi Ariyanto"
date = "2016-10-01T21:11:36+07:00"
description = "Tutorial golang (1)"
tags = [ "tutorial", "golang" ]
title = "Instalasi Golang"
+++

Bahasa pemrograman saat ini berkembang begitu cepat. Banyak bahasa pemrograman baru bermunculan dan beragam. Bahasa pemrograman baru yang sempat saya coba adalah go atau biasa disebut golang(go language) yang dikembangkan oleh Google. Golang dirilis pada tahun 2009, dan saat artikel ini ditulis sudah mencapai versi 1.7.1.

## Download Golang
Kita bisa mendownload golang di [sini](https://golang.org/dl/). Downloadlah yg cocok dengan OS kita.

## Setup Environment Variable
Setelah kita download, extractlah di sembarang folder. Sebelum bisa ngoding menggunakan tools di golang, kita harus setup 2 hal, yaitu environment variabel `GOROOT` dan `GOPATH`. `GOROOT` kita set menuju path dimana golang diextract. `GOPATH` kita set terserah di folder mana, yang penting tidak menjadi satu di dalam `GOROOT` supaya kalau kita upgrade golang nya akan mudah, tinggal hapus dan extract ulang. Tidak usah menyelamatkan folder `GOPATH`.

Tambahkan environment variabel `GOROOT/bin` dan `GOPATH/bin`  pada variabel `PATH` di dalam `/etc/profile.d/go.sh` supaya binary dari project yang kita buat maupun binary dependency dari github/tempat lain bisa ditemukan oleh OS menggunakan script di bawah ini:
```bash
export GOROOT=/data/development/go
export GOPATH=/data/development/gopkg

export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$GOPATH/bin
```

Setelah selesai setup environment variable, logout dan login ulang atau restart komputer kita.

## Check Instalasi Golang
Untuk mengecek apakah instalasi golang kita sudah benar atau belum, ketik `go` di terminal. Seharusnya akan muncul output seperti ini:
```
    Go is a tool for managing Go source code.

    Usage:

        go command [arguments]

    The commands are:

        build       compile packages and dependencies
        clean       remove object files
        doc         show documentation for package or symbol
        env         print Go environment information
        fix         run go tool fix on packages
        fmt         run gofmt on package sources
        generate    generate Go files by processing source
        get         download and install packages and dependencies
        install     compile and install packages and dependencies
        list        list packages
        run         compile and run Go program
        test        test packages
        tool        run specified go tool
        version     print Go version
        vet         run go tool vet on packages

    Use "go help [command]" for more information about a command.

    Additional help topics:

        c           calling between Go and C
        buildmode   description of build modes
        filetype    file types
        gopath      GOPATH environment variable
        environment environment variables
        importpath  import path syntax
        packages    description of package lists
        testflag    description of testing flags
        testfunc    description of testing functions

    Use "go help [topic]" for more information about that topic.
```
Jika instalasi sudah benar, maka kita sudah siap ngoding.