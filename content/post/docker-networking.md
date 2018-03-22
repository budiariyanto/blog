+++
author = "Budi Ariyanto"
date = "2017-03-22T10:56:18+07:00"
title = "Fix Docker Networking Problem"
slug = "fix-docker-networking-problem"
categories = [
    "Tech FAQ"
]
tags = [
    "docker"
]
keywords = [
    "docker networking issue"
]
+++

We may met situations that docker cannot connect to the internet. And the error message look like this:
```bash
Step 1/3 : FROM docker/whalesay:latest
 ---> 6b362a9f73eb
Step 2/3 : RUN apt-get -y update && apt-get install -y fortunes
 ---> Running in 10c0ca4a809a
Err http://archive.ubuntu.com trusty InRelease
  
Err http://archive.ubuntu.com trusty-updates InRelease
  
Err http://archive.ubuntu.com trusty-security InRelease
  
Err http://archive.ubuntu.com trusty Release.gpg
  Could not resolve 'archive.ubuntu.com'
Err http://archive.ubuntu.com trusty-updates Release.gpg
  Could not resolve 'archive.ubuntu.com'
Err http://archive.ubuntu.com trusty-security Release.gpg
  Could not resolve 'archive.ubuntu.com'
Reading package lists...
W: Failed to fetch http://archive.ubuntu.com/ubuntu/dists/trusty/InRelease  

W: Failed to fetch http://archive.ubuntu.com/ubuntu/dists/trusty-updates/InRelease  

W: Failed to fetch http://archive.ubuntu.com/ubuntu/dists/trusty-security/InRelease  

W: Failed to fetch http://archive.ubuntu.com/ubuntu/dists/trusty/Release.gpg  Could not resolve 'archive.ubuntu.com'

W: Failed to fetch http://archive.ubuntu.com/ubuntu/dists/trusty-updates/Release.gpg  Could not resolve 'archive.ubuntu.com'

W: Failed to fetch http://archive.ubuntu.com/ubuntu/dists/trusty-security/Release.gpg  Could not resolve 'archive.ubuntu.com'

W: Some index files failed to download. They have been ignored, or old ones used instead.
....
```
<!--more-->
This because docker network not properly set up yet. To set network on docker, we can do this:

Find primary and secondary dns server using this command:

```bash
$ nmcli dev show | grep 'IP4.DNS'
```

Create file `/etc/docker/daemon.json` and add:

```json
{
	"dns": ["10.0.0.2", "10.0.0.3"]
}
```

Or you can change dns using google dns `8.8.8.8` and `8.8.4.4`.

Finally, restart docker: `sudo service docker restart`
