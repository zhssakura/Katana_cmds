
###################################### install BioSAK ####################################

module load intel-mkl/2019.3.199
module load python3/3.7.4

mkdir ~/mypython3env
python3 -m venv --system-site-packages ~/mypython3env
source ~/mypython3env/bin/activate

pip3 install --upgrade BioSAK
pip3 install --upgrade MarkerMAG
pip3 install --upgrade detectCFP


##########################################################################################

module load intel-mkl/2020.2.254
module load python3/3.8.5
source ~/mypython3env/bin/activate
BioSAK -h



scp z5039045@kdm.restech.unsw.edu.au:/path/to/file.txt ./



