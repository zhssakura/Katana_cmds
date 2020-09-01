
##################################### upload to PyPI #####################################

alias twine='/Users/songweizhi/Library/Python/3.7/bin/twine'
cd /Users/songweizhi/PycharmProjects/BioSAK
rm -r build
rm -r dist
rm -r BioSAK.egg-info
python setup.py sdist bdist_wheel
twine upload dist/*
songweizhi

shan88

################################## upload to test.PyPI ###################################

cd /Users/songweizhi/PycharmProjects/BioSAK
rm -r build
rm -r dist
rm -r BioSAK.egg-info
python setup.py sdist bdist_wheel
twine upload --repository-url https://test.pypi.org/legacy/ dist/*
songweizhi

shan88

# install/upgrade BioSAK
pip3 install --upgrade -i https://test.pypi.org/simple/ BioSAK
BioSAK -h


##########################################################################################
###################################### install BioSAK ####################################
##########################################################################################

module load python/3.7.3
mkdir ~/mypython3env
python3 -m venv --system-site-packages ~/mypython3env
source ~/mypython3env/bin/activate

pip3 install BioSAK
pip3 install --upgrade BioSAK

##################################### Prodigal_Runner ####################################

module load python/3.7.3
source ~/mypython3env/bin/activate
module load prodigal/2.6.3


########################################### COG ##########################################

module load python/3.7.3
source ~/mypython3env/bin/activate
module load diamond/0.9.24

cd /srv/scratch/z5039045/annotation_with_depth
BioSAK COG2014 -m P -t 4 -db_dir /srv/scratch/z5039045/DB/COG2014 -i FourGenomes_faa -x faa -diamond
BioSAK COG2014 -m P -t 4 -db_dir /srv/scratch/z5039045/DB/COG2014 -i FourGenomes_faa -x faa


########################################## KEGG ##########################################

module load python/3.7.3
source ~/mypython3env/bin/activate
module load diamond/0.9.24

cd /srv/scratch/z5039045/annotation_with_depth
BioSAK KEGG -db_dir /srv/scratch/z5039045/DB/KEGG_2016-09-26 -t 4 -seq_in FourGenomes_faa -x faa -depth FourGenomes_depth
BioSAK KEGG -db_dir /srv/scratch/z5039045/DB/KEGG_2016-09-26 -t 4 -seq_in FourGenomes_faa -x faa -depth FourGenomes_depth -diamond

cd /Users/songweizhi/Desktop/SpongeEMP/SpongeEMP_dRep99/0_file_in
BioSAK KEGG -db_dir /Users/songweizhi/DB/KEGG_2016-09-26 -ko_in SpongeMAGs_dRep99_pcofg_detected_HGTs_recipient_genes_seawater_ko.txt
BioSAK KEGG -db_dir /Users/songweizhi/DB/KEGG_2016-09-26 -ko_in SpongeMAGs_dRep99_pcofg_detected_HGTs_recipient_genes_sponge_ko.txt

BioSAK KEGG -db_dir /srv/scratch/z5039045/DB/KEGG_2016-09-26 -t 6 -seq_in BH_ER_050417_Refined_42.faa -diamond


########################################## dbCAN #########################################

module load python/3.7.3
source ~/mypython3env/bin/activate
module load hmmer/3.3

BioSAK dbCAN -db_dir /srv/scratch/z5039045/DB/dbCAN -i Refined_3.faa 
BioSAK dbCAN -m P -t 6 -db_dir /srv/scratch/z5039045/DB/dbCAN -i SpongeMAGs_dRep95_pcofg_detected_HGTs_recipient_genes_seawater.faa
BioSAK dbCAN -m P -t 6 -db_dir /srv/scratch/z5039045/DB/dbCAN -i SpongeMAGs_dRep95_pcofg_detected_HGTs_recipient_genes_sponge.faa

BioSAK dbCAN -m P -t 6 -db_dir /srv/scratch/z5039045/DB/dbCAN -i BH_ER_050417_Refined_42.faa


####################################### SankeyTaxon ######################################

module load python/3.7.3
source ~/mypython3env/bin/activate
module load R/3.5.3

BioSAK SankeyTaxon -taxon KelpBins_gtdbtk.tsv -r pcofg -p KelpBins


####################################### get_SCG_tree #####################################

module load python/3.7.3
source ~/mypython3env/bin/activate
module load hmmer/3.2.1
module load mafft/7.407
module load fasttree/2.1.10
module load R/3.5.3
module load blast+/2.9.0
module load prodigal/2.6.3

cd /srv/scratch/z5039045/get_SCG_tree
BioSAK get_SCG_tree -i genomes -x fasta -p NorthSea -t 12
BioSAK get_SCG_tree -i Mariana_Trench_refined_bins_50_0.05 -p Rulong -x fasta -t 12


#################################### get_bin_abundance ###################################

module load python/3.7.3
source ~/mypython3env/bin/activate

cd /srv/scratch/z5039045/Liu_RL/Mariana_Trench/06_refined_bins_abundance
MyBioTools get_bin_abundance -d ../05_binning/Mariana_Trench_scaffold_depth_MT1.txt -b ../06_refined_bins/Mariana_Trench_MT1_refined_bins -x fasta -p MT1_refined_bins

for each in *fasta; do BioSAK rename_seq -in $each -prefix MT1; done
for each in *fasta; do BioSAK rename_seq -in $each -prefix MT2; done
for each in *fasta; do BioSAK rename_seq -in $each -prefix MT3; done

cd /srv/scratch/z5039045/get_bin_abundance
BioSAK get_bin_abundance -sam MT1.sam -bin MT123_bins_complete50.0_contain10.0_renamed -x fasta -o aaa.txt &
BioSAK get_bin_abundance -sam MT1.sam -bin MT123_bins_complete50.0_contain10.0_renamed -x fasta -o bbb.txt -Cdb Cdb.csv &

