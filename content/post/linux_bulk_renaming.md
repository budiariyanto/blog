+++
date = "2017-03-12T17:59:06+07:00"
tags = ["tutorial"]
author = "Budi Ariyanto"
description = "Bulk Renaming in Linux"
title = "Bulk Renaming in Linux"

+++

There is a handy tools in linux for renaming bulk/mass files a once called
rename. It's a perl script and included in most linux distros.

## How to bulk rename files
```bash
$ rename 's/<files to rename regex pattern>/<expected regex pattern>/' <destination files>
```

## How to bulk rename files, add prefix
```bash 
$ rename 's/^/<expected regex pattern>/' <destination files>
```
