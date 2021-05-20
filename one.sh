#!/bin/bash
read n
echo $n > file.txt
read p
echo $p >> file.txt
read c
echo $c >> file.txt
sort -uR file.txt | tr "\n" " "
