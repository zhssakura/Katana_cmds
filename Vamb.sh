
###################################### install Vamb ######################################

module load python/3.7.3
source ~/mypython3env/bin/activate
pip install https://github.com/RasmussenLab/vamb/archive/3.0.2.zip
vamb -h


######################################## run Vamb ########################################

# example commands
vamb --outdir out --fasta my_contigs.fna --bamfiles *.bam



vamb --outdir Vamb_MAGs --fasta my_contigs.fna --bamfiles *.bam


