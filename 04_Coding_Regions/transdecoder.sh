#!/bin/bash
#SBATCH --job-name=transdecoder
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 16
#SBATCH --mem=100G
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=ALL
#SBATCH --mail-user=swapna.subramanian@uconn.edu
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

hostname
date

##################################################
## Combine the trinity assemblies		##
##################################################

# add a sample name prefix to each sequence ID in each assembly
SAM=P02_S109
sed "s/>/>${SAM}_/g" ../trinity_2/trinity_${SAM}.Trinity.fasta > ../trinity_2/trinity_prefix_${SAM}.Trinity.fasta
SAM=P08_S156
sed "s/>/>${SAM}_/g" ../trinity_2/trinity_${SAM}.Trinity.fasta > ../trinity_2/trinity_prefix_${SAM}.Trinity.fasta
SAM=N04_S123
sed "s/>/>${SAM}_/g" ../trinity_2/trinity_${SAM}.Trinity.fasta > ../trinity_2/trinity_prefix_${SAM}.Trinity.fasta
SAM=O01_S100
sed "s/>/>${SAM}_/g" ../trinity_2/trinity_${SAM}.Trinity.fasta > ../trinity_2/trinity_prefix_${SAM}.Trinity.fasta
SAM=B08_S56
sed "s/>/>${SAM}_/g" ../trinity_2/trinity_${SAM}.Trinity.fasta > ../trinity_2/trinity_prefix_${SAM}.Trinity.fasta
SAM=N06_S139
sed "s/>/>${SAM}_/g" ../trinity_2/trinity_${SAM}.Trinity.fasta > ../trinity_2/trinity_prefix_${SAM}.Trinity.fasta
SAM=N12_S184
sed "s/>/>${SAM}_/g" ../trinity_2/trinity_${SAM}.Trinity.fasta > ../trinity_2/trinity_prefix_${SAM}.Trinity.fasta
SAM=N10_S170
sed "s/>/>${SAM}_/g" ../trinity_2/trinity_${SAM}.Trinity.fasta > ../trinity_2/trinity_prefix_${SAM}.Trinity.fasta
SAM=P01_S101
sed "s/>/>${SAM}_/g" ../trinity_2/trinity_${SAM}.Trinity.fasta > ../trinity_2/trinity_prefix_${SAM}.Trinity.fasta
SAM=E03_S21
sed "s/>/>${SAM}_/g" ../trinity_2/trinity_${SAM}.Trinity.fasta > ../trinity_2/trinity_prefix_${SAM}.Trinity.fasta
SAM=K12_S181
sed "s/>/>${SAM}_/g" ../trinity_2/trinity_${SAM}.Trinity.fasta > ../trinity_2/trinity_prefix_${SAM}.Trinity.fasta
SAM=F03_S22
sed "s/>/>${SAM}_/g" ../trinity_2/trinity_${SAM}.Trinity.fasta > ../trinity_2/trinity_prefix_${SAM}.Trinity.fasta
SAM=B04_S26
sed "s/>/>${SAM}_/g" ../trinity_2/trinity_${SAM}.Trinity.fasta > ../trinity_2/trinity_prefix_${SAM}.Trinity.fasta
SAM=G12_S92
sed "s/>/>${SAM}_/g" ../trinity_2/trinity_${SAM}.Trinity.fasta > ../trinity_2/trinity_prefix_${SAM}.Trinity.fasta
SAM=O06_S140
sed "s/>/>${SAM}_/g" ../trinity_2/trinity_${SAM}.Trinity.fasta > ../trinity_2/trinity_prefix_${SAM}.Trinity.fasta
SAM=M04_S122
sed "s/>/>${SAM}_/g" ../trinity_2/trinity_${SAM}.Trinity.fasta > ../trinity_2/trinity_prefix_${SAM}.Trinity.fasta
SAM=T02_S198
sed "s/>/>${SAM}_/g" ../trinity_2/trinity_${SAM}.Trinity.fasta > ../trinity_2/trinity_prefix_${SAM}.Trinity.fasta
SAM=O12_S185
sed "s/>/>${SAM}_/g" ../trinity_2/trinity_${SAM}.Trinity.fasta > ../trinity_2/trinity_prefix_${SAM}.Trinity.fasta
SAM=L12_S182
sed "s/>/>${SAM}_/g" ../trinity_2/trinity_${SAM}.Trinity.fasta > ../trinity_2/trinity_prefix_${SAM}.Trinity.fasta
SAM=G10_S76
sed "s/>/>${SAM}_/g" ../trinity_2/trinity_${SAM}.Trinity.fasta > ../trinity_2/trinity_prefix_${SAM}.Trinity.fasta
SAM=C05_S33
sed "s/>/>${SAM}_/g" ../trinity_2/trinity_${SAM}.Trinity.fasta > ../trinity_2/trinity_prefix_${SAM}.Trinity.fasta
SAM=I05_S126
sed "s/>/>${SAM}_/g" ../trinity_2/trinity_${SAM}.Trinity.fasta > ../trinity_2/trinity_prefix_${SAM}.Trinity.fasta
SAM=L03_S113
sed "s/>/>${SAM}_/g" ../trinity_2/trinity_${SAM}.Trinity.fasta > ../trinity_2/trinity_prefix_${SAM}.Trinity.fasta

# concatenate the assemblies
cat ../trinity_2/trinity_prefix_* > ../trinity_2/trinity_combine.fasta


##################################################
## Determine ORF using Transdecoder		##
##################################################

module load hmmer/3.2.1
module load TransDecoder/5.3.0

TransDecoder.LongOrfs -t ../trinity_2/trinity_combine.fasta

hmmscan --cpu 16 \
       --domtblout pfam.domtblout \
       /isg/shared/databases/Pfam/Pfam-A.hmm \
       trinity_combine.fasta.transdecoder_dir/longest_orfs.pep 

TransDecoder.Predict -t ../trinity_2/trinity_combine.fasta \
	--retain_pfam_hits pfam.domtblout \
	--cpu 16 

