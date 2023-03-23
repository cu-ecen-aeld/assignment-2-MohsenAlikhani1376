#!/bin/sh
if [ "$#" -eq 2 ]  # "$#" : counting input argument
then
    FullPath="$1"
    searchstr="$2"
    FileName=$(basename $FullPath) # basename <input string> : this command seperate the part of input string which is just after last / in end of string.
    FileDir="${FullPath%%"/$FileName"*}" # <input string>%%<ignored string>* : this command seperate part of the input string which is just befure ignored string.
    #echo "File name is $FileName and directory is $FileDir"
    if [ -d "$FileDir" ] # -d   : check if input is directory
    then
      cd $FileDir
      echo "$searchstr" >> $FileName
      #echo "Changes Applied Successfully !!!! \n"
    else
        mkdir -p $FileDir
        if [ "$?" -ne 0 ] # -ne : Not Equal  +++++  $? : returned value of last excuted command ( if not 0 , there is a problem)
        then
          echo "$? \n\n"
          echo "!!!\n OH !! There was a problem to creating directory ...\n"
          echo "Please check it again...\n"
          exit 1
          #statements
        else
          #echo "\n!!!\nThere was no such directory. We created it for you :) \n"
          cd $FileDir
          echo "$searchstr" >> $FileName
          #echo "Changes Applied Successfully !!!! \n"
        fi
   	fi
else
    echo "Please insert input argument currectly"
    exit 1
fi
