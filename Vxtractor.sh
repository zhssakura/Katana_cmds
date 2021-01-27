
perl vxtractor.pl -h HMMs/bacteria/ -r V1 -r V2 -i long -o testfile.output.fasta -c testfile.output.csv testfile.fasta

export PATH=/Users/songweizhi/Softwares/hmmer/hmmer-3.1b2-macosx-intel/binaries:$PATH
perl vxtractor.pl -h HMMs/bacteria/ -r .V1-V9. -i long -o testfile.output.fasta -c testfile.output.csv testfile.fasta
