
####################################### run CheckM #######################################

module load python/3.7.3
source ~/mypython3env/bin/activate
pip install comparem

############################### run CheckM with MyBioTools ###############################

module load python/3.7.3
source ~/mypython3env/bin/activate

cd /srv/scratch/z5039045
comparem aa_usage faa_files faa_file_aa_usage.txt
