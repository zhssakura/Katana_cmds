
########################################## Test ##########################################

# introduced one HGT
ATM (40001-44000) --> BGC (24000), length of HGT:4000bp 

# simulate reads
module load python/3.7.3
source ~/mypython3env/bin/activate
cd /srv/scratch/z5039045/Daisy_test/MapHGT
mkdir 1_simulated_reads
cd 1_simulated_reads
python /srv/scratch/z5039045/Softwares/Reads_simulator.py -R ../0_variant_BGC/ATM.fna -n 50000 -l 250 -i 300 -split
python /srv/scratch/z5039045/Softwares/Reads_simulator.py -R ../0_variant_BGC/BGC.fna -n 50000 -l 250 -i 300 -split

# combine reads from the two genomes
cat ATM_R1.fasta BGC_R1.fasta > R1.fasta
cat ATM_R2.fasta BGC_R2.fasta > R2.fasta

# index reference genomes
module load bowtie/2.3.5.1
cd /srv/scratch/z5039045/Daisy_test/MapHGT/0_References
cat ATM.fna BGC.fna > combined_refs.fna
bowtie2-build -f combined_refs.fna combined_refs

# mapping with bowtie
cd /srv/scratch/z5039045/Daisy_test/MapHGT/2_mapping
bowtie2 -x ../0_References/combined_refs -1 ../1_simulated_reads/R1.fasta -2 ../1_simulated_reads/R2.fasta -S OneHGT.sam -p 6 -f

# convert sam files to bam files with samtools
module load samtools/1.10
samtools view -bS OneHGT.sam -o OneHGT.bam

# sort bam files with samtools
samtools sort OneHGT.bam -o OneHGT_sorted.bam

# index sorted bam files with samtools
samtools index OneHGT_sorted.bam


######################################### Biofilm ########################################

module load bowtie/2.3.5.1
cd /srv/scratch/z5039045/Flow_cell_biofilm
bowtie2-build -f combined_refs.fasta combined_refs


module load bowtie/2.3.5.1
cd /srv/scratch/z5039045/Flow_cell_biofilm/3_mapping_mapHGT
bowtie2 -x ../0_References_for_mapHGT/combined_refs -1 ../2_combined_reads/12D9_R1_Q30_P_renamed.fasta -2 ../2_combined_reads/12D9_R2_Q30_P_renamed.fasta -S 12D9.sam -p 6 -f

bowtie2 -x ../0_References_for_mapHGT/combined_refs -1 ../2_combined_reads/12D9_R1_Q30_P_renamed.fasta -2 ../2_combined_reads/12D9_R2_Q30_P_renamed.fasta -S 12D9.sam -p 3 -f &
bowtie2 -x ../0_References_for_mapHGT/combined_refs -1 ../2_combined_reads/12D18_R1_Q30_P_renamed.fasta -2 ../2_combined_reads/12D18_R2_Q30_P_renamed.fasta -S 12D18.sam -p 3 -f &
bowtie2 -x ../0_References_for_mapHGT/combined_refs -1 ../2_combined_reads/12D27_R1_Q30_P_renamed.fasta -2 ../2_combined_reads/12D27_R2_Q30_P_renamed.fasta -S 12D27.sam -p 3 -f &
bowtie2 -x ../0_References_for_mapHGT/combined_refs -1 ../2_combined_reads/12D42_R1_Q30_P_renamed.fasta -2 ../2_combined_reads/12D42_R2_Q30_P_renamed.fasta -S 12D42.sam -p 3 -f &


cd /srv/scratch/z5039045/Flow_cell_biofilm/3_mapping_mapHGT
python3 tmp_8_biofilm.py -r ../0_References_for_mapHGT/combined_refs.fasta -s 12D9.sam -o 12D9.png &
python3 tmp_8_biofilm.py -r ../0_References_for_mapHGT/combined_refs.fasta -s 12D18.sam -o 12D18.png &
python3 tmp_8_biofilm.py -r ../0_References_for_mapHGT/combined_refs.fasta -s 12D27.sam -o 12D27.png &
python3 tmp_8_biofilm.py -r ../0_References_for_mapHGT/combined_refs.fasta -s 12D42.sam -o 12D42.png &


##########################################################################################


module load python/3.7.3
source ~/mypython3env/bin/activate
cd /srv/scratch/z5039045/Daisy_test/MapHGT
mkdir 1_simulated_reads
cd 1_simulated_reads
python /srv/scratch/z5039045/Softwares/Reads_simulator.py -R ../0_variant_BGC/ATM.fna -n 50000 -l 250 -i 300 -split
python /srv/scratch/z5039045/Softwares/Reads_simulator.py -R ../0_variant_BGC/BGC.fna -n 50000 -l 250 -i 300 -split

# combine reads from the two genomes
cat ATM_R1.fasta BGC_R1.fasta > R1.fasta
cat ATM_R2.fasta BGC_R2.fasta > R2.fasta

# index reference genomes
module load bowtie/2.3.5.1
cd /srv/scratch/z5039045/Daisy_test/MapHGT/0_References
cat ATM.fna BGC.fna > combined_refs.fna
bowtie2-build -f combined_refs.fna combined_refs

# mapping with bowtie
cd /srv/scratch/z5039045/Daisy_test/MapHGT
mkdir 2_mapping
cd 2_mapping
bowtie2 -x ../0_References/combined_refs -1 ../1_simulated_reads/R1.fasta -2 ../1_simulated_reads/R2.fasta -S TwoHGTs.sam -p 6 -f

# convert sam files to bam files with samtools
module load samtools/1.10
samtools view -bS TwoHGTs.sam -o TwoHGTs.bam

# sort bam files with samtools
samtools sort TwoHGTs.bam -o TwoHGTs_sorted.bam

# index sorted bam files with samtools
samtools index TwoHGTs_sorted.bam













module load samtools/0.1.19
module load bedtools/2.27.1
module load gcc/7.3.0
module load boost/1.68.0-gcc7
module load bwa/0.7.17
module load cmake/3.14.5
module load seqan/2.4.0
module load ctk/2.4
export PATH=/srv/scratch/z5039045/Softwares/Daisy/:$PATH
cd /srv/scratch/z5039045/Daisy_test/one_transfer


