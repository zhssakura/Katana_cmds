# From genomes to pangenomes: understanding variation among individuals and species (2017-03-09)
# http://digital.csic.es/bitstream/10261/146411/1/pangenome_workshop09032017.html

# Releases
# https://github.com/eead-csic-compbio/get_homologues/releases

# install
# refer to the manual


/srv/scratch/z5039045/Softwares/gh/get_homologues-x86_64-20160712/get_homologues.pl -f 70 -t 3 -S 70 -E 1e-05 -C 70 -G -d input_gbk_5
/srv/scratch/z5039045/Softwares/gh/get_homologues-x86_64-20170918/get_homologues.pl -f 70 -t 3 -S 70 -E 1e-05 -C 70 -G -d faa_files

# -f filter by %length difference within clusters			70
# -t report sequence clusters including at least t taxa		3
# -S min %sequence identity in BLAST query/subj pairs		70
# -E max E-value											1e-05
# -C min %coverage in BLAST pairwise alignments				70
# -G use COGtriangle algorithm (COGS, PubMed=20439257)		

