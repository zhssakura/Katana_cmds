# https://github.com/ParBLiSS/FastANI

module load gsl/2.6
module load gcc/8.4.0
module load boost/1.73.0-gcc8
module load fastani/1.3


# One to One. Compute ANI between single query and single reference genome:
fastANI -q [QUERY_GENOME] -r [REFERENCE_GENOME] -o [OUTPUT_FILE] 

# One to Many. Compute ANI between single query genome and multiple reference genomes:
fastANI -q [QUERY_GENOME] --rl [REFERENCE_LIST] -o [OUTPUT_FILE]
For above use case, REFERENCE_LIST should be a file containing directory paths to reference genomes, one per line.

# Many to Many. When there are multiple query genomes and multiple reference genomes:
fastANI --ql KelpBins_list.txt --rl KelpBins_list.txt -o KelpBins_ANI.txt -t 12


cd /srv/scratch/z5039045/Softwares
git clone git://git.sv.gnu.org/autoconf
export PATH=/srv/scratch/z5039045/Softwares/autoconf/bin:$PATH


cd /srv/scratch/z5039045/GapSeq_Sponge_and_Coral_MAGs/Test_GapSeq
fastANI -q Plut_88856.fna -r Plut_88857.fna -o Plut.txt 
/srv/scratch/z5039045/Softwares/fastANI/fastANI -q Plut_88856.fna -r Plut_88857.fna -o Plut.txt 

################################### run with Job Script ##################################

#!/bin/bash

#PBS -l nodes=1:ppn=12
#PBS -l vmem=90gb
#PBS -l walltime=11:59:00
#PBS -j oe
#PBS -M weizhi.song@unsw.edu.au
#PBS -m ae

module load autoconf/2.69
module load gcc/6.2.0
module load gsl/2.5
module load boost/1.66-gcc6
module load fastani/1.1
cd /srv/scratch/z5039045/MetaCHIP_TT_90MGs/GoodBins_0.5_0.05_ANI_wd
fastANI --ql genome_list.txt --rl genome_list.txt -o GoodBins_0.5_0.05_ANI.txt -t 12
