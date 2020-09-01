
################################ install BLCA on your Mac ################################

# this will Download BLCA scripts in your home directory
cd ~
git clone https://github.com/qunfengdong/BLCA.git

# install BioSAK for db formatting 
pip3 install --upgrade BioSAK


############################### prepare SILVA SSU database ###############################

# download and decompress SILVA SSU database
mkdir ~/BLCA/db_SILVA_SSU
cd ~/BLCA/db_SILVA_SSU
wget https://www.arb-silva.de/fileadmin/silva_databases/release_138/Exports/SILVA_138_SSURef_NR99_tax_silva.fasta.gz
gunzip SILVA_138_SSURef_NR99_tax_silva.fasta.gz

# Prepare BLCA-compatible SILVA SSU database with BioSAK
BioSAK SILVA_for_BLCA -SILVA_ssu SILVA_138_SSURef_NR99_tax_silva.fasta

# format the fasta file
makeblastdb -in SILVA_138_SSURef_NR99_tax_silva_BLCAparsed.fasta -dbtype nucl -parse_seqids -out SILVA_138_SSURef_NR99_tax_silva_BLCAparsed.fasta


############################### prepare GTDB SSU database ################################

mkdir ~/BLCA/db_GTDB_SSU
cd ~/BLCA/db_GTDB_SSU
wget https://data.ace.uq.edu.au/public/gtdb/data/releases/release89/89.0/ar122_ssu_r89.fna
wget https://data.ace.uq.edu.au/public/gtdb/data/releases/release89/89.0/bac120_ssu_r89.fna
cat bac120_ssu_r89.fna ar122_ssu_r89.fna > GTDB_bac120_ar122_ssu_r89.fna

# Prepare BLCA-compatible GTDB SSU database with BioSAK
BioSAK GTDB_for_BLCA -GTDB_ssu GTDB_bac120_ar122_ssu_r89.fna 

# format the fasta file
makeblastdb -in GTDB_bac120_ar122_ssu_r89_BLCAparsed.fasta -dbtype nucl -parse_seqids -out GTDB_bac120_ar122_ssu_r89_BLCAparsed.fasta


####################### run BLCA against SILVA and GTDB SSU database #####################

# SILVA
# python3 ~/BLCA/2.blca_main.py -r ~/BLCA/db_SILVA_SSU/SILVA_138_SSURef_NR99_tax_silva_BLCAparsed.taxonomy -q ~/BLCA/db_SILVA_SSU/SILVA_138_SSURef_NR99_tax_silva_BLCAparsed.fasta -i test.fasta

# GTDB
# python3 ~/BLCA/2.blca_main.py -r ~/BLCA/db_GTDB_SSU/GTDB_bac120_ar122_ssu_r89_BLCAparsed.taxonomy -q ~/BLCA/db_GTDB_SSU/GTDB_bac120_ar122_ssu_r89_BLCAparsed.fasta -i test.fasta

