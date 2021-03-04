
################################# install BLCA on Katana #################################

module load python/3.7.3
mkdir ~/mypython3env
python3 -m venv --system-site-packages ~/mypython3env
source ~/mypython3env/bin/activate
pip3 install --upgrade BioSAK

# Download BLCA scripts to Katana (change zID to yours)
cd /srv/scratch/z5039045/Softwares
git clone https://github.com/qunfengdong/BLCA.git


############################### prepare SILVA SSU database ###############################

# download and decompress SILVA SSU database
cd /srv/scratch/z5039045/Softwares/BLCA/db_SILVA_SSU
wget https://www.arb-silva.de/fileadmin/silva_databases/release_138/Exports/SILVA_138_SSURef_NR99_tax_silva.fasta.gz
gunzip SILVA_138_SSURef_NR99_tax_silva.fasta.gz

# Prepare BLCA-compatible SILVA SSU database with BioSAK
module load python/3.7.3
source ~/mypython3env/bin/activate
BioSAK SILVA_for_BLCA -SILVA_ssu SILVA_138_SSURef_NR99_tax_silva.fasta
# output files:
# SILVA_138_SSURef_NR99_tax_silva_BLCAparsed.fasta
# SILVA_138_SSURef_NR99_tax_silva_BLCAparsed.taxonomy

# format the fasta file
module load blast+/2.9.0
makeblastdb -in SILVA_138_SSURef_NR99_tax_silva_BLCAparsed.fasta -dbtype nucl -parse_seqids -out SILVA_138_SSURef_NR99_tax_silva_BLCAparsed.fasta


############################### prepare GTDB SSU database ################################

mkdir /srv/scratch/z5039045/Softwares/BLCA/db_GTDB_SSU
cd /srv/scratch/z5039045/Softwares/BLCA/db_GTDB_SSU
wget https://data.gtdb.ecogenomic.org/releases/release95/95.0/genomic_files_all/ssu_all_r95.tar.gz
tar xvzf ssu_all_r95.tar.gz
module load python/3.7.3
source ~/mypython3env/bin/activate
BioSAK GTDB_for_BLCA -GTDB_ssu ssu_all_r95.fna

# Prepare BLCA-compatible GTDB SSU database with BioSAK
module load python/3.7.3
source ~/mypython3env/bin/activate
BioSAK GTDB_for_BLCA -GTDB_ssu GTDB_bac120_ar122_ssu_r89.fna 
# output files:
# GTDB_bac120_ar122_ssu_r89_BLCAparsed.taxonomy
# GTDB_bac120_ar122_ssu_r89_BLCAparsed.fasta

# format the fasta file
module load blast+/2.9.0
makeblastdb -in ssu_all_r95_BLCAparsed.fasta -dbtype nucl -parse_seqids -out ssu_all_r95_BLCAparsed.fasta



########################### run BLCA against SILVA SSU database ##########################

module load python/3.7.3
source ~/mypython3env/bin/activate
module load blast+/2.9.0
module load muscle/3.8.31
module load clustalo/1.2.4
cd /srv/scratch/z5039045/Softwares/BLCA/wd_tmp
python3 /srv/scratch/z5039045/Softwares/BLCA/2.blca_main.py -r /srv/scratch/z5039045/Softwares/BLCA/db_SILVA_SSU/SILVA_138_SSURef_NR99_tax_silva_BLCAparsed.taxonomy -q /srv/scratch/z5039045/Softwares/BLCA/db_SILVA_SSU/SILVA_138_SSURef_NR99_tax_silva_BLCAparsed.fasta -i test.fasta


########################### run BLCA against GTDB SSU database ##########################

module load python/3.7.3
source ~/mypython3env_BLCA/bin/activate
module load blast+/2.9.0
module load muscle/3.8.31
module load clustalo/1.2.4

cd /srv/scratch/z5039045/MarkerMAG_wd/Kelp/BH_ER_050417_Matam16S_wd
python3 /srv/scratch/z5039045/Softwares/BLCA/2.blca_main.py -r /srv/scratch/z5039045/Softwares/BLCA/db_GTDB_SSU/ssu_all_r95_BLCAparsed.taxonomy -q /srv/scratch/z5039045/Softwares/BLCA/db_GTDB_SSU/ssu_all_r95_BLCAparsed.fasta -i BH_ER_050417_assembled_16S_uclust_0.999.fasta



