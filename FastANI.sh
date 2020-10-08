
# https://github.com/ParBLiSS/FastANI

# One to One. Compute ANI between single query and single reference genome:
fastANI -q [QUERY_GENOME] -r [REFERENCE_GENOME] -o [OUTPUT_FILE] 

# One to Many. Compute ANI between single query genome and multiple reference genomes:
fastANI -q [QUERY_GENOME] --rl [REFERENCE_LIST] -o [OUTPUT_FILE]
For above use case, REFERENCE_LIST should be a file containing directory paths to reference genomes, one per line.

# Many to Many. When there are multiple query genomes and multiple reference genomes:
fastANI --ql KelpBins_list.txt --rl KelpBins_list.txt -o KelpBins_ANI.txt -t 12


################################### run with Job Script ##################################

#!/bin/bash

#PBS -l nodes=1:ppn=6
#PBS -l mem=60gb
#PBS -l walltime=11:59:00
#PBS -j oe
#PBS -M weizhi.song@unsw.edu.au
#PBS -m ae

module load fastani/1.1
cd /srv/scratch/z5039045/fastani_test
fastANI -q NorthSea_bin029.fasta -r NorthSea_bin034.fasta -o ANI_value.txt --minFrag 1 -t 6

