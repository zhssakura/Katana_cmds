
##################################### upload to PyPI #####################################

alias twine='/Users/songweizhi/Library/Python/3.7/bin/twine'
cd /Users/songweizhi/PycharmProjects/MarkerMAG
rm -r build
rm -r dist
rm -r MarkerMAG.egg-info
python setup.py sdist bdist_wheel
twine upload dist/*
songweizhi

shan88


################################## upload to test.PyPI ###################################

cd /Users/songweizhi/PycharmProjects/MarkerMAG
rm -r build
rm -r dist
rm -r MarkerMAG.egg-info
python setup.py sdist bdist_wheel
twine upload --repository-url https://test.pypi.org/legacy/ dist/*
songweizhi

shan88

# install/upgrade BioSAK
pip3 install --upgrade -i https://test.pypi.org/simple/ MarkerMAG
MarkerMAG -h


#################################### install MarkerMAG ###################################

module load python/3.6.5
mkdir ~/mypython365env
python3 -m venv --system-site-packages ~/mypython365env
source ~/mypython365env/bin/activate

pip3 install --upgrade MarkerMAG
pip3 install --upgrade -i https://test.pypi.org/simple/ MarkerMAG


###################################### run MarkerMAG #####################################







