
Contact
---

+ Weizhi Song (songwz03@gmail.com)
+ The Centre for Marine Bio-Innovation, University of New South Wales, Sydney, Australia

    
Copy folders/files between HPC (e.g. Katana and Raijin)
---

    # logged into Raijin, copy one file to Raijin, need to provide password for Katana
    scp z5039045@kdm.science.unsw.edu.au:/srv/scratch/z5039045/bins/bin_1.fa /short/du5/wzs561/

    # logged into Raijin, copy all files in folder 'bins' to Raijin, , need to provide password for Katana
    scp -r z5039045@kdm.science.unsw.edu.au:/srv/scratch/z5039045/bins /short/du5/wzs561/

    # logged into KDM, copy one file to Raijin, need to provide password for Raijin
    scp /srv/scratch/z5039045/Liu_YR/Organic_Fertilizers/1_raw_reads/g3_1_Q25_P.fq wzs561@raijin.nci.org.au:/short/du5/wzs561/Liu_YR_Organic_Fertilizers_new/
    
    # logged into KDM, copy all files in folder 'bins' to Raijin, need to provide password for Raijin
    scp -r /srv/scratch/z5039045/Liu_YR/Organic_Fertilizers/2_filtered_reads wzs561@raijin.nci.org.au:/short/du5/wzs561/Liu_YR_Organic_Fertilizers_new/


