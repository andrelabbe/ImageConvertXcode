#!/bin/zsh
# It only to show you can convert images to fit xCode without need for 3rd party.
# Of course you can add loops and  create all relevant folder/files to import directly into Xcode.
# The code is quite basic and open. The point of it is to remember it later how it works 
# rather than cramming all in one line 'to may' be look good but guessing how it works
#
#clear
readonly original=${1:?"Image name should be specified."}
#get filename and extension
filename=$original:t:r
ext=$original:t:e
#create new names since I do not touch original
x1=$filename@x1.$ext
x2=$filename@x2.$ext
x3=$filename@x3.$ext
#create 3 new files (copy of the original)
cp $original $x1
cp $original $x2
cp $original $x3
#I change the dpi to 72 but if you do not want it add comment
sips $x1 -s dpiHeight 72 -s dpiWidth 72
sips $x2 -s dpiHeight 72 -s dpiWidth 72
sips $x3 -s dpiHeight 72 -s dpiWidth 72
#get the original size
xHeight=${$(sips $x1 --getProperty pixelHeight)[3]}
xWidth=${$(sips $x1 --getProperty pixelWidth)[3]}
#get the @1 size and convert the @1 file
newHeight=$(($xHeight/3))
newWidth=$(($xWidth/3))
sips -z $newHeight  $newWidth $x1
#get the @2 size and convert the @2 file
newHeight=$(($newHeight*2))
newWidth=$(($newWidth*2))
sips -z $newHeight  $newWidth $x2
#get the @3 size and convert the €3 file
newHeight=$(($newHeight*1.5))
newWidth=$(($newWidth*1.5))
sips -z $newHeight  $newWidth $x3
#done!
