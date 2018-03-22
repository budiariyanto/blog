+++
author = "Budi Ariyanto"
title = "Maven Multi Module Project"
date = "2014-05-19T17:19:49+07:00"
slug = "maven-multi-module-project"
categories = [
    "Programming"
]
tags = [
    "tutorial",
    "maven",
    "java"
]
keywords = [
    "maven multi module"
]
+++
Dalam membuat satu project besar, sebaiknya kita bagi menjadi beberapa project kecil. Project kecil ini tujuannya untuk membagi project supaya strukturnya projectnya lebih mudah dipahami dan juga lebih modular. Maven mempunyai fitur untuk membantu merealisasikan hal ini, yaitu project inheritance dan project aggregation. Mari kita bahas satu per satu.

## Briefing
Untuk membantu memahami dengan mudah, kita akan membuat sebuah project sederhana bernama "Manusia" dimana project ini punya modul yang bernama "Kepala", "Badan", "Tangan" dan "Kaki". Modul-modul ini meng-inherit/mewarisi apa yang menjadi kepunyaan project "Manusia" dan sekaligus menjadi agregasinya, karena bisa dibayangkan bahwa manusia mempunyai kepala, badan, tangan dan kaki.

## Parent POM
Buat parent POM di direktori terserah Anda. Pada tutorial ini akan saya buat pada direktori ```/home/budi/project/manusia```. Parent POM adalah POM milik project "Manusia". Definisinya sebagai berikut:
```xml
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>

  <groupId>org.projects</groupId>
  <artifactId>manusia</artifactId>
  <version>0.0.1-SNAPSHOT</version>
  <packaging>pom</packaging>

  <name>manusia</name>
  <url>http://manusia.projects.org</url>

  <properties>
    <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
  </properties>

  <dependencies>
	<dependency> 
	  <groupId>ch.qos.logback</groupId>
	  <artifactId>logback-classic</artifactId>
	  <version>1.1.2</version>
	</dependency>
  	<dependency>
		<groupId>org.slf4j</groupId>
		<artifactId>slf4j-api</artifactId>
		<version>1.7.7</version>
	</dependency>
    <dependency>
      <groupId>junit</groupId>
      <artifactId>junit</artifactId>
      <version>3.8.1</version>
      <scope>test</scope>
    </dependency>
  </dependencies>
</project>
```

Parent POM sebetulnya adalah POM biasa. Yang perlu diperhatikan adalah ```packaging```nya adalah **pom**.

## Project Inheritance
Setelah tadi sudah membuat parent POM maka sekarang kita akan membuat POM dari masing-masing modul yang diinherit dari parent POM. Kita akan membuat POM-nya pada direktori:

* ```/home/budi/project/manusia/manusia-kepala``` untuk modul manusia-kepala
* ```/home/budi/project/manusia/manusia-badan``` untuk modul manusia-badan
* ```/home/budi/project/manusia/manusia-tangan``` untuk modul manusia-tangan
* ```/home/budi/project/manusia/manusia-kaki``` untuk modul manusia-kaki

Berikut ini contoh POMnya:

```xml
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
	<modelVersion>4.0.0</modelVersion>

    <!-- Penting! Inherit dari parent POM -->
	<parent>
		<groupId>org.project</groupId>
		<artifactId>manusia</artifactId>
		<version>0.0.1-SNAPSHOT</version>
	</parent>

    <!-- groupId dan version tidak didefinisikan lagi -->
	<artifactId>manusia-kepala</artifactId>
	<packaging>jar</packaging>

	<name>manusia-kepala</name>
	<url>http://kepala.manusia.projects.org</url>

    <!-- Walaupun dependecy di sini hanya ada 2, yaitu spring-core dan postgresql driver,
         sebetulnya juga ada slf4j, logback-classic dan junit yang diinherit dari parent POM -->
	<dependencies>
		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-core</artifactId>
			<version>4.0.4.RELEASE</version>
		</dependency>
		<dependency>
			<groupId>org.postgresql</groupId>
			<artifactId>postgresql</artifactId>
			<version>9.3-1100-jdbc41</version>
		</dependency>
	</dependencies>
</project>
```

Untuk POM manusia-badan, manusia-tangan dan manusia-kaki sama saja. tinggal sesuaikan saja artifactId, packaging, name, url dan daftar dependency-nya.

## Project Aggregation
Project aggregation bertujuan supaya kita dapat mengagregasi module project ke parent project dengan menambahkan tag ```modules``` pada parent POM. Jadi, sekarang parent POM nya menjadi seperti ini:

```xml
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>

  <groupId>org.projects</groupId>
  <artifactId>manusia</artifactId>
  <version>0.0.1-SNAPSHOT</version>
  <packaging>pom</packaging>

  <name>manusia</name>
  <url>http://manusia.projects.org</url>
  
  <!-- Agregasi project yang berkaitan.
       Definisinya menggunakan artifact id dari masing-masing modul. -->
  <modules>
  	<module>manusia-kepala</module>
  	<module>manusia-badan</module>
  	<module>manusia-tangan</module>
  	<module>manusia-kaki</module>
  </modules>

  <properties>
    <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
  </properties>

  <dependencies>
	<dependency> 
	  <groupId>ch.qos.logback</groupId>
	  <artifactId>logback-classic</artifactId>
	  <version>1.1.2</version>
	</dependency>
  	<dependency>
		<groupId>org.slf4j</groupId>
		<artifactId>slf4j-api</artifactId>
		<version>1.7.7</version>
	</dependency>
    <dependency>
      <groupId>junit</groupId>
      <artifactId>junit</artifactId>
      <version>3.8.1</version>
      <scope>test</scope>
    </dependency>
  </dependencies>
</project>
```

## Coba
Untuk melihat hasilnya seperti apa, masuk ke direktori ```/home/budi/project/manusia``` (direktori parent project), lalu jalankan perintah ```mvn clean package```
