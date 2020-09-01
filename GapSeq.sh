
###################################### Installation ######################################

# Manual page: https://gapseq.readthedocs.io/en/latest/install.html

# install R packages
module load R/3.6.1
R
install.packages(c("data.table", "stringr", "sybil", "getopt", "reshape2", "doParallel", "foreach", "R.utils", "stringi", "glpkAPI"))
if (!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager"); BiocManager::install("Biostrings")

# cd to the folder where you want to have GapSeq installed 
cd /srv/scratch/z5039045/Softwares
git clone https://github.com/jotech/gapseq



cd /srv/scratch/z5039045/Softwares
mkdir gapseq_test_cluster
cd gapseq_test_cluster
git clone https://github.com/jotech/gapseq


############################# Jobscript for running GapSeq ###############################

module load R/3.6.1
module load perl/5.28.0
module load git/2.22.0
module load bedtools/2.27.1
module load blast+/2.9.0
module load hmmer/3.3
module load glpk/4.65
module load barrnap/0.9
module load gcc/7.3.0
module load exonerate/2.2.0
module load parallel/20190522
module load cplex/12.9.0-academic  


# New:
cd /srv/scratch/z5039045/gapseq_test
/srv/scratch/z5039045/Softwares/gapseq/gapseq find -p all -b 100 -c 70 -l all -y genome_folder/APA_bin_6.fna
/srv/scratch/z5039045/Softwares/gapseq/gapseq find -p carbo -b 100 -c 70 -l all -y genome_folder/APA_bin_6.fna

cd /srv/scratch/z5039045/gapseq_test
/srv/scratch/z5039045/Softwares/gapseq_test/gapseq find -n -p all -b 100 -c 70 -l all -y APA_bin_6.fna


# Test
cd /srv/scratch/z5039045/GapSeq_Sponge_and_Coral_MAGs/Test_GapSeq
/srv/scratch/z5039045/Softwares/gapseq_test_cluster/gapseq/gapseq find -p carbo -b 100 -c 70 -l all -y APA_bin_2.fna
cd /srv/scratch/z5039045/GapSeq_Sponge_and_Coral_MAGs/Test_GapSeq
/srv/scratch/z5039045/Softwares/gapseq_test_cluster/gapseq/gapseq find -p carbo -b 100 -c 70 -l all -y APA_bin_6.fna


# /srv/scratch/z5039045/Softwares/gapseq/gapseq find -p all -t Archaea -b 100 -c 70 -l all -y ./STY_Merged_OTU08.fasta

#√   -p keywords such as pathways or subsystems (for example amino,nucl,cofactor,carbo,polyamine)
#   -e Search by ec numbers (comma separated)
#   -r Search by enzyme name (colon separated)
#   -d Database: vmh or seed (default: seed)
#√   -t Taxonomic range for sequences to be downloaded (default: Bacteria)
#√   -b Bit score cutoff for local alignment (default: 200)
#   -i Identity cutoff for local alignment (default: 0)
#√   -c Coverage cutoff for local alignment (default: 75)
#   -s Strict candidate reaction handling (do _not_ use pathway completeness, key kenzymes and operon structure to infere if imcomplete pathway could be still present (default: false)
#   -u Suffix used for output files (default: pathway keyword)
#   -a blast hits back against uniprot enzyme database
#   -n Consider superpathways of metacyc database
#√   -l Select the pathway database (MetaCyc(2712), KEGG(523), SEED(666), all(3922); default: metacyc,custom)
#   -o Only list pathways found for keyword; default false)
#   -x Do not blast only list pathways, reactions and check for available sequences; default false
#   -q Include sequences of hits in log files; default false
#   -v Verbose level, 0 for nothing, 1 for pathway infos, 2 for full (default 1)
#   -k Do not use parallel
#   -g Exhaustive search, continue blast even when cutoff is reached (default false)
#   -z Quality of sequences for homology search: 1:only reviewed (swissprot), 2:unreviewed only if reviewed not available, 3:reviewed+unreviewed, 4:only unreviewed (default 2)
#   -m Limit pathways to taxonomic range (default )

# New:
# /srv/scratch/z5039045/Softwares/gapseq/gapseq find-transport -b 100 -c 70 ./STY_Merged_OTU08.fasta

#√   -b bit score cutoff for local alignment (default: 50)
#   -i identity cutoff for local alignment (default: 0)
#√   -c coverage cutoff for local alignment (default: 75)
#   -q Include sequences of hits in log files; default false
#   -k do not use parallel
#   -m only check for this keyword/metabolite (default )

# # # -b neg
# New:
# /srv/scratch/z5039045/Softwares/gapseq/gapseq draft -r ./STY_Merged_OTU08-all-Reactions.tbl -t ./STY_Merged_OTU08-Transporter.tbl -p ./STY_Merged_OTU08-all-Pathways.tbl -c ./STY_Merged_OTU08.fasta -u 100 -l 50 -b arc
# a few reactions should be added/modified to created draft model!!!

#√     -r|--blast.res          Blast-results table generated by gapseq.sh.
#√     -t|--transporter.res    Blast-results table generated by transporter.sh.
#√     -b|--biomass            Gram "pos" OR "neg" OR "archae" OR "auto"? Default: "auto". Please note: if set to "auto", the external programms barrnap, usearch, and bedtools are required.
#     -n|--model.name         Name of draft model network. Default: the basename of "blast.res"
#     -c|--genome.seq         If gram is set to "auto", the genome sequence is required to search for 16S genes, which are used to predict gram-staining.
#√     -u|--high.evi.rxn.BS    Reactions with an associated blast-hit with a bitscore above this value will be added to the draft model as core reactions (i.e. high-sequence-evidence reactions)
#√     -l|--min.bs.for.core    Reactions with an associated blast-hit with a bitscore below this value will be considered just as reactions that have no blast hit.
#     -o|--output.dir         Directory to store results. Default: "." (alternatives not yet implemented)
#     -s|--sbml.output        Should the gapfilled model be saved as sbml? Default: FALSE (export not yet implemented)
#     -p|--pathway.pred       Pathway-results table generated by gapseq.sh.
#√     -a|--curve.alpha        Exponent coefficient for transformation of bitscores to reaction weights for gapfilling. (Default: 1 (neg-linear))


# /srv/scratch/z5039045/Softwares/gapseq/gapseq fill -m ./STY_Merged_OTU08_draft_SCM1_model_Li_2018.RDS -n /srv/scratch/z5095298/software/gapseq/Diets_Sponges_July_2019/2020-04-02_photo_Jo/Minimal_diet_GapSeq_GCMSmodify/medium_photo_20200402_Jo.csv -c ./STY_Merged_OTU08-rxnWeights.RDS -g ./STY_Merged_OTU08-rxnXgenes.RDS -b 50 -o ./20220623_diet_Jo_photo_test__STY_Merged_OTU08_draft_SCM1_model_Li_2018 -r TRUE
# New:
# 1. sub2pwy.csv add 4 compounds: Oxidized-ferredoxins, Reduced-ferredoxins, Oxidized-Plastocyanins and Plastocyanin-Reduced
# 2. diet with single carbon source to seawater?

#√     -m|--model                  GapSeq-Draft-Model to be gapfilled (RDS or SBML)
#     -h|--help                   help
#√     -n|--media                  tab- or komma separated table for media components. Requires three named columns: 1 - "compounds" (for metab. IDs), 2 - "name" (metab. name), 3 - "maxFlux" (maximum inflow flux)
#     -f|--full.model             RDS file of the full (dummy) model. (ask Silvio for it :) ). Defaut: dat/full.model.RDS
#     -t|--target.metabolite      ID (without compartment suffix) of metabolite that shall be produced. Default: cpd11416 (Biomass)
#√     -c|--rxn.weights.file       Reaction weights table generated by gapseq function "generate_GSdraft.R" (RDS format).
#√     -g|--rxnXgene.table         Table with gene-X-reaction associations as generated by the "generate_GSdraft.R" (RDS format)
#√     -b|--bcore                  Minimum bitscore for reaction associated blast hits to consider reactions as core/candidate reactions. Default: 50
#√     -o|--output.dir             Directory to store results. Default: "gapfill".
#     -s|--sbml.output            Should the gapfilled model be saved as sbml? Default: FALSE
#     -q|--quick.gf               perform only step 1 and 2. Default: FALSE
#     -l|--limit                  Test metabolite to which search is limitted
#     -x|--no.core                Use always all reactions insteadof core reactions with have sequence evidence. Default: FALSE
#     -v|--verbose                Verbose output and printing of debug messages. Default: FALSE
#√     -r|--relaxed.constraints    Save final model as unconstraint network (i.e. all exchange reactions are open). Default: FALSE




# test with customized pathways
cd /srv/scratch/z5039045/gapseq_test
/srv/scratch/z5039045/Softwares/gapseq_test/gapseq find -p all -b 100 -c 70 -l all -y -n APA_bin_6.fna

/srv/scratch/z5039045/Softwares/gapseq/gapseq find-transport -h











