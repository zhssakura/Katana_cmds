
##################################### upload to PyPI #####################################

# upload MetaCHIP to PyPI
alias twine='/Users/songweizhi/Library/Python/3.7/bin/twine'
cd /Users/songweizhi/PycharmProjects/MetaCHIP
rm -r build
rm -r dist
rm -r MetaCHIP.egg-info
python setup.py sdist bdist_wheel
twine upload dist/*
songweizhi

shan88

# install/upgrade MetaCHIP
pip install --upgrade MetaCHIP


################################## upload to PyPI (Test) #################################

# upload MetaCHIP to TestPyPI
cd /Users/songweizhi/PycharmProjects/MetaCHIP
rm -r build
rm -r dist
rm -r MetaCHIP.egg-info
python setup.py sdist bdist_wheel
twine upload --repository-url https://test.pypi.org/legacy/ dist/*
songweizhi

shan88

# install/upgrade MetaCHIP
pip install --upgrade -i https://test.pypi.org/simple/ MetaCHIP


#################################### install MetaCHIP ####################################

module load python/3.7.3
mkdir ~/mypython3env
python3 -m venv --system-site-packages ~/mypython3env
. mypython3env/bin/activate
pip install --upgrade MetaCHIP


# on Mac
export PATH=/Users/songweizhi/Softwares/Prodigal:$PATH
export PATH=/Users/songweizhi/Softwares/FastTree/bin:$PATH
export PATH=/Users/songweizhi/Softwares/ncbi-blast-2.10.1+/bin:$PATH
export PATH=/Users/songweizhi/Softwares/hmmer/hmmer-3.1b2-macosx-intel/binaries:$PATH


###################################### run MetaCHIP ######################################

#!/bin/bash
#PBS -l nodes=1:ppn=12
#PBS -l mem=60gb
#PBS -l walltime=11:59:00
#PBS -j oe
#PBS -M weizhi.song@student.unsw.edu.au
#PBS -m ae

module unload python
module load python/3.7.3
source ~/mypython3env/bin/activate
module load hmmer/3.2.1
module load mafft/7.407
module load fasttree/2.1.10
module load R/3.5.3
module load blast+/2.9.0
module load prodigal/2.6.3

cd /srv/scratch/z5039045/MetaCHIP_demo
MetaCHIP PI -i NS_37bins -taxon NorthSea_GTDB.tsv -p NorthSea -r pcofg -x fasta -t 12
MetaCHIP BP -p NorthSea -r pcofg -t 12


cd /srv/scratch/z5039045/MetaCHIP_demo
MetaCHIP PI -i NS_30bins -taxon NorthSea_GTDB.tsv -p NorthSea -r pcofg -x fasta -t 12
MetaCHIP BP -p NorthSea -r pcofg -t 12



cd /srv/scratch/z5039045/MetaCHIP_demo
MetaCHIP PI -i NS_37bins -taxon NorthSea_GTDB.tsv -p NorthSea -r p -x fasta -t 12 -grouping_only -tmp
MetaCHIP PI -i NS_37bins -taxon NorthSea_GTDB.tsv -p NorthSea -r c -x fasta -t 12 -grouping_only -tmp
MetaCHIP PI -i NS_37bins -taxon NorthSea_GTDB.tsv -p NorthSea -r o -x fasta -t 12 -grouping_only -tmp
MetaCHIP PI -i NS_37bins -taxon NorthSea_GTDB.tsv -p NorthSea -r f -x fasta -t 12 -grouping_only -tmp
MetaCHIP PI -i NS_37bins -taxon NorthSea_GTDB.tsv -p NorthSea -r g -x fasta -t 12 -grouping_only -tmp
MetaCHIP BP -p NorthSea -r p -t 12 -tmp
MetaCHIP BP -p NorthSea -r c -t 12 -tmp
MetaCHIP BP -p NorthSea -r o -t 12 -tmp
MetaCHIP BP -p NorthSea -r f -t 12 -tmp
MetaCHIP BP -p NorthSea -r g -t 12 -tmp
MetaCHIP CMLP -p NorthSea -r pcofg


# run MetaCHIP with customized grouping file
cd /srv/scratch/z5039045/MetaCHIP_demo
MetaCHIP PI -p CG -g customized_grouping.txt -t 6 -i NS_37bins -x fasta -blastn_js_header blastn_js_header.sh -qsub
MetaCHIP BP -p CG -g customized_grouping.txt -t 6


cd /srv/scratch/z5095298/Weizhi_Song
rm -r NorthSea_MetaCHIP_wd
MetaCHIP PI -i NS_37bins -taxon NorthSea_GTDB.tsv -p NorthSea -r pcofg -x fasta -t 6 -blastn_js_header blastn_js_header.sh -qsub 


cd /srv/scratch/z5039045/MetaCHIP_Cho
MetaCHIP PI -i bins -taxon group.txt -p Cho -r c -x fna -t 6 -blastn_js_header blastn_js_header.sh 


cd /srv/scratch/z5039045/MetaCHIP_demo


cd /Users/songweizhi/Desktop/MetaCHIP_demo
export PATH=/Users/songweizhi/Softwares/FastTree/bin
MetaCHIP PI -i NS_37bins -taxon NorthSea_GTDB.tsv -p NorthSea -r p -x fasta -t 4


module unload python
module load python/3.7.3
source ~/mypython3env/bin/activate
module load hmmer/3.2.1
module load mafft/7.407
module load fasttree/2.1.10
module load R/3.5.3
module load blast+/2.9.0
module load prodigal/2.6.3

cd /srv/scratch/z5039045/XiyangDong
MetaCHIP PI -i 43bins -taxon 43bin_gtdbtk.ar.bac.summary.tsv -p Dong43bins -r pcofg -x fasta -qsub -t 12 -blastn_js_header blastn_js_header.sh
MetaCHIP BP -p Dong43bins -r pcof -t 12
MetaCHIP PI -i 43bins -taxon 43bin_gtdbtk.ar.bac.summary.tsv -p Dong-43bins -r pcofg -x fasta -qsub -t 12 -blastn_js_header blastn_js_header.sh
MetaCHIP BP -p Dong-43bins -r pcof -t 12
MetaCHIP PI -i 300_fixed_bins_renamed -taxon 300bin_gtdbtk_ar_bac_summary.tsv -p Dong300bins -r pcofg -x fasta -t 12 -blastn_js_header blastn_js_header.sh
MetaCHIP BP -p Dong300bins -r pcofg -t 12 -tmp


cd /srv/scratch/z5039045/MetaCHIP_demo/MetaCHIP_Zhihua
MetaCHIP PI -p Doubanjiang -r c -t 6 -i dereplicated_genomes -x fa -taxon GTDB_TK.csv
MetaCHIP BP -p Doubanjiang -r c -t 6
cd /srv/scratch/z5039045/MetaCHIP_demo/MetaCHIP_Zhihua
MetaCHIP PI -p Doubanjiang -r pg -t 12 -i dereplicated_genomes -x fa -taxon GTDB_TK.csv
MetaCHIP BP -p Doubanjiang -r pg -t 12


#################################### rewrite MetaCHIP ####################################

export PATH=/Users/songweizhi/Softwares/Prodigal:$PATH
export PATH=/Users/songweizhi/Softwares/FastTree/bin:$PATH
export PATH=/Users/songweizhi/Softwares/ncbi-blast-2.10.1+/bin:$PATH
export PATH=/Users/songweizhi/Softwares/hmmer/hmmer-3.1b2-macosx-intel/binaries:$PATH

# dpcofgs
cd /Users/songweizhi/Desktop/MetaCHIP_test
python ~/PycharmProjects/MetaCHIP/MetaCHIP/PI.py -p NorthSea -r dpcofgs -t 4 -i NS_37bins -taxon NorthSea_GTDB.tsv  -x fasta  -force
python ~/PycharmProjects/MetaCHIP/MetaCHIP/BP.py -p NorthSea -r dpcofgs -t 4 -force

# dpcs
cd /Users/songweizhi/Desktop/MetaCHIP_test
python ~/PycharmProjects/MetaCHIP/MetaCHIP/PI.py -i NS_37bins -taxon NorthSea_GTDB.tsv -p NorthSea -r dpcs -x fasta -t 4 -force
python ~/PycharmProjects/MetaCHIP/MetaCHIP/BP.py -p NorthSea -r dpcs -t 4 -force

# MAG_grouping.txt
cd /Users/songweizhi/Desktop/MetaCHIP_test
python ~/PycharmProjects/MetaCHIP/MetaCHIP/PI.py -i NS_37bins -g MAG_grouping.txt -p NorthSea_with_grouping -x fasta -t 4 -force
python ~/PycharmProjects/MetaCHIP/MetaCHIP/BP.py -p NorthSea_with_grouping -g MAG_grouping.txt -t 4 -force

python ~/PycharmProjects/MetaCHIP/MetaCHIP/BP.py -p NorthSea_with_grouping -g NorthSea_grouping_phylum.txt -t 4 -force
python ~/PycharmProjects/MetaCHIP/MetaCHIP/BP.py -p NorthSea_with_grouping -g NorthSea_grouping_species.txt -t 4 -force
python ~/PycharmProjects/MetaCHIP/MetaCHIP/BP.py -p NorthSea_with_grouping -g NorthSea_grouping_phylum_test.txt -t 4 -force


# on Katana
module load python/3.7.3
source ~/mypython3env_MetaCHIP/bin/activate
pip install --upgrade -i https://test.pypi.org/simple/ MetaCHIP


module load python/3.7.3
source ~/mypython3env_MetaCHIP/bin/activate

module load hmmer/3.2.1
module load mafft/7.407
module load fasttree/2.1.10
module load R/3.5.3
module load blast+/2.9.0
module load prodigal/2.6.3

cd /srv/scratch/z5039045/MetaCHIP_demo
MetaCHIP PI -i NS_37bins -taxon NorthSea_GTDB.tsv -p NorthSea37bins -r dpcofgs -x fasta -t 12 -force
MetaCHIP BP -p NorthSea37bins -r dpcofgs -t 12


cd /srv/scratch/z5039045/MetaCHIP_demo
MetaCHIP PI -i NS_37bins -taxon NorthSea_GTDB.tsv -p NorthSea37bins -r d -x fasta -t 12 -force
MetaCHIP BP -p NorthSea37bins -r d -t 12

cd /srv/scratch/z5039045/MetaCHIP_demo
MetaCHIP PI -i NS_37bins -taxon NorthSea_GTDB.tsv -p NorthSea37bins -r p -x fasta -t 12 -force
MetaCHIP BP -p NorthSea37bins -r p -t 12

cd /srv/scratch/z5039045/MetaCHIP_demo
MetaCHIP PI -i NS_37bins -taxon NorthSea_GTDB.tsv -p NorthSea37bins -r s -x fasta -t 12 -force
MetaCHIP BP -p NorthSea37bins -r s -t 12

cd /srv/scratch/z5039045/MetaCHIP_demo
MetaCHIP PI -i NS_37bins -taxon NorthSea_GTDB.tsv -p NorthSea37bins -r ds -x fasta -t 12 -force
MetaCHIP BP -p NorthSea37bins -r ds -t 12

cd /srv/scratch/z5039045/MetaCHIP_demo
MetaCHIP PI -i NS_37bins -taxon NorthSea_GTDB.tsv -p NorthSea37bins -r ds -x fasta -t 12 -force
MetaCHIP BP -p NorthSea37bins -r ds -t 12

MetaCHIP PI -i NS_37bins -g NorthSea_grouping_phylum.txt -p NorthSea_with_grouping -x fasta -t 12 -force
MetaCHIP BP -p NorthSea_with_grouping -g NorthSea_grouping_phylum.txt -t 4 -force

MetaCHIP PI -i NS_37bins -g NorthSea37bins_grouping_s22.txt -p NorthSea_with_grouping -x fasta -t 12 -force
MetaCHIP BP -p NorthSea_with_grouping -g NorthSea_grouping_phylum.txt -t 4 -force

