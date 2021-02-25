
####################################### run CheckM #######################################

module load python/3.7.3
module load hmmer/3.3
module load pplacer/1.1.alpha19
module load prodigal/2.6.3

cd /srv/scratch/z5039045/chloroflexi_genome
checkm lineage_wf MAG_files MAG_files_checkm_wd -f MAG_files_quality.txt -x fna -t 12


checkm lineage_wf BH_ER_050417_refined_bins BH_ER_050417_checkm_wd -f BH_ER_050417_refined_MAG_qualities.txt -x fasta -t 12
