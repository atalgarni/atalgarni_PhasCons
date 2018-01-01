#!/bin/sh

#  Script.sh
#  
#
#  Created by Abdulmalek Algarni on 9/21/17.
#

partitionSequence.pl 10010000 10000 /Users/abdulmalek/Documents/phastcons/Genome/droSim1/droSim1.2bit /Users/abdulmalek/Documents/phastcons/Genome/droSim1/droSim1.chrom.sizes -xdir xdir.sh -rawDir ../psl 100 -lstDir tParts > droSim1.lst

export L1=`wc -l < droSim1.lst`

partitionSequence.pl 10010000 10000 /Users/abdulmalek/Documents/phastcons/Genome/droYak2/droYak2.2bit /Users/abdulmalek/Documents/phastcons/Genome/droYak2/droYak2.chrom.sizes -xdir xdir.sh -rawDir ../psl 100 -lstDir qParts > droYak2.lst

export L2=`wc -l < droYak2.lst`
export L=`echo $L1 $L2 | awk '{print $1*$2}'`
echo "cluster batch jobList size: $L = $L1 * $L2"

if [ -d tParts ]; then
echo 'constructing tParts/.2bit files'
ls tParts/*.lst | sed -e 's#tParts/##; s#.lst##;' | while read tPart
do
sed -e 's#.*.2bit:##;' tParts/$tPart.lst | twoBitToFa -seqList=stdin /Users/abdulmalek/Documents/phastcons/Genome/droSim1/droSim1.2bit stdout | faToTwoBit stdin tParts/$tPart.2bit

done
fi

if [ -d qParts ]; then
echo 'constructing qParts/.2bit files'
ls qParts/*.lst | sed -e 's#qParts/##; s#.lst##;' | while read qPart
do
sed -e 's#.*.2bit:##;' qParts/$qPart.lst | twoBitToFa -seqList=stdin /Users/abdulmalek/Documents/phastcons/Genome/droYak2/droYak2.2bit stdout | faToTwoBit stdin qParts/$qPart.2bit
done
fi