# Var10_WT0, works!!!
mkdir /srv/scratch/z5039045/Daisy_test/one_transfer/2_reads_simulation/Var10_WT0
cd /srv/scratch/z5039045/Daisy_test/one_transfer/2_reads_simulation/Var10_WT0
python /srv/scratch/z5039045/Softwares/Reads_simulator.py -R ../../1_ATM_24000bp_25600bp_to_BGC_48000bp/ATM.fna -n 100000 -l 150 -i 200 -split
python /srv/scratch/z5039045/Softwares/Reads_simulator.py -R ../../1_ATM_24000bp_25600bp_to_BGC_48000bp/BGC.fna -n 100000 -l 150 -i 200 -split
cat ATM_R1.fasta BGC_R1.fasta > combined_R1.fasta
cat ATM_R2.fasta BGC_R2.fasta > combined_R2.fasta
daisy.py -r1 combined_R1.fasta -r2 combined_R2.fasta -ar ../../0_References/BGC.fna -dr ../../0_References/ATM.fna -a "BGC" -d "ATM"


# Var9_WT1, works!!!
mkdir /srv/scratch/z5039045/Daisy_test/one_transfer/2_reads_simulation/Var9_WT1
cd /srv/scratch/z5039045/Daisy_test/one_transfer/2_reads_simulation/Var9_WT1
python /srv/scratch/z5039045/Softwares/Reads_simulator.py -R ../../1_ATM_24000bp_25600bp_to_BGC_48000bp/ATM.fna -n 90000 -l 150 -i 200 -split




####################################### Daisy manual #####################################

# for single donor candidate
-dr -d "seq_id"
# for multiple donor candidates
-dr -d2 file_with_seq_ids

# output interpretation
https://github.com/ktrappe/daisy

# Variant Call Format
http://www.internationalgenome.org/wiki/Analysis/variant-call-format
http://samtools.github.io/hts-specs/VCFv4.2.pdf

# Multiple donor candidates
# If you want to test multiple donor candidates at once, use the -d2 parameter with a textfile
# containing the desired donor gis. The program expects one gi per line. The donor reference
# file then has to contain all donor references (multifasta). Alternatively, you can provide
# a second donor reference file with parameter -dr2.

# !!!!! eads format: >ATM_1/1, use slash to separate reads direction!!!!!

###################################### Daisy test run ####################################

module load python/3.7.3
source ~/mypython3env/bin/activate
module load samtools/0.1.19
module load bedtools/2.27.1
module load gcc/7.3.0
module load boost/1.68.0-gcc7
module load bwa/0.7.17
module load cmake/3.14.5
module load seqan/2.4.0
module load ctk/2.4
export PATH=/srv/scratch/z5039045/Softwares/Daisy/:$PATH

# simulate reads
cd /srv/scratch/z5039045/Daisy_test/simulate_reads_1
python /srv/scratch/z5039045/Softwares/Reads_simulator.py -R ATM.fna -n 10000 -l 250 -i 500 -split
python /srv/scratch/z5039045/Softwares/Reads_simulator.py -R BGC.fna -n 10000 -l 250 -i 500 -split
cd /srv/scratch/z5039045/Daisy_test/simulate_reads_2
python /srv/scratch/z5039045/Softwares/Reads_simulator.py -R ATM.fna -n 100000 -l 250 -i 500 -split
python /srv/scratch/z5039045/Softwares/Reads_simulator.py -R BGC.fna -n 100000 -l 250 -i 500 -split
cd /srv/scratch/z5039045/Daisy_test/simulate_reads_3
python /srv/scratch/z5039045/Softwares/Reads_simulator.py -R ATM.fna -n 100000 -l 150 -i 100 -split
python /srv/scratch/z5039045/Softwares/Reads_simulator.py -R BGC.fna -n 100000 -l 150 -i 100 -split


# run Daisy
cd /srv/scratch/z5039045/Daisy_test/daisy_wd
daisy.py -r1 ../R1.fasta -r2 ../R2.fasta -ar ../References/BGC.fna -dr ../References/ATM.fna -a "BGC" -d "ATM"

cd /srv/scratch/z5039045/Daisy_test/daisy_wd_1
daisy.py -r1 ../R1.fasta -r2 ../R2.fasta -ar ../References/BGC.fna -dr ../References/ATM.fna -a "BGC" -d "ATM"

cd /srv/scratch/z5039045/Daisy_test/daisy_wd_2
daisy.py -r1 ../R1_t.fasta -r2 ../R2_t.fasta -ar ../References/BGC.fna -dr ../References/ATM.fna -a "BGC" -d "ATM"



cd /srv/scratch/z5039045/Flow_cell_biofilm/5_Daisy_test/AAM_to_BAD_new_1
daisy.py -r1 ../combined_R1.fasta -r2 ../combined_R2.fasta -ar ../ar.fasta -dr ../dr.fasta -a "BAD" -d "AAM"

cd /srv/scratch/z5039045/Flow_cell_biofilm/5_Daisy_test/AAM_to_BAD_new_2
daisy.py -r1 ../combined_R1_formatted.fasta -r2 ../combined_R2_formatted.fasta -ar ../ar.fasta -dr ../dr.fasta -a "BAD" -d "AAM"


cd /srv/scratch/z5039045/Daisy_test/daisy_wd_2_BGC_to_ATM
daisy.py -r1 ../simulate_reads_2/ATM_BGC_R1.fasta -r2 ../simulate_reads_2/ATM_BGC_R2.fasta -ar ../References/ATM.fna -dr ../References/BGC.fna -a "ATM" -d "BGC"
cd /srv/scratch/z5039045/Daisy_test/daisy_wd_2_ATM_to_BGC
daisy.py -r1 ../simulate_reads_2/ATM_BGC_R1.fasta -r2 ../simulate_reads_2/ATM_BGC_R2.fasta -ar ../References/BGC.fna -dr ../References/ATM.fna -a "BGC" -d "ATM"



