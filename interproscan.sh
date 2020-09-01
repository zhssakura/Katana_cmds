
################################## Install InterProScan ##################################

# install the core InterProScan software
cd /srv/scratch/z5039045/Softwares/interproscan
wget ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/5/5.39-77.0/interproscan-5.39-77.0-64-bit.tar.gz
wget ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/5/5.39-77.0/interproscan-5.39-77.0-64-bit.tar.gz.md5
tar -pxvzf interproscan-5.39-77.0-*-bit.tar.gz


# Install Panther Data
cd /srv/scratch/z5039045/Softwares/interproscan/interproscan-5.39-77.0/data
wget ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/5/data/panther-data-14.1.tar.gz
wget ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/5/data/panther-data-14.1.tar.gz.md5
tar -pxvzf panther-data-14.1.tar.gz

# Works on desktop Linux, but java error on Katana !!!
module load perl/5.28.0 
module load java/8u201-jre
/srv/scratch/z5039045/Softwares/interproscan/interproscan-5.39-77.0/interproscan.sh -h


#################################### run InterProScan ####################################

module unload java
module unload interproscan
module load java/8u201-jre
module load perl/5.28.0 
module load interproscan/5.35-74.0
# module load interproscan/5.20-59.0 

cd /srv/scratch/z5039045/P67b_genome
mkdir P67b_interproscan_wd
interproscan.sh -i P67b.faa -d P67b_interproscan_wd -f tsv -T P67b_interproscan_wd_tmp
interproscan.sh -i P67b.faa -f tsv -T P67b_interproscan_wd_tmp
