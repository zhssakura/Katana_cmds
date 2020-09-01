module load mafft/7.407 
cd /srv/scratch/z5039045/mafft_wd


# fast  
mafft --quiet --retree 1 TIGR00422.fasta > TIGR00422_aligned_fast.aln


# slow
mafft --quiet --maxiterate 1000 --globalpair TIGR00422.fasta > TIGR00422_aligned_slow.aln

