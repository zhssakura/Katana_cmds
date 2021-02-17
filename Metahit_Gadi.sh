
# install megahit for the group
cd /scratch/du5/apps/megahit
wget https://github.com/voutcn/megahit/releases/download/v1.2.9/MEGAHIT-1.2.9-Linux-x86_64-static.tar.gz
tar zvxf MEGAHIT-1.2.9-Linux-x86_64-static.tar.gz
mv MEGAHIT-1.2.9-Linux-x86_64-static 1.2.9
# change the first line in "/scratch/du5/apps/megahit/1.2.9/bin/megahit" to "#!/usr/bin/env python3"


# run on a toy dataset
cd /scratch/du5/wzs561/megahit_test
/scratch/du5/apps/megahit/1.2.9/bin/megahit --test  


# run on a real dataset
cd /scratch/du5/wzs561/megahit_test
head -1000000 ../combined_CF_R1.fasta > CF_R1_subset_1m.fasta 
head -1000000 ../combined_CF_R2.fasta > CF_R2_subset_1m.fasta 
/scratch/du5/apps/megahit/1.2.9/bin/megahit -1 CF_R1_subset_1m.fasta -2 CF_R2_subset_1m.fasta -o CF_megahit_1m


cd /scratch/du5/wzs561
scp -r z5095298@kdm.restech.unsw.edu.au:/srv/scratch/z5095298/Kelp_coassembly ./


# copy file to Gadi with its data-mover node
cd /srv/scratch/z5095298/Kelp_coassembly
scp BH_ER_pairedForward.fastq wzs561@gadi-dm.nci.org.au:/scratch/du5/wzs561/



BH_ER_pairedReverse.fastq
BH_ER_unpairedForward.fastq
BH_ER_unpairedReverse.fastq
BI_ER_pairedForward.fastq
BI_ER_pairedReverse.fastq
BI_ER_unpairedForward.fastq
BI_ER_unpairedReverse.fastq
CB_ER_pairedForward.fastq
CB_ER_pairedReverse.fastq
CB_ER_unpairedForward.fastq
CB_ER_unpairedReverse.fastq

SH_ER_pairedForward.fastq
SH_ER_pairedReverse.fastq
SH_ER_unpairedForward.fastq
SH_ER_unpairedReverse.fastq
