#################### Prokka #################### 

module load perl/5.28.0
module load infernal/1.1.2 
module load blast+/2.9.0 
module load hmmer/3.2.1
module load prodigal/2.6.3
module load tbl2asn/25.8
module load parallel/20190522 
module load aragorn/1.2.38 
module load bedtools/2.27.1
module load barrnap/0.9 
module load prokka/1.14.5

prokka --force --prefix BAD --locustag BAD --strain BAD --outdir BAD BAD.fna
prokka --force --metagenome --prefix BD_Refined_08 --locustag BD_Refined_08 --strain BD --outdir Refined_08/Prokka Refined_08.fasta

# 2019-07-04 (Shanshan)
prokka --force --metagenome --cpus 16 --kingdom Archaea --prefix GCA --locustag GCA --strain GCA --outdir GCA_Arc_Prokka_pro_866Gbk GCA.1_ASM249498v1_genomic.fasta --proteins GBK_CP000866.fasta &
prokka --force --metagenome --cpus 16 --kingdom Archaea --prefix GCA --locustag GCA --strain GCA --outdir GCA_Arc_Prokka_pro_866Gbk GCA.1_ASM250666v1_genomic.fasta --proteins GBK_CP000866.fasta &


#
prokka --force --cpus 6 --compliant --kingdom Bacteria --genus Rheinheimera --outdir RH_prokka RH.fas
prokka --force --cpus 6 --compliant --kingdom Bacteria --genus Variovorax --outdir VR_prokka VR.fas



# create a folder named prokka_wd
mkdir /srv/scratch/z5189525/prokka_wd

# copy your spades assemblies and reference genomes into prokka_wd


module load perl/5.28.0
module load infernal/1.1.2 
module load blast+/2.9.0 
module load hmmer/3.2.1
module load prodigal/2.6.3
module load tbl2asn/20200706
module load parallel/20190522 
module load aragorn/1.2.38 
module load bedtools/2.27.1
module load barrnap/0.9 
module load prokka/1.14.5

cd /srv/scratch/z5189525/prokka_wd
prokka --force --compliant --kingdom Bacteria --prefix G1 --locustag G1 --strain G1 --outdir G1_prokka_wd G1_scaffolds_2000bp.fasta
prokka --force --compliant --kingdom Bacteria --prefix G1_ref --locustag G1_ref --strain G1_ref --outdir G1_ref_prokka_wd G1_ref.fasta

prokka --force --compliant --kingdom Bacteria --prefix G2 --locustag G2 --strain G2 --outdir G2_prokka_wd G2_scaffolds_2000bp.fasta
prokka --force --compliant --kingdom Bacteria --prefix G2_ref --locustag G2_ref --strain G2_ref --outdir G2_ref_prokka_wd G2_ref.fasta

prokka --force --compliant --kingdom Bacteria --prefix G3 --locustag G3 --strain G3 --outdir G3_prokka_wd G3_scaffolds_2000bp.fasta
prokka --force --compliant --kingdom Bacteria --prefix G3_ref --locustag G3_ref --strain G3_ref --outdir G3_ref_prokka_wd G3_ref.fasta




