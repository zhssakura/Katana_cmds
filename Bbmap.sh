
# Global versus Local Alignment:
# BBMap is a global aligner. That means it looks for the highest-scoring alignment taking into account all bases in a sequence. 
# A local aligner would look for the best-scoring local alignment, meaning an alignment where the ends are possibly clipped off. 
# So, if there were two possible alignment locations for a 100bp read, one with 3 mismatches scattered through a read, and one 
# with 5 mismatches all in the last 10bp of a read, BBMap would place the read at the location with 3 mismatches, while a local 
# aligner would probably place it at the location with 5 mismatches, but clip the end so that the result would be a clipped 90bp 
# sequence with zero mismatches. Which of these is better depends on the experiment, but global alignments are essential in order 
# to detect long indels.

# BBMap has a “local” flag, which will convert its global alignments into local alignments. That does not make it a local aligner 
# – it still looks for the best global alignment. If the local flag is enabled, then the alignment will be clipped if that yields 
# a higher score. So, BBMap will create local alignments, but it will not guarantee that it finds the optimal local alignment – 
# rather, it will produce local alignments from the optimal global alignments.

# ambiguous=all
# local=t
# threads=auto


module load java/8u121
module load bbmap/38.51


# To index and map:     
bbmap.sh ref=<reference fasta>     
bbmap.sh in=<reads> out=<output sam>


# To map without writing an index:
bbmap.sh ref=<reference fasta> in=<reads> out=<output sam> nodisk


module load java/8u121
module load bbmap/38.51
cd /srv/scratch/z5039045/Mac_test
bbmap.sh ref=combined_16S.ffn
bbmap.sh in=combined_5x_R1.fasta in2=combined_5x_R2.fasta out=combined_5x.sam local=t
   
   
bbmap.sh ref=combined_16S.ffn in=combined_5x_R1.fasta in2=combined_5x_R2.fasta out=combined_5x2.sam local=t nodisk








