
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


cd /srv/scratch/z5039045/test_matam
/srv/scratch/z5039045/Softwares/seqtk/seqtk mergepe CB_ER_141216_R1.fasta CB_ER_141216_R2.fasta > CB_ER_141216_R12.fasta
python3 /home/z5039045/anaconda3/pkgs/matam-v1.5.3-0/bin/matam_assembly.py -d /srv/scratch/z5039045/DB/Matam/SILVA_128_SSURef_NR95 -i CB_ER_141216_R12.fasta --cpu 6 --max_memory 100000 -v -o Test_matam


cd /srv/scratch/z5039045/test_matam
/srv/scratch/z5039045/Softwares/seqtk/seqtk mergepe MBARC26_R1_0.05.fasta MBARC26_R2_0.05.fasta > MBARC26_R12_0.05.fasta
python3 /home/z5039045/anaconda3/pkgs/matam-v1.5.3-0/bin/matam_assembly.py -d /srv/scratch/z5039045/DB/Matam/SILVA_128_SSURef_NR95 -i MBARC26_R12_0.05.fasta --cpu 12 --max_memory 100000 -v -o MBARC26_default


matam_assembly.py -i MBARC26_R12_0.05.fasta -o MBARC26_default --cpu 12 --max_memory 100000 -v -d /srv/scratch/z5039045/DB/Matam/SILVA_128_SSURef_NR95
matam_assembly.py -i MBARC26_R12_0.05.fasta -o MBARC26_filter_only --cpu 12 --max_memory 100000 -v --filter_only -d /srv/scratch/z5039045/DB/Matam/SILVA_128_SSURef_NR95
