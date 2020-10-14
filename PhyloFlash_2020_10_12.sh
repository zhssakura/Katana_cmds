
########################### install and prepare database files ###########################

# install phyloFlash
cd /srv/scratch/z5039045/Softwares
git clone https://github.com/HRGV/phyloFlash.git

# Check for dependencies
module load mafft/7.407
module load spades/3.14.0
module load java/8u121
module load bbmap/38.51
module load vsearch/2.13.3
module load bedtools/2.27.1
/srv/scratch/z5039045/Softwares/phyloFlash/phyloFlash.pl -check_env

# Download and set up database
module load bowtie/1.2.0
cd /srv/scratch/z5039045/DB/PhyloFlash
/srv/scratch/z5039045/Softwares/phyloFlash/phyloFlash_makedb.pl --remote

# error:
[09:20:46] running subcommand:
	   /apps/bbmap/38.51/bbmask.sh	 overwrite=t -Xmx10g threads=40
	   in=./138.1//SILVA_SSU.noLSU.fasta
	   out=./138.1//SILVA_SSU.noLSU.masked.fasta minkr=4 maxkr=8 mr=t
	   minlen=20 minke=4 maxke=8 fastawrap=0 
	   2>tmp.bbmask_mask_repeats.log
Error occurred during initialization of VM


##################################### run phyloFlash #####################################



