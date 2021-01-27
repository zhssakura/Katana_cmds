
# merge fasta
cd /srv/scratch/z5039045/MarkerMAG_wd/1_GemSIM_even_depth
/srv/scratch/z5039045/Softwares/seqtk/seqtk mergepe R1.fasta R2.fasta > combined.fasta

# split fastq
/srv/scratch/z5039045/Softwares/seqtk/seqtk seq -1 S0.fq > S0_R1.fq
/srv/scratch/z5039045/Softwares/seqtk/seqtk seq -2 S0.fq > S0_R2.fq
