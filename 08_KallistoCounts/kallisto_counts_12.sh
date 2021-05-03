#!/bin/bash
#SBATCH --job-name=counts
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 8
#SBATCH --mem=30G
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --array=[0-5]
##SBATCH --mail-type=ALL
##SBATCH --mail-user=swapna.subramanian@uconn.edu
#SBATCH -o %x_%A_%a.out
#SBATCH -e %x_%A_%a.err

hostname
date

##########################################
## kallisto quantification algorithm	##	
##########################################

module load kallisto/0.44.0

# this is an array job. SLURM will run this script 6 times in parallel (#SBATCH --array=[0-5]) contingent on resource availability
	# each time SLURM will change the value of the variable SLURM_ARRAY_TASK_ID
	# we'll use a bash array and that variable to retrieve a different sample

# a bash array containing the sample IDs
LIST=($(echo N12_S184 N10_S170 P01_S101 E03_S21 K12_S181 F03_S22))

# get one sample ID using the slurm array task ID
SAM=${LIST[$SLURM_ARRAY_TASK_ID]}

kallisto quant \
	-i ../05_Clustering/centroids.fasta.index \
	-o ${SAM} \
	-t 8 \
	../trim/EJCF002_${SAM}_L003_R1_001_pair.fastq.gz  ../trim/EJCF002_${SAM}_L003_R2_001_pair.fastq.gz

date 

