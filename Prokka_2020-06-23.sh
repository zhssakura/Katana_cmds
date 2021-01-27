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
prokka --force --prefix BAD2 --locustag BAD2 --strain BAD2 --outdir BAD2 BAD2.fna

prokka --force --prefix BDS --locustag BDS --strain BDS --outdir BDS BDS.fna
prokka --force --prefix ANE_00003 --locustag ANE_00003 --strain ANE_00003 --outdir ANE_00003 ANE_00003.fa



prokka --force --prefix TARA_ANW_MAG_00053 --locustag TARA_ANW_MAG_00053 --strain TARA_ANW_MAG_00053 --outdir TARA_ANW_MAG_00053 TARA_ANW_MAG_00053.fa


prokka --force --metagenome --prefix BD_Refined_08 --locustag BD_Refined_08 --strain BD --outdir Refined_08/Prokka Refined_08.fasta
prokka --force --metagenome --prefix BD_Refined_11 --locustag BD_Refined_11 --strain BD --outdir Refined_11/Prokka Refined_11.fasta


# @ 2019-07-04 (Shanshan)
prokka --force --metagenome --cpus 16 --kingdom Archaea --prefix GCA --locustag GCA --strain GCA --outdir GCA_Arc_Prokka_pro_866Gbk GCA.1_ASM249498v1_genomic.fasta --proteins GBK_CP000866.fasta &
prokka --force --metagenome --cpus 16 --kingdom Archaea --prefix GCA --locustag GCA --strain GCA --outdir GCA_Arc_Prokka_pro_866Gbk GCA.1_ASM250666v1_genomic.fasta --proteins GBK_CP000866.fasta &




cd /srv/scratch/z5039045
prokka --force --cpus 6 --compliant --kingdom Bacteria --genus Rheinheimera --outdir RH_prokka RH.fas
prokka --force --cpus 6 --compliant --kingdom Bacteria --genus Variovorax --outdir VR_prokka VR.fas


prokka --force --prefix DM019389 --locustag DM019389 --outdir DM019389 DM019389.fasta
prokka --force --prefix E264 --locustag E264 --outdir E264 E264.fna

cd /srv/scratch/z5039045
prokka --force --metagenome --prefix NorthSea_bin054 --locustag NorthSea_bin054 --strain NorthSea_bin054 --outdir NorthSea_bin054 NorthSea_bin054.fasta