cd /srv/scratch/z5039045/Daisy_test/daisy_wd_3_BGC_to_ATM
daisy.py -r1 ../simulate_reads_3/ATM_BGC_R1.fasta -r2 ../simulate_reads_3/ATM_BGC_R2.fasta -ar ../References/ATM.fna -dr ../References/BGC.fna -a "ATM" -d "BGC"
cd /srv/scratch/z5039045/Daisy_test/daisy_wd_3_ATM_to_BGC
daisy.py -r1 ../simulate_reads_3/ATM_BGC_R1.fasta -r2 ../simulate_reads_3/ATM_BGC_R2.fasta -ar ../References/BGC.fna -dr ../References/ATM.fna -a "BGC" -d "ATM"




# Biofilm dataset

module load python/3.7.3
source ~/mypython3env/bin/activate
cd /srv/scratch/z5039045/Flow_cell_biofilm/2_combined_reads
python /srv/scratch/z5039045/Scripts/Rename_FC_biofilm_reads.py -i 12D9_R1_Q30_P.fasta -o 12D9_R1_Q30_P_renamed.fasta -s 1
python /srv/scratch/z5039045/Scripts/Rename_FC_biofilm_reads.py -i 12D9_R2_Q30_P.fasta -o 12D9_R2_Q30_P_renamed.fasta -s 2
python /srv/scratch/z5039045/Scripts/Rename_FC_biofilm_reads.py -i 12D18_R1_Q30_P.fasta -o 12D18_R1_Q30_P_renamed.fasta -s 1
python /srv/scratch/z5039045/Scripts/Rename_FC_biofilm_reads.py -i 12D18_R2_Q30_P.fasta -o 12D18_R2_Q30_P_renamed.fasta -s 2
python /srv/scratch/z5039045/Scripts/Rename_FC_biofilm_reads.py -i 12D27_R1_Q30_P.fasta -o 12D27_R1_Q30_P_renamed.fasta -s 1
python /srv/scratch/z5039045/Scripts/Rename_FC_biofilm_reads.py -i 12D27_R2_Q30_P.fasta -o 12D27_R2_Q30_P_renamed.fasta -s 2
python /srv/scratch/z5039045/Scripts/Rename_FC_biofilm_reads.py -i 12D42_R1_Q30_P.fasta -o 12D42_R1_Q30_P_renamed.fasta -s 1
python /srv/scratch/z5039045/Scripts/Rename_FC_biofilm_reads.py -i 12D42_R2_Q30_P.fasta -o 12D42_R2_Q30_P_renamed.fasta -s 2


/srv/scratch/z5039045/Flow_cell_biofilm/2_combined_reads/12D9_R1_Q30_P_renamed.fasta
/srv/scratch/z5039045/Flow_cell_biofilm/2_combined_reads/12D9_R2_Q30_P_renamed.fasta
/srv/scratch/z5039045/Flow_cell_biofilm/2_combined_reads/12D18_R1_Q30_P_renamed.fasta
/srv/scratch/z5039045/Flow_cell_biofilm/2_combined_reads/12D18_R2_Q30_P_renamed.fasta
/srv/scratch/z5039045/Flow_cell_biofilm/2_combined_reads/12D27_R1_Q30_P_renamed.fasta
/srv/scratch/z5039045/Flow_cell_biofilm/2_combined_reads/12D27_R2_Q30_P_renamed.fasta
/srv/scratch/z5039045/Flow_cell_biofilm/2_combined_reads/12D42_R1_Q30_P_renamed.fasta
/srv/scratch/z5039045/Flow_cell_biofilm/2_combined_reads/12D42_R2_Q30_P_renamed.fasta


cd /srv/scratch/z5039045/Flow_cell_biofilm/5_Daisy
python /srv/scratch/z5039045/Softwares/daisy/daisy.py -r1 ../2_combined_reads/12D9_R1_Q30_P_renamed.fasta -r2 ../2_combined_reads/12D9_R2_Q30_P_renamed.fasta -ar 2.10wt_illumina.fasta -dr D2_pacbio.fasta -a "2.10_chromosome" -d D2_seq_ids.txt --outdir 12D9_210_chromosome/ --task 12D9_210_chromosome




cd /srv/scratch/z5039045/Flow_cell_biofilm/Flow_cell_biofilm_dataset
cp -r /home/z5039045/torsten/Weizhi_Song/Flow_cell_biofilm_dataset/raw_reads/run_1 ./
cd /srv/scratch/z5039045/Flow_cell_biofilm/Flow_cell_biofilm_dataset
cp -r /home/z5039045/torsten/Weizhi_Song/Flow_cell_biofilm_dataset/raw_reads/run_2 ./
cd /srv/scratch/z5039045/Flow_cell_biofilm/Flow_cell_biofilm_dataset
cp -r /home/z5039045/torsten/Weizhi_Song/Flow_cell_biofilm_dataset/raw_reads/run_3 ./



################## Daisy test (one transfer with multiple proportions) ###################

# wd
module load python/3.7.3
source ~/mypython3env/bin/activate
module load samtools/0.1.19
module load bedtools/2.27.1
module load gcc/7.3.0
module load boost/1.68.0-gcc7
module load bwa/0.7.17
module load cmake/3.14.5
module load seqan/2.4.0
module load ctk/2.4
export PATH=/srv/scratch/z5039045/Softwares/Daisy/:$PATH
cd /srv/scratch/z5039045/Daisy_test/one_transfer


# Var10_WT0, works!!!
mkdir /srv/scratch/z5039045/Daisy_test/one_transfer/2_reads_simulation/Var10_WT0
cd /srv/scratch/z5039045/Daisy_test/one_transfer/2_reads_simulation/Var10_WT0
python /srv/scratch/z5039045/Softwares/Reads_simulator.py -R ../../1_ATM_24000bp_25600bp_to_BGC_48000bp/ATM.fna -n 100000 -l 150 -i 200 -split
python /srv/scratch/z5039045/Softwares/Reads_simulator.py -R ../../1_ATM_24000bp_25600bp_to_BGC_48000bp/BGC.fna -n 100000 -l 150 -i 200 -split
cat ATM_R1.fasta BGC_R1.fasta > combined_R1.fasta
cat ATM_R2.fasta BGC_R2.fasta > combined_R2.fasta
daisy.py -r1 combined_R1.fasta -r2 combined_R2.fasta -ar ../../0_References/BGC.fna -dr ../../0_References/ATM.fna -a "BGC" -d "ATM"