cd /srv/scratch/z5039045/Jadi
module load blast+/2.9.0
makeblastdb -in D2_16S_rRNA.fasta -dbtype nucl -parse_seqids -out D2_16S_rRNA.fasta
python3 /srv/scratch/z5039045/Softwares/BLCA/2.blca_main.py -r D2_16S_rRNA.taxonomy -q D2_16S_rRNA.fasta -i AllSamples_unoise_nc.fasta -o AllSamples_unoise_nc_BLCA_out.1.txt
python3 /srv/scratch/z5039045/Softwares/BLCA/2.blca_main.py -r D2_16S_rRNA.taxonomy -q D2_16S_rRNA.fasta -i AllSamples_unoise_nc.fasta
python3 /srv/scratch/z5039045/Softwares/BLCA/2.blca_main.py -r D2_16S_rRNA.taxonomy -q D2_16S_rRNA.fasta -i AllSamples_unoise_nc.fasta


##########################################################################################
################################# BACKUP (please ignore) #################################
##########################################################################################


############# run BLCA against NCBI 16S microbial database (under testing!!!) ############

# NCBI 16S microbial database
# the first step is to build a taxonomy database from the NCBI 16S microbial database
cd BLCA
#python3 /srv/scratch/z5039045/Softwares/BLCA/1.subset_db_acc.py -d ftp://ftp.ncbi.nlm.nih.gov/blast/db/16SMicrobial.tar.gz --taxdmp ftp://ftp.ncbi.nih.gov/pub/taxonomy/taxdmp.zip --taxdb ftp://ftp.ncbi.nlm.nih.gov/blast/db/taxdb.tar.gz
python3 /srv/scratch/z5039045/Softwares/BLCA/1.subset_db_acc.py -d ftp://ftp.ncbi.nlm.nih.gov/blast/db/v4/16SMicrobial_v4.tar.gz --taxdmp ftp://ftp.ncbi.nih.gov/pub/taxonomy/taxdmp.zip --taxdb ftp://ftp.ncbi.nlm.nih.gov/blast/db/taxdb.tar.gz
#python3 /srv/scratch/z5039045/Softwares/BLCA/1.subset_db_acc.py -d https://github.com/songweizhi/BioSAK/blob/master/BioSAK_tutorial/16SMicrobial.tar.gz --taxdmp ftp://ftp.ncbi.nih.gov/pub/taxonomy/taxdmp.zip --taxdb ftp://ftp.ncbi.nlm.nih.gov/blast/db/taxdb.tar.gz
# tar -xzvf taxdb.tar.gz
# cd db
# wget ftp://ftp.ncbi.nlm.nih.gov/blast/db/v4/16SMicrobial_v4.tar.gz
# tar -xzvf 16SMicrobial_v4.tar.gz

module load python/3.7.3
source ~/mypython3env_BLCA/bin/activate
module load blast+/2.9.0
module load muscle/3.8.31
module load clustalo/1.2.4

cd /srv/scratch/z5039045/Softwares/BLCA
python3 /srv/scratch/z5039045/Softwares/BLCA/2.blca_main.py -i test.fasta
python3 /srv/scratch/z5039045/Softwares/BLCA/2.blca_main.py -i test.fasta -r /srv/scratch/z5039045/Softwares/BLCA/db/16SMicrobial.ACC.taxonomy -q /srv/scratch/z5039045/Softwares/BLCA/db/16SMicrobial 


########################## run BLCA against SILVA LSU database ###########################

# SILVA LSU database
# Download database files from https://drive.google.com/drive/folders/1t0TzC08y7_LyglsdihaXu27oWr7PiKLe

# create an db folder on Katana
mkdir /srv/scratch/z5039045/Softwares/BLCA/db_SILVA_LSU

# upload database files to Katana and format the fasta file
cd /srv/scratch/z5039045/Softwares/BLCA/db_SILVA_LSU
module load blast+/2.9.0
makeblastdb -in SILVA_132_LSURef_tax_silva_BLCAparsed.fasta -dbtype nucl -parse_seqids -out SILVA_132_LSURef_tax_silva_BLCAparsed.fasta

# run BLCA
module load python/3.7.3
source ~/mypython3env_BLCA/bin/activate
module load blast+/2.9.0
module load muscle/3.8.31
module load clustalo/1.2.4
cd your_working_directory
python3 /srv/scratch/z5039045/Softwares/BLCA/2.blca_main.py -r /srv/scratch/z5039045/Softwares/BLCA/db_SILVA_LSU/SILVA_132_LSURef_tax_silva_BLCAparsed.taxonomy -q /srv/scratch/z5039045/Softwares/BLCA/db_SILVA_LSU/SILVA_132_LSURef_tax_silva_BLCAparsed.fasta -i test.fasta

