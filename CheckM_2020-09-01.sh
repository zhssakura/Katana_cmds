
####################################### run CheckM #######################################

module load python/3.7.3
module load hmmer/3.3
module load pplacer/1.1.alpha19
module load prodigal/2.6.3

cd /srv/scratch/z5039045/chloroflexi_genome
checkm lineage_wf MAG_files MAG_files_checkm_wd -f MAG_files_quality.txt -x fna -t 12