# Var9_WT1, works!!!
mkdir /srv/scratch/z5039045/Daisy_test/one_transfer/2_reads_simulation/Var9_WT1
cd /srv/scratch/z5039045/Daisy_test/one_transfer/2_reads_simulation/Var9_WT1
python /srv/scratch/z5039045/Softwares/Reads_simulator.py -R ../../1_ATM_24000bp_25600bp_to_BGC_48000bp/ATM.fna -n 90000 -l 150 -i 200 -split
python /srv/scratch/z5039045/Softwares/Reads_simulator.py -R ../../1_ATM_24000bp_25600bp_to_BGC_48000bp/BGC.fna -n 90000 -l 150 -i 200 -split
python /srv/scratch/z5039045/Softwares/Reads_simulator.py -R ../../0_References/ATM.fna -n 10000 -l 150 -i 200 -split
python /srv/scratch/z5039045/Softwares/Reads_simulator.py -R ../../0_References/BGC.fna -n 10000 -l 150 -i 200 -split
cat *R1* > combined_R1.fasta
cat *R2* > combined_R2.fasta
daisy.py -r1 combined_R1.fasta -r2 combined_R2.fasta -ar ../../0_References/BGC.fna -dr ../../0_References/ATM.fna -a "BGC" -d "ATM"


# Var5_WT5
mkdir /srv/scratch/z5039045/Daisy_test/one_transfer/2_reads_simulation/Var5_WT5
cd /srv/scratch/z5039045/Daisy_test/one_transfer/2_reads_simulation/Var5_WT5
python /srv/scratch/z5039045/Softwares/Reads_simulator.py -R ../../1_ATM_24000bp_25600bp_to_BGC_48000bp/ATM.fna -n 50000 -l 150 -i 200 -split
python /srv/scratch/z5039045/Softwares/Reads_simulator.py -R ../../1_ATM_24000bp_25600bp_to_BGC_48000bp/BGC.fna -n 50000 -l 150 -i 200 -split
python /srv/scratch/z5039045/Softwares/Reads_simulator.py -R ../../0_References/ATM.fna -n 50000 -l 150 -i 200 -split
python /srv/scratch/z5039045/Softwares/Reads_simulator.py -R ../../0_References/BGC.fna -n 50000 -l 150 -i 200 -split
cat *R1* > combined_R1.fasta
cat *R2* > combined_R2.fasta
daisy.py -r1 combined_R1.fasta -r2 combined_R2.fasta -ar ../../0_References/BGC.fna -dr ../../0_References/ATM.fna -a "BGC" -d "ATM"


# Var1_WT9
mkdir /srv/scratch/z5039045/Daisy_test/one_transfer/2_reads_simulation/Var1_WT9
cd /srv/scratch/z5039045/Daisy_test/one_transfer/2_reads_simulation/Var1_WT9
python /srv/scratch/z5039045/Softwares/Reads_simulator.py -R ../../1_ATM_24000bp_25600bp_to_BGC_48000bp/ATM.fna -n 10000 -l 150 -i 200 -split
python /srv/scratch/z5039045/Softwares/Reads_simulator.py -R ../../1_ATM_24000bp_25600bp_to_BGC_48000bp/BGC.fna -n 10000 -l 150 -i 200 -split
python /srv/scratch/z5039045/Softwares/Reads_simulator.py -R ../../0_References/ATM.fna -n 90000 -l 150 -i 200 -split
python /srv/scratch/z5039045/Softwares/Reads_simulator.py -R ../../0_References/BGC.fna -n 90000 -l 150 -i 200 -split
cat *R1* > combined_R1.fasta
cat *R2* > combined_R2.fasta
daisy.py -r1 combined_R1.fasta -r2 combined_R2.fasta -ar ../../0_References/BGC.fna -dr ../../0_References/ATM.fna -a "BGC" -d "ATM"







