module load mafft/7.310
module load fasttree/2.1.7

# run mafft
mafft --quiet --maxiterate 1000 --thread 6 --globalpair combined_16s.fasta > combined_16s.aln 
mafft --quiet --maxiterate 1000 --thread 6 --globalpair combined_16s_uniq.fasta > combined_16s_uniq.aln 

# run fasttree
fasttree -nt -quiet 16s_sequence.aln > 16s_sequence.newick
fasttree -nt -quiet combined_16s_uniq.aln > combined_16s_uniq.newick
