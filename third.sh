#!/bin/bash
echo "Enter the first video file path  with the file name"
read n
echo "Enter the second video file path with the file name"
read p
echo "Enter the outfile path"
read c
dpkg -s mkvtoolnix &> /dev/null  
if [ $? -ne 0 ]
then
    echo "Installing the required packages"
    sudo apt install mkvtoolnix -y
else
     echo "Required packages are installed"
fi
if find $n -type f | grep -iE "\.webm$|\.flv$|\.vob$|\.ogg$|\.ogv$|\.drc$|\.gifv$|\.mng$|\.avi$|\.mov$|\.qt$|\.wmv$|\.yuv$|\.rm$|\.rmvb$|/.asf$|\.amv$|\.mp4$|\.m4v$|\.mp*$|\.m?v$|\.svi$|\.3gp$|\.flv$|\.f4v$" &> /dev/null && find $p -type f | grep -iE "\.webm$|\.flv$|\.vob$|\.ogg$|\.ogv$|\.drc$|\.gifv$|\.mng$|\.avi$|\.mov$|\.qt$|\.wmv$|\.yuv$|\.rm$|\.rmvb$|/.asf$|\.amv$|\.m$|\.mp4$|\.m4v$|\.mp*$|\.m?v$|\.svi$|\.3gp$|\.flv$|\.f4v$" &> /dev/null ;
then
  echo "Videos are Verfied"
  mkvmerge -o $c/outfile.mkv $n \+ $p &> /dev/null
  echo "Video merge is completed"
else
  echo "One of the video path is not correct please check!!"
  echo "Example : /opt/Nextcloud.mp4 Path: /opt filename: Nextcloud.mp4"
fi 

