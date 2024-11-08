#!/bin/bash

mkdir -p data/impc
echo "*" >data/impc/.gitignore
mkdir -p data/impc/results/
rm -rf ftp*

url_impc="http://ftp.ebi.ac.uk/pub/databases/impc/all-data-releases/release-17.0/results/"

wget -O - "$url_impc" >tmp
cat tmp |
    grep "<a href="
cut -d '"' -f 2 |
    while read -r line; do
        echo "$line"
        wget -P data/impc/results/ http""/"$line"
    done

###############################################################################
# Download  IMPC Release: 15.1
###############################################################################

# time wget -c -r -np -l 0 ftp://ftp.ebi.ac.uk/pub/databases/impc/all-data-releases/latest/

# move to "data/impc" manually

###############################################################################
# MD Check Sum
###############################################################################

# (
#     cd data/impc
#     find cores/*.md5 |
#         while read -r file; do
#             md5sum -c "$file" ||
#                 echo "$file is not propary downloaded"
#         done
# )

###############################################################################
# Open TAR files
###############################################################################

# ls -l data/impc/cores/*tar -S

# find data/impc/cores/*tar |
#     while read -r tar; do
#         echo $tar
#         tar -xf "$tar" -C "$(dirname $tar)"
#     done

# END
