
module load samtools/1.10

# An unmapped read whose mate is mapped.
samtools view -u  -f 4 -F264 alignments.bam  > tmps1.bam

# A mapped read who’s mate is unmapped
samtools view -u -f 8 -F 260 alignments.bam  > tmps2.bam

# Both reads of the pair are unmapped
samtools view -u -f 12 -F 256 alignments.bam > tmps3.bam





module load bowtie/2.2.9
 1005  bowtie2-build -f ref.fa ref
 1006  ls
 1007  
 1008  bowtie2 -x ref -f reads.fa -S ref.sam
 1009  module load samtools/1.2
 1010  samtools view -bS ref.sam -o ref.bam
 1012  samtools sort ref.bam ref_sorted
 1013  samtools index ref_sorted.bam 



# convert sam files to bam files with samtools
samtools view -bS BBAY68.sam -o BBAY68.bam
samtools view -bS BBAY69.sam -o BBAY69.bam
samtools view -bS BBAY70.sam -o BBAY70.bam

# sort bam files with samtools
samtools sort BBAY68.bam -o BBAY68_sorted.bam
samtools sort BBAY69.bam -o BBAY69_sorted.bam
samtools sort BBAY70.bam -o BBAY70_sorted.bam

# index sorted bam files with samtools
samtools index BBAY68_sorted.bam
samtools index BBAY69_sorted.bam
samtools index BBAY70_sorted.bam



# bam to sam
module load samtools/1.10
cd /srv/scratch/z5039045/Flow_cell_biofilm/3_novoalign_nonsubsampled
samtools view 210WTD0.bam -o 210WTD0.sam -O SAM
samtools view D2D0.bam -o D2D0.sam -O SAM



samtools view -f 8 -F 4 -b foo.bam > foo.filtered.bam

-f 8 -F 4   :   yield reads that are mapped with unmapped mates.
-F 8 -f 4   :   yield unmapped reads with mapped mates, but flagstat doesn't count mapped mates unless the read being looked at is also mapped (thus, the singleton metric with -f 8 -F 4).
-f INT   only include reads with all  of the FLAGs in INT present [0]
-F INT   only include reads with none of the FLAGS in INT present [0]
4   segment unmapped
8   next segment in the template unmapped
-f 4
-f 8
-F 4
-F 8
samtools view -f 8 -F 4 -b MBARC26_fake_bins_combined_sorted.bam > MBARC26_fake_bins_combined_sorted.f8.F4.bam
samtools view -F 8 -f 4 -b MBARC26_fake_bins_combined_sorted.bam > MBARC26_fake_bins_combined_sorted.F8.f4.bam







import os


'''
# subsample reads 
module load usearch/11.0.667
cd /srv/scratch/z5039045/MarkerMAG_wd/MBARC26
MarkerMAG subsample_reads -r1 MBARC26_R1.fasta -r2 MBARC26_R2.fasta -ratio 0.05 -usearch /srv/scratch/z5039045/Softwares/usearch/usearch11.0.667_i86linux64

# map reads to reference
module load samtools/1.10
module load bowtie/2.3.5.1
cd /srv/scratch/z5039045/MarkerMAG_wd/new_algorithm
bowtie2 -x MBARC26_fake_bins_combined -1 MBARC26_R1_0.05.fasta -2 MBARC26_R2_0.05.fasta -S MBARC26.sam -p 12 -f --quiet
samtools view -bS MBARC26.sam -o MBARC26.bam
samtools sort MBARC26.bam -o MBARC26_sorted.bam
samtools index MBARC26_sorted.bam




module load samtools/1.10
cd /srv/scratch/z5039045/MarkerMAG_wd/MBARC26/MBARC26_link_Matam_FakeBins_500bp_depth_d0.2_MarkerMAG_wd/MBARC26_fake_bins_db
bowtie2 -x %s/%s -1 %s -2 %s -S %s -f --local --no-unal --quiet --threads %s
samtools view -f 8 -F 4 -b foo.bam > foo.filtered.bam

-f 8 -F 4   :   yield reads that are mapped with unmapped mates.
-F 8 -f 4   :   yield unmapped reads with mapped mates, but flagstat doesn't count mapped mates unless the read being looked at is also mapped (thus, the singleton metric with -f 8 -F 4).

-f INT   only include reads with all  of the FLAGs in INT present [0]
-F INT   only include reads with none of the FLAGS in INT present [0]
4   segment unmapped
8   next segment in the template unmapped

-f 4
-f 8
-F 4
-F 8

samtools view -f 8 -F 4 -b MBARC26_fake_bins_combined_sorted.bam > MBARC26_fake_bins_combined_sorted.f8.F4.bam
samtools view -F 8 -f 4 -b MBARC26_fake_bins_combined_sorted.bam > MBARC26_fake_bins_combined_sorted.F8.f4.bam



cd /srv/scratch/z5039045/MarkerMAG_wd/new_algorithm
samtools view -f 8 -F 4 -b MBARC26_sorted.bam > MBARC26_sorted.f8.F4.bam
samtools view -F 8 -f 4 -b MBARC26_sorted.bam > MBARC26_sorted.F8.f4.bam

samtools view -h -o MBARC26_sorted.f8.F4.sam MBARC26_sorted.f8.F4.bam
samtools view -h -o MBARC26_sorted.F8.f4.sam MBARC26_sorted.F8.f4.bam