# introduced one HGT, ATM (40001-44000) --> BGC (24000), length of HGT:4000bp
TCCCTACCCGGGGTTCGCGATGTACGCAACCGCCCGCTCGGCCTCGACCGGGCTTGCCAAGGCACTGGCGAACGAGCTGG
CGCCCCATGGCATCCGGGTGAATGCCGTGGCGCCGAACTTCCTCTACAGCGAGACCTATTACCCGCGCGCCAAATGGATC
GACGATCCCGCCGGTGCCGCCCGGGTGCGCGAGATGGTACCGCTCGGCCGTCTGGGCCGGCCCGAGGAGATCGGTGAACT
GATTGCTTTCCTGCTGTCCGACAAGGCCGGCTTTGTGGTCGGCGAGACCGTGGGCTTCACCGGCGGCTGGCCGTAAGACG
GGGCTGACAAGGCACCGGACATGGAAAAGCGGCCTGCACCGGGTGCAGGCCGCTTTTTGAATCTGGTGCCGGCGGTAGGA
ATTGAACCTACGACCTACTGATTACGAATTAGCCGACATTTAATGAAATCAAGGGACTGCGCACTATTTTTAGGCGGAAG
CCCTTCATTCTTCGGATAAAGTCGGACGCGGCTACGGCCGCGCCTTATGGTCATCCTTGATCATGTCGATCAGGCCGACA
ACGCCGGCGGCAACGCCGACGATCTGCGCCGCGACGGCCGGGTCCAGCTGCACGCCTGCGAACGTCGCGACCCAGACCAG
GCCGCGCGCGGTGGACGGCTGAAGCAGCCGCCCCTTCATCCACGACCACAGGCCGTCCTTTTCCTCGTCCATTTCTCTGC
CCTCCTTCCTATTGTTCCGCGGCGAGGACCATCCCCGCCCGCATCATGCGCAGCGCCCGCCGGGTCCAGCCGCCGGCGTT
GTGCCCCCAATTGCTCAGGCTCGCCAGATACTGGATCCGCCGCGCCGTCATCTCCTCGATCAGATCGGCCGCATTCGCGG
CCTGGACCGCGGCCAGCGTCCGCGGGCCGATGATCCCGTCCGCCGTCACCCCCGCCGCCTGCTGAAGCAGCCGCCGGGCG
CTGGCCCCCCCCTGCAGGAACGCCATATCGGCCGTGACCAGGTCCACGCCGGCCGGCAGATCGTCGCCCCGGACCGGCCC
CCAGAAATGCCGCTCGAACAGGCCCAGCGCCACCGGCTCGGTGACCAGCAGGATATCCGCCCGTGTCGTCACGCCGTCGC
CGTCGAGGTCCAGCCCGATCGCGTCAGCGAAGCGCAGCGAGATCCCCCAGCGGGTGGTGCCGCCCGGATCGGCTGCCGCC
GACCGGTCGGACACGGCCGACCCGCCTTCCGCCAGGGCGATCGCCGCCCAGGCCGTCGATCGATTGTCCTTCACACTCCC
CCCTTCCGGGCGGCCAGCAGCCGCCCCACCAGGTCTTCCAGGCCCCGCGGGCCGAGATAGGCAATCGCCACGATCGCCGC
GGTACGCGGCGCGCCGACCAGCCCGAGATGTGTCGCCATCCCGTCAGCGACGAGACCTATCCCGATCGCCGCCAGGAGCT
CCCACAATAGGTGAGTGCTGAAAAAACGGCGCCGGCCGCGCTGTACCTCGCCGACATGCCATAGGAGGCGGCCCACATAG
GCGAGCAGGCATGCCAGCCCGATGGCATCGCAGGCTTGCCGCGCGGCGGCCCAGATATCCGAGAGCATCAGACCCCATCA
CGATACGGATAGACATCTCGCGGTCCGCGCCCGACAGCGCGCAGGGCACTGATGTCGACGGATCGCAGGGCGCCGCCCTG
AGACCAGACGACCGCGGTCCCCAAAAGCATCGTCTGGAACAGGGCTCCGCCACGGACTGTAATGCTGTCCCCGACAGCAA
AATCGCTGGCGACATCGTATGGCACCTGTATTGCCGAACCGCCGGATCCGATAATCTTATGTGAAGAAGACGATGTATAG
ACCCATCGTCCCGTATATTCGTTTTCAGGAAAAACTGCAGATGTGATGATGTTCGTCACGCCGGAAGAATATGACGCGGA
CAGGACCGTCATATTTGCTATCTGTATGAAGAAAGGTAGATTTGACTCAATCCTTGCTCCCATGGTAATATCAAGATCGT
GGCTCGGCGAATATTCAACATAAACATAGTCTCCAATGCTGTATTCGGAGACTTCAGATGTTGAATATAGATTTACGCCA
TAGTTATAATAAGTGTTTATTTTTGAGCGCCGCGTCAATCCATTTCCGCGACCTGCAATATGATGTTTTGCCCACGGCGT
TCCGGTTGTGAGGCTCGTCCCGAAGCTGATCGAGTTCCCACTTTTGCCCGCCACCTGGGCCACACCTTTGATCGGTGTTG
ACATTTTGCCGTCGAAAATCGCAGGCGTGGAGCTGGACACATCGGGGTGAGTCCGCTCGATGCTCCCGGCCCATGAAAAA
GCCGGGCCGGTCGGCCGGATACCTTCCGGCGTCTGGCCCGTCACCCCGTAGCTACCGTCAATGAGCACGTGCACGGCCCC
ACCACCGCCGCCGAGGGTACAGCCATCGTCAGCCGACACCTTGCCTTGTCCGTGGATGGCGATTTTCGGGCTGCCGATGA
AGCCGGAAAAGAGATATGCGCTCAGTCTCAGGCGGCCTTCGATCCACATACCACAGACTTCTGGCGATCCACCCGAGGCA
AAACCGCAATCAATCTTTCCTTCCTGGATATATATCTCTGCCTTTGCGGCCACAAATACTCCGCAATATTTTGGCTGTTC
TATGCGAAGTCCGTTTATCGCTATATTATTGACGCCATTTCCGAATATAACGGCGGAATCTGTATAGGGATACACTACGC
GGTCATTCCGCGACATGGGCTGGAATATGTCAATGTCAGTCCATCCCATGTCATATGGGCCAGACACTCTAATGTGCGGC
CCCCGGCACGCGGTGAACCACAGGTTGTTTAGCGACCATCCATTAGCCCCTGATTCTGGTGGTGCACCCGCCGCAATATC
CATCACAATAAGACCTGCGGAAGTGCAGTTCTTAAACCCAATATGACTTATAACTACATTATTTTGGCTGTCACCATAGA
AGCAATATCTGTCAGGATTTGTCATTTTTATCCATGATACTGTTCTATGTGCACCAATTATTGATGTATTTCCGTTGACA
TTAATCCGCCTGGTCATGAGGTATTCGCCCTGAGGGACGAAGACCGCCCCCCACCTGACGGCCGCCTCCATAGCGTCGCT
ATCGTCAGTGACCCCATCGCCTTTCGCTCCCCAGCATTTGAGGGAGAGACGCTCCCTGCCGGCTGTCACCCGGCGCCAGA
GACCTGGACCGCTTGACTGTCCGGTCGGGACAAGCCGCGTCCCGCCGTCGTCCGGTGTCAGGCGGCCAGGAATAATTTCG
GACGGTATCCAGGGGGACGGGTCCCAAACGTACACACCGCCAGCCCCGTCGGTCGACGCGTAGTATCCGATCGCCCTTAT
ATAGATAAGGCTTTCATTACTGCTCTTCATTTCCTCGAAATTATACGACCTTATTTCGTCAACAGATGAAACCGTCATCG
TGTTGCTGAATGAGGGCATTTGAATATAGGTCAGCGTCCCGGCTGACGTCATCGCCAGTATTTTATTTGCCCGCGCCGCG
ACGCCTTCGAGCGGCGGCTGCGGGCCGTCCGCATCAGGAAATCGGACCGACTGCGCTATCTGACGCTCGATTTCCTGCGA
CCACATGACGATGCGATCCAGCTCTTGATTCATCGCCCGCGCGGTGAAATCACCGCTCTCGATGTAGTCTGTGAGCCGTC
TGATCGGCATCGCGCCGACAATCGCGATCAAATCTCCAGCCAGCGCCGGCAGAGACAGCGTCACAGTGGCGGTCGCAGCC
CCGATACCGGATACGCTGTAATCGGTATCGAGCACCAGCGTCACATCCGCGCCACTGCGCCGGCGCACCACGCGGATATC
ACCGGCCCCGAAGACTGGCCAGCTGAGGGGAAGCGATGTCTCCCCGCCGGTCATCTCGTAGCGCTCGACTCGGGTCGAGG
GGGTGACAGGAAAGTCGGCCATGGGATCACCCTCCGTCCGGAGATGTCGGCCAGCCGCCGCCGCGCGGGATCACGCGGGA


