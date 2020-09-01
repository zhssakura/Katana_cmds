# Get 16s sequences from input genomes in fasta format

module load perl/5.28.0
module load hmmer/3.2.1
module load bedtools/2.27.1
module load barrnap/0.9

barrnap MBAD.fna > barrnap_MBAD.gff3
bedtools getfasta -fi MBAD.fna -bed barrnap_MBAD.gff3 -fo rRNA_seq_MBAD.fasta -name -s
