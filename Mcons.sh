#!/bin/sh

#  Script.sh
#  
#
#  Created by Abdulmalek Algarni on 10/07/17.
#

cd Documents/phastcons/multiway/

wget http://hgdownload.soe.ucsc.edu/goldenPath/dm3/multiz15way/chr2L.maf.gz
wget http://hgdownload.soe.ucsc.edu/goldenPath/dm3/multiz15way/chr2LHet.maf.gz
wget http://hgdownload.soe.ucsc.edu/goldenPath/dm3/multiz15way/chr2R.maf.gz
wget http://hgdownload.soe.ucsc.edu/goldenPath/dm3/multiz15way/chr2RHet.maf.gz
wget http://hgdownload.soe.ucsc.edu/goldenPath/dm3/multiz15way/chr3L.maf.gz
wget http://hgdownload.soe.ucsc.edu/goldenPath/dm3/multiz15way/chr3LHet.maf.gz
wget http://hgdownload.soe.ucsc.edu/goldenPath/dm3/multiz15way/chr3R.maf.gz
wget http://hgdownload.soe.ucsc.edu/goldenPath/dm3/multiz15way/chr3RHet.maf.gz
wget http://hgdownload.soe.ucsc.edu/goldenPath/dm3/multiz15way/chr4.maf.gz
wget http://hgdownload.soe.ucsc.edu/goldenPath/dm3/multiz15way/chrM.maf.gz
wget http://hgdownload.soe.ucsc.edu/goldenPath/dm3/multiz15way/chrU.maf.gz
wget http://hgdownload.soe.ucsc.edu/goldenPath/dm3/multiz15way/chrUextra.maf.gz
wget http://hgdownload.soe.ucsc.edu/goldenPath/dm3/multiz15way/chrX.maf.gz
wget http://hgdownload.soe.ucsc.edu/goldenPath/dm3/multiz15way/chrXHet.maf.gz
wget http://hgdownload.soe.ucsc.edu/goldenPath/dm3/multiz15way/chrYHet.maf.gz




for i in *.*.gz;do 
    gunzip -c ${i} > $i.maf 
done

fi

for i in *.maf;do 
    maf_parse -O droSim1,dm3,droSec1,droYak2,droEre2,droAna3,dp4,droPer1,droWil1,droVir3,droMoj3,droGri2,anoGam1,apiMel3,triCas2 "$i" > `basename $i`.new.maf
done

fi
