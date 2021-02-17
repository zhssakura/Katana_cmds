
#################### install GTDB-TK with Python3 virtual environment ####################

module load python/3.7.3
mkdir ~/mypython3env
python3 -m venv --system-site-packages ~/mypython3env
source ~/mypython3env/bin/activate
pip3 install gtdbtk

# for later update
pip3 install --upgrade gtdbtk


# download db files (no need to do this on Katana)
# cd /srv/scratch/z5039045/DB/gtdbtk/release95
# wget https://data.ace.uq.edu.au/public/gtdb/data/releases/release89/89.0/gtdbtk_r95_data.tar.gz
# tar xvzf gtdbtk_r89_data.tar.gz


########################## Taxonomic classification with GTDB-TK #########################

# please request at least 180 Gbp memories for the classify_wf module !!!

module load python/3.7.3
source ~/mypython3env/bin/activate
module load perl/5.28.0
module load prodigal/2.6.3
module load pplacer/1.1.alpha19
module load hmmer/3.3
module load fasttree/2.1.11
module unload gcc
module load gcc/6.2.0
module load gsl/2.6
module load fastani/1.3
module unload R
module load R/3.5.3
export GTDBTK_DATA_PATH=/data/bio/gtdbtk/release95

cd /srv/scratch/z5039045/MetaCHIP_demo
gtdbtk classify_wf --cpus 6 --pplacer_cpus 1 --genome_dir NS_37bins --extension fasta --out_dir NS_37bins_GTDB_r95 --prefix NS_37bins

cd /srv/scratch/z5039045/MarkerMAG_wd/Kelp
gtdbtk classify_wf --cpus 6 --pplacer_cpus 1 --genome_dir BH_ER_050417_refined_bins --extension fasta --out_dir BH_ER_050417_GTDB_r95 --prefix BH_ER_050417

# The taxonomic classification for input genomes are in:
# <prefix>.bac120.summary.tsv
# <prefix>.ar122.summary.tsv


################################# Infer tree with GTDB-TK ################################

module load python/3.7.3
source ~/mypython3env/bin/activate
module load perl/5.28.0
module load prodigal/2.6.3
module load pplacer/1.1.alpha19
module load hmmer/3.3
module load fasttree/2.1.11
module unload gcc
module load gcc/6.2.0
module load gsl/2.6
module load fastani/1.3
module unload R
module load R/3.5.3
export GTDBTK_DATA_PATH=/data/bio/gtdbtk/release95

cd /srv/scratch/z5039045/detectCFP_wd
gtdbtk identify --genome_dir mag_files -x fna --out_dir mag_files_GTDB_r95_tree --cpus 12
gtdbtk align --identify_dir mag_files_GTDB_r95_tree --out_dir mag_files_GTDB_r95_tree --cpus 12

# infer bacterial MAG tree
gtdbtk infer --msa_file mag_files_GTDB_r95_tree/gtdbtk.bac120.user_msa.fasta --out_dir mag_files_GTDB_r95_tree --cpus 12 --prefix bacterial

# infer archaeal MAG tree, if you have archaeal MAGs in mag_files
gtdbtk infer --msa_file mag_files_GTDB_r95_tree/gtdbtk.ar122.user_msa.fasta --out_dir mag_files_GTDB_r95_tree --cpus 12 --prefix archaeal

# the inferred trees
mag_files_GTDB_r95_tree/archaeal.unrooted.tree
mag_files_GTDB_r95_tree/bacterial.unrooted.tree
