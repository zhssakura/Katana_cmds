####################################### Documents ########################################

# Create a repository on github (e.g. demo_pipeline), You will see a link once you do that successfully.
https://github.com/your_username/demo_pipeline.git

# For more details:
https://try.github.io/levels/1/challenges/1

# You can include a README.md file in your folder to show-off your project
https://guides.github.com/features/mastering-markdown/#what


##################################### Push to github #####################################

# cd to the folder holds your project codes on your computer
cd demo_pipeline
git init
git add .
git commit -m -

# demo_pipeline
git remote add demo_pipeline https://github.com/your_username/demo_pipeline.git
git push -u demo_pipeline master

# songweizhi.github.io
git remote add songweizhi.github.io https://github.com/songweizhi/songweizhi.github.io.git
git push -u songweizhi.github.io master

# MyBioTools
git remote add MyBioTools https://github.com/songweizhi/MyBioTools.git
git push -u MyBioTools master

# KelpBins
git remote add KelpBins https://github.com/songweizhi/KelpBins.git
git push -u KelpBins master

# R_scripts
git remote add R_scripts https://github.com/songweizhi/R_scripts.git
git push -u R_scripts master

# Katana_cmds
git remote add Katana_cmds https://github.com/songweizhi/Katana_cmds.git
git push -u Katana_cmds master

# MyBioTools
git remote add BioSAK https://github.com/songweizhi/BioSAK.git
git push -u BioSAK master


####################################### Wiki pages #######################################

# Clones the wiki locally
git clone https://github.com/songweizhi/Katana_cmds.wiki.git

# edit locally and push
cd /Users/songweizhi/PycharmProjects/Katana_cmds/Katana_cmds.wiki
git add .
git commit -m -
git push


############################# Remove idea folder from github #############################

echo '.idea' >> .gitignore
git rm -r --cached .idea
git add .gitignore
git commit -m -
git push
