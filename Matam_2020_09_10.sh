
module load python/3.6.5
module load java/7u51
module load gcc/8.4.0
module load sparsehash/2.0.3
module load matam/1.5.3
module load samtools/1.9
export PATH=/home/z5039045/anaconda3/bin:$PATH


# index the database:
python3 /home/z5039045/anaconda3/pkgs/matam-v1.5.3-0/bin/index_default_ssu_rrna_db.py -d /srv/scratch/z5039045/DB/Matam/SILVA_128_SSURef_NR95


# Running de-novo assembly
cd /srv/scratch/z5039045/link_16S_MAG/test_matam/16sp_simulated_dataset
python3 /home/z5039045/anaconda3/pkgs/matam-v1.5.3-0/bin/matam_assembly.py -d /srv/scratch/z5039045/DB/Matam/SILVA_128_SSURef_NR95 -i 16sp.art_HS25_pe_100bp_50x.fq --cpu 6 --max_memory 100000 -v -o Test_matam


# 2R2 
cd /srv/scratch/z5039045/link_16S_MAG/Jadi_data/2R2_reads
python3 /home/z5039045/anaconda3/pkgs/matam-v1.5.3-0/bin/matam_assembly.py -h

