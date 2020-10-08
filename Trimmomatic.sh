#!/bin/bash
#PBS -l nodes=1:ppn=1
#PBS -l mem=10gb
#PBS -l walltime=02:59:00
#PBS -j oe
#PBS -M wythe1987@163.com
#PBS -m ae

module load java/8u121
module load fastqc/0.11.8
cd /srv/scratch/z5039045/Flow_cell_biofilm/raw_reads/run_2
java -jar /apps/trimmomatic/0.38/trimmomatic-0.38.jar PE 1D18_S12_R1_001.fastq 1D18_S12_R2_001.fastq 1D18_S12_R1_001_Q30_P.fastq 1D18_S12_R1_001_Q30_UP.fastq 1D18_S12_R2_001_Q30_P.fastq 1D18_S12_R2_001_Q30_UP.fastq ILLUMINACLIP:/apps/trimmomatic/0.38/adapters/TruSeq3-PE-2.fa:2:30:10 LEADING:30 TRAILING:30 CROP:240 HEADCROP:10 SLIDINGWINDOW:6:30 MINLEN:36
fastqc 1D18_S12_R1_001_Q30_P.fastq 1D18_S12_R2_001_Q30_P.fastq
