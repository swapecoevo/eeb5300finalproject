#!/bin/bash
#SBATCH --job-name=index
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 1
#SBATCH --mem=20G
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=ALL
##SBATCH --mail-user=swapna.subramanian@uconn.edu
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

hostname
date

##########################################
## Creating an Index			##	
##########################################

module load kallisto/0.44.0

kallisto index -i ../05_Clustering/centroids.fasta.index ../05_Clustering/centroids.fasta

date 

