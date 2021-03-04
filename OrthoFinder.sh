
# download OrthoFinder from https://github.com/davidemms/OrthoFinder/releases/tag/2.5.2

module load python/3.7.3
source ~/mypython3env/bin/activate
cd /srv/scratch/z5039045/Softwares
tar xzf OrthoFinder_source.tar.gz
python3 OrthoFinder_source/orthofinder.py -h





cd /srv/scratch/z5039045/Softwares/OrthoFinder_source/test
python3 /srv/scratch/z5039045/Softwares/OrthoFinder_source/orthofinder.py -f /srv/scratch/z5039045/Softwares/OrthoFinder_source/ExampleData

cd /srv/scratch/z5039045/Kelp_coassembly/test
python3 /srv/scratch/z5039045/Softwares/OrthoFinder_source/orthofinder.py -f /srv/scratch/z5039045/Kelp_coassembly/test/orthofinder_in -t 6 -a 1
