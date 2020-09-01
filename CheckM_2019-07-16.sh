
####################################### run CheckM #######################################

module load python/2.7.15
module load hmmer/3.2.1
module load pplacer/1.1.alpha19
module load prodigal/2.6.3

cd /srv/scratch/z5039045/checkm_wd
checkm lineage_wf Mariana_Trench_MT1_23 Mariana_Trench_MT1_23_wd -f Mariana_Trench_MT1_23.txt -x fasta -t 1


############################### run CheckM with MyBioTools ###############################

module load python/3.7.3
cd ~
. mypython3env/bin/activate

cd /srv/scratch/z5039045/checkm_wd
MyBioTools CheckM_Runner -in 1_downloaded_genomes -x fna -qsub 

