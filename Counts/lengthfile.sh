#!/bin/bash
#SBATCH --job-name=length
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 8
#SBATCH --mem=30G
#SBATCH --partition=general
#SBATCH --qos=general
##SBATCH --mail-type=ALL
##SBATCH --mail-user=swapna.subramanian@uconn.edu
#SBATCH -o %x_%A_%a.out
#SBATCH -e %x_%A_%a.err

hostname
Date



awk '{print $1 "\t" $2}' ../08_Counts_2/P08_S156/abundance.tsv > length.txt
