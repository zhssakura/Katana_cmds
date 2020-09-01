##################################### upload to PyPI #####################################

# upload Binning_refiner to PyPI
cd /Users/songweizhi/PycharmProjects/Binning_refiner
rm -r build
rm -r dist
rm -r Binning_refiner.egg-info
python setup.py sdist bdist_wheel
twine upload dist/*

# install/upgrade Binning_refiner
pip install --upgrade Binning_refiner


################################## upload to PyPI (Test) #################################

# upload Binning_refiner to TestPyPI
cd /Users/songweizhi/PycharmProjects/Binning_refiner
rm -r build
rm -r dist
rm -r Binning_refiner.egg-info
python setup.py sdist bdist_wheel
twine upload --repository-url https://test.pypi.org/legacy/ dist/*

# install/upgrade Binning_refiner
pip install --upgrade -i https://test.pypi.org/simple/ Binning_refiner


