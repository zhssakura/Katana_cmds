
####################################### copy files #######################################

# copy files from Katana to Gadi with its data-mover node
# refers to section "File Transfer to/from Gadi" from https://opus.nci.org.au/display/Help/0.+Welcome+to+Gadi 

# step 1: login to kdm (kdm.restech.unsw.edu.au)

# step 2: copy files to Gadi
cd /srv/scratch/z5095298/Kelp_coassembly
scp BH_ER_pairedForward.fastq wzs561@gadi-dm.nci.org.au:/scratch/du5/wzs561/


###################################### install BioSAK ####################################

module load intel-mkl/2019.3.199
module load python3/3.7.4

mkdir ~/mypython3env
python3 -m venv --system-site-packages ~/mypython3env
source ~/mypython3env/bin/activate

pip3 install --upgrade BioSAK


##########################################################################################

module load intel-mkl/2020.2.254
module load python3/3.8.5
source ~/mypython3env/bin/activate
BioSAK -h




