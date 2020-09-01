
module load samtools/1.3.1

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

