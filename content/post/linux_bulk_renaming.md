+++
author = "Budi Ariyanto"
date = "2017-03-12T17:59:06+07:00"
title = "Bulk Renaming in Linux"
slug = "bulk-renaming-in-linux"
categories = [
    "System Administration"
]
tags = [
    "tutorial"
]
keywords = [
    "cli rename",
    "bulk rename"
]
+++

There is a handy tools in linux for renaming bulk/mass files a once called
rename. It's a perl script and included in most linux distros.

## How to bulk rename files
```bash
$ rename 's/<files to rename regex pattern>/<expected regex pattern>/' <destination files>
```
<!--more-->
## How to bulk rename files, add prefix
```bash 
$ rename 's/^/<expected regex pattern>/' <destination files>
```