# introduced one HGT, BGC (40001-50000) --> ATM (16000), length of HGT:8000bp
CGCCCATGAACGTGCCGCAGATGCCGAGGATATGGATATGTGTTGGTTTGCTCATCGTTTTCAATTTCTAAAAATAAAAT
AAACCGCGCCCATCATGCAAAGCGCGGCATACAGATAGTCCCATTTTAACGGCTGGTTCATATACAGTACCGCAAACGGT
ACGAATACGAGCAGCGTGATAACTTCCTGCAGGATTTTCAACTGGCCGAGATTAAGCTCGCTATAGCCGATACGGTTGGC
CGGCACCTGTATCAGATATTCGAACAGCGCGATGCCCCAGCTGACCAGCGCGGCCACATACCAGGGCGATGCCGACATAT
TCTTCAGGTGGCCATACCACGCGAAGGTCATGAACAGGTTGGAGATGGCCAGCATCAGAATGGTGACCAGCAGCGGTTGA
GAAATCAGACCCATCAGGTTTCTTCAGGCACCATCGCGATCGCACCGCAGGGGCATTCGGCCACGCACAAGCCGCAGCCC
TTGCAGTAGTCGTAGTTAAACTGAAATCCTTTGCCGGGCCCGAGTTTAATCACCGCGTTATCGGGGCAGACGCCGTAGCA
GTTGTCGCATTCGAAACAGTTGCCGCACGATAGACAGCGGCGCGCTTCGAACAAGGCATTGGTCTCGTTAAGTCCGCCTT
GAACCTCATCGAAACTGGTCTGGCGACGGATGATATCGAGCATCGGCCGTACGGTCTTGTCAGCATCGGAGTAATACCAC
GGGTTGAGCTTGTCGAAGGTAGCGATCTCAGGCTTGGGGGCGGGGGTGAAACTCGCGCCATGTAGCCAGGCATCAATGTG
GCGCGCAGCCTTTTTGCCATGTCCTACTGCCACGGTGACGGTGCGCTCGGACGGCACCATGTCACCGCCCGCGAAGATGC
CGGGGTGACCGGTCATCATGTTGTTTGAAACCTGCACCGTGCCGTTGATGATCTCAAGGCCGGATACGCCTTCAAGCAAG
GATAGATCGACGTCCTGACCCAGCGCGAGCACCAGTGAATCGGCTTCCATGGTCTCGAATTCTCCGGTCGGCTGCGGCAC
GCCCTGTTCGTCCAGCTCCATTTTTTCAACGGTCAGACTGCCTACCTCGGCCTGTTTGATTGTGGACAGCCACTTGATCA
TCACGCCTTCTTGCAGCGCTTCTTCCACTTCGAAATCATGTGCGGGCATTTTCTCGCGGGTGCGGCGATAGACGATGATG
GCTTCTGTCGCTCCAAGACGCTTCGCGGTGCGCGCCACGTCAATCGCGGTGTTGCCGCCGCCATATACCACCACGCGGCG
ACCTAGCATCGGTTTGTCTTCACCTTCCATTGAACGCAGCACTGAGACGGCATCGACGATGTGCGCGGCATCCCCGGACG
GGATATAGGTGCGTTTGGCGATATGTGCCCCGACCGCTAAAAATGCCGCATCGAAATGGCCGTCTTGCATGCTTTGTTCG
ATATTTTCGATGCGGGTGTTCAGTTTTAACGTTACGCCCAAATCGAGTATGCGCTGAACTTCGGCGTCCAGTACGAACCT
TGGCAGCCGGTATTTCGGGATCCCGAAACGCATCATGCCGCCAGCCTGCGGGCCGGCTTCGTGGATTTCCACGCAATGTC
CCGCGCGCGTCAGATGGTAGGCCGCTGACAAACCGGAGGGCCCGGCTCCTACAACCAGTACGCGTTTACCTGTTGCGGCC
TGAGGTGCGTCGAATTTCCAGCCCTGCTTGATCGCTTCGTCCCCCAAAAAACGTTCTACGGAATTGATGCCGACTGAACT
GTCGAGCTGGCCGCGATTGCACGCATTCTCGCAAGGGTGGTAGCACACGCGTCCCATGACGGCGGGAAGCGGATTGTCTT
GCACCAGCACGCGCCAGGCCTGTTCGTAGTCGCCTGATTCGGCGTGGAACAGCCAGCCCTGAATGTTTTCGCCCGCAGGA
CACGCGTTGTTGCAGGGTGGCAGGCGGTTAAGATAGACAGGGCGCTCGGTGCGCCAGGTGCCGGTCAGGTTGGCAAGCGA
AGTGCCGGGTTTTAAGGTGATTGCAAAAGGTCGGTTGGACATGTCAGTTCCCTCCTTCTTCGAGCAATCCGTACTTGCGG
ATGTTGCGGTCGGCAATCGCCTGAATACGTGCCACGGTTTCGGGGTGTGGCGTCTTGCCGAACAAATGTGCAAAACGCTT
TTGCGGCTTTAGATAGTCTTCCACGGCAACCTGATGGCGGATTTTCGATACGCCCGTGACCTCGCCATGTTCGGCTTCGA
ACACCGGGAACAGGCCGCACTCTTTGGCCAGTCGCGCGATGCGGATGGTGTCGGCAGAGGCGGTGCCCCAGCCTAAAGGA
CAGGGCACGGACAGATGAATGTAGCGCGCGCCACGTATGGTCATGGCGCGTCGCACTTTGTATTCCAGATCGCGCAAGTC
AGCGACGGTGGCGGTGGCAACATAAGGAATACCGTGCGCCATCGCGATTTCAGGCAGGTTCTTGCCCTGTCCGAAGAGGT
TGCCGGGTTCTGCGCCTACCGGCATGGTGGTGGCGGTGCGGGCGGCAGGTGGCGTCGCGCTCGATCGTTGCACACCGGTG
TTCATGTAGGCCTCGTTGTCGTAGCAGATATACAGCACATCGTCGTTGCGCTCGAACATCCCGGACAGACAGCCAAAACC
GATGTCCGTCGTGCTGCCATCACCACCTTGCGCCACCACGCGCACCTCAGTGCGCCCCTTTACTTTCATTGCTGCGGCGA
CCCCGGTTGCAACCGCCGGCGCATTGCCGAACAGCGAATGGATCCACGGCACCTGCCATGAGGATTCAGGGTAGGGCGTT
GAGAAAACCTCCAGACAGCCAGTGGCATTCACGGCAATGAGTTGATTGTTACTCCCGGCCATCGCAGCATCAATCGCGTA
GCGTGCACCGAGCGCTTCGCCGCACCCTTGACAAGCGCGGTGACCGGAGTTGATTGAATTGCTGCGTAACTCGCCGGCTT
GCACGCTGCGCTCCGTGTCGGAGAGCAGACGGTTGCCGACGGTGTAGGTGCCGGTCTGATAGAATTTTACTGGTTGAAAT
CCCACGCTGATCTCCTTAACCGAACTTTGCTGAAACGATGCCTTTGTCGTGCAGGATGTTTTCGGCGACAGGCCCGGAGC
GGCGGGTTTGTTTCTCCCGCGCCAGCTGTTTGTTAACCGCATCCCAGTCCAGATCGAGGAAGGTCACCGGCGGCAGCGTT
TCGGCTTCGGCCTCTCTGAACAGTTTGTGCAGCGAGGCTTTTGTGATGGGGCGCCCCCCCAGACCCGCGATCGCGGTAAA
ACCTTTGAGGCCGGTGCCGGTCACTGCCATGCGCACATCGGTCGCCACGATGCCGCCCATGCCGACCGCCAGACTTTTTT
CGAGTACGACAAAGCGACGGCAGTTGATCAGCGCCGCCTTGACCTGTTCCAGCGGGAAGGGGCGATAACTGATAATGCCC
AGCACGCCGATTTTGTGGCCTTCTGCACGCATTTCATCCACCGTGTCTTTGATGGTGCCGAGCACCGAGCCCATGGCGAT
AATGATGGTGTCGGCGTCTTCCGTGCAATACGTGCGGATTAGCCCGCCGCTGTCCCGCCCGAAAATCTCGCGAAATTCGC
TGGCCAGTTGCGGAATGCGCTCGATGGCTTGCATCTGTTTGGCGTGCGCAAGATAGCGCACCTCCATAAAGGCTTCGGGG
CCGACCATCGCGCCGATGGAAACCGGCTCGGCAGGGTCGAGTACCTGACGCGGCTCGAACGGTGGCAGATAGGCGTCTAC
CTGTGCTTGCGACGGAATATCGACGCGTTCGAAGGCGTGCGTCAGGATGAAACCGTCCATGCACACCATGATCGGCATGG
AGAGTTCTTCGGCCAGCCGAAACGCCTGTATGTGCAGATCAACCGCTTCCTGATTGGTCTCGGCAAACAACTGCATCCAG
CCCGATTCACGCTGCGAGAGCGAGTCGGAGTGATCGTTCCAGATATTGATCGGTGCACCGATGGCACGATTGGCGACCGT
CATGACAATCGGCAGCCCCAGCCCCGATGCGTTGTAGACCGCCTCTGCCATGAACAGCAGGCCTTGCGATGCGGTCGCGG
TGTAGGCGCGCGCACCGGCAGCGGAAGCACCTATCGCCACCGACATGGCGGCAAATTCACTCTCGACGTTGATAAATTCG
CAGGGGGTGAGTTCGCCTGATTTGACGCTCTCGCCCAGCGCCTCGACGATGTGCGTCTGCGGGGAAATCGGATAGGCGCA
GATGACTTCAGGGCGGCACAGTGCGATGGCTTCGGCGACCGCTTTTGAGCCTTCAGTCTGCTTTAGCATGTGCCTGCTCC
TTCATTTGTTGCTGTACCCGTTCATAGGCTTCCGTTGCGGCGGTGATGTTACCTGCAGCGATTTTGCCGGTGAACCGTTC
ATTGATCGCGAGGATCACCGATTCCAAGCGAATGATGCCGGAGAGGGCTGCGAATCCCGCTAAAAGGGGGACGTTAGGGA
TGGGGCGTCCGACATGTTTGAGGCCAAGCTCAGAGGCCGGCAAGGTGCAGAATCGTTCAGGCTGTCGGCCTTTGACAAGT
TCGGCGAGTCCCAGCGCTTCAATGCTGTGATGCGAATTGAGTAGCACGTAGCCATCGGGTTTTAATCCGGCGAACACGTC
GATCTGATGCAGCAGAGTGGGATCCTGAATGATGATCGCATCGGGCTCCATGATCGGTTCACGCAAGCGGATTTCTTTAT
CCGAAATCCGGCAGAAGGCCACCACCGGCGCGCCGGTGCGCTCTGAGCCGAAGCTGGGGAAGGCCTGTGCATGACGTCCT
TCTTCGAATGCCGCGACGGATAACATCTCAGCAGCGGTGACGACCCCCTGTCCGCCGCGCCCGTGAACACGAATCTGGAA
CATGCGACACTCCTGTGTATTGACTGGCGAAGAATTCTACGCCAGTTCCGGCAGAAAGGTTTAGTTTACGCCCAACAGTT
CCACATCAAATACTAAAGTTGCATTCGCTGGAATGACGCCGCCTGCGCCGCGTGCACCGTAGCCCATGTCGGACGGGATG
GTCAATGTACGCTGACCGCCGACTTTCATGCCCGCGACGCCGACATCCCAGCCCTTAATGACGTGACCTGCACCGAGCGG
AAATTGGAACGGCTGGCCGCGATCGCGCGAACTGTCGAACTTTTTGCCTTTGTGGTCGGCTGCGGCTTCATCAAACAGCC
AGCCTGTGTAATGTACGGATACGTTTTGTCCGGCGACGGCTTCTGCACCGGTGCCCAGTTTGACGTCGTTCTTGATCAGT
TCACTCATGTTGCTCTTCTCCATTTTAGGTGCGGGGGGTGCGGCTTGTTCAGAGCACGCGGTGGTTGAAAAGGCCGCTGC
TAACAGCAGGGCTATCGTCAGCTTCGGAATCAGCTTCATTTATATCTCGATGTAAATAATTAGAAATGGATTATCGCAGG
CCAAGCAATTCGACGTCGAACACCAGCGTCGCGTTCGCAGGAATAACCCCGCCCGCACCGCGCCGTCCGTAGCCCATTTC
AGGGGGAATGGTCAGTGTGCGGCTGCCGCCCACTTTCATGCCCGCAACGCCCGTGTCCCATCCGGAAATAACACGACCCA
TGCCGAGTGGAAATTCGAATGGATCGTTGCGGTCGCGTGAGCTATCGAATTTTACCCCTTTGTTTTCGGGAGATTTTTTA
TCGAACAGCCAGCCGGTGTAATGGACGGTCACCGTTTGTCCCGCCTGCGCCTCATCGCCTTCGCCGACTTTATTGTCCAC
GATTTCGGTTCTGATCACCTTAAGCAGTTTTACTTCGAACACTAGCGTTGCATTCGGTGGAATATCGTCGCCCGCGCCTT
GTGCGCCATAGCCCATTTCAGGAGGAATCAGCAGCGTGCGTGTTCCGCCTTCCTTCATGCCCGCGACACCCTCGTCCCAG
CCTTGAATGACGCGCCCGGCACCTAAGGGAAAGTCGAACGGGTCGTTGCGGTCGAGCGAACTGTCGAACTTGCTGCCCTT
GTTGTCCGGTGCGGCATCGTCATACAGCCAGCCGGTGTAATGCACGATCACGGTTTGTCCTGCTTGAGCCTCTGCGCCTT
CGCCCAAGCTTGTGTCGATTTTGATGAGTGTAGTCATGTCGGATGTTTCCTTATTAGTAGCTTAATACGGGAGCTAGCCA
GCGTTCCGCGGTTTCGATGTCCCAGCCCTTGCGCTCGGCATAACTTGCCACCTGATCGCGGTCTATCTTGCCGGTCGCGA
AGTATTTTGCCTCCGGGTGCGAGAAGTAGAAGCCGGAAACGGCGGCGGTGGGCAGCATCGCAAAACTGTCGGTGATAGAA
ATTCCGGCGCGGCGAGTCGCATCCAGCATCGCAAACAGCGGACCCTTTTCGCTGTGTTCAGGACAAGCCGGATAACCGGG
AGCCGGACGGATGCCGCGATATTTCTCAGCGATCAGTGCGTCGTTGTCCAGACCTTCGTCGCTCGCATAGCCCCAGAATT
CGCGGCGCACGCGTGCGTGCAGCAATTCGGCGAAGGCTTCTGCCAGACGATCGGCCAGCGCTTTTAACATGATCGCGTTG
TAGTCGTCGTTCTGTGCTTCAAATTCGGCCACGCGCGCATCGATGCCGATGCCGGTCGTCACCGCGAATCCACCGATATA
ATCGGCCACGCCCTTAGGCGCAATGTAATCAGCCAGACAATAGTTCGGGATGGATGCAGGCTTTTTGGTTTGCTGGCGCA
GATTGTGCCAGGTCATGGCGCATTCAGAACGCGTCTCGTCCGTATAGATTTCGATATCATCACCGTTGATGGTGTTAGCC
GGAAACAGTCCATACACCGCATTGGCGGTGAGCCATTTTCCGTCGATGATCTGCTTTAACATTGCCTGTGCATCGGCGAA
CAGTTTGCGTGACTCTTCACCGACTACTTCGTCCTGCAAAATCTTCGGATAGCGTCCGGCCAGTTCCCACGCCTGAAAGA
ATGGCGTCCAGTCGATGTATTCAGCAATCTCGGACAAGCTGTAGTCGCGCAGTTCTTTCACGCCGGTAAACTTTGGTTTG
GGCGGCGTATAGGCATTCCAGTCGGTTTTCATGCCGTGTGCACGCGCTGCTTCAAGTGTAACGTAGACGGCTTTGGATTG
GCGGGCTTCATGCGTTTCGCGCGCCTCAATGTAGTCGGCTTTGATCGATGCGACATAGTCGTCACGTAAAGTGTCGGAGA
GCAAATTGCTGCATACGCCGACCGCACGCGAGGCGTCGGTGACATAGATGACCGTGCCTGAAGGATAGTTGGGCTCAATC
TTCACCGCCGTATGTACGCGCGAAGTTGTCGCGCCGCCGATCAGGAGCGGAATCTTGAAGCCCTGGCGTTCCATTTCTTT
TGCGACATGCGCCATTTCTTCCAGCGAGGGCGTAATTAATCCGGACAGGCCGATGACGTCGACCTTGTGTTCGCGTGCGG
CGTCCAGAATTTGCTGGCACGGCACCATCACGCCCATGTTCACTACCTCGAAGTTGTTGCACTGCAACACTACGGTGACG
ATGTTCTTGCCGATGTCATGTACGTCGCCCTTTACGGTCGCCATCAGGATTTTACCCTTGGTGCTGGTGTCGCCCGAACG
CAGTTTTTCCGCCTCGATGTAGGGGATCAGGTGCGCGACCGCCTGTTTCATCACGCGGGCGGATTTGACCACCTGCGGCA
AAAACATCTTGCCTGCGCCGAACAGATCGCCCACCACGTTCATGCCGCTCATCAGCGAATCTTCGATGACTTCGACCGGG
AATTTAGCTGCCAGACGCGCCTCTTCAGTGTCTTCCACGATGAAGGTTGTGATGCCGCGCACCAGTGCGTGGGTTAAACG
CTCCTGCACCGTGCCTTTACGCCATTCGAGATCCTCGATGATTTCCTTGCCGCCGCCTTTGACGCTCTCAGCGATTTTGA
CCAGTTTTTCGCCGGCATCCGGATGGCGGTTGAGCACCACGTCCTCGACGGCATCGCGCAGCTCGCGCGGAATCTCTTCG
