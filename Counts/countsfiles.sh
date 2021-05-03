#!/bin/bash
#SBATCH --job-name=counts files
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



awk '{print $1 "\t" $4}' ../08_Counts_2/P08_S156/abundance.tsv > P08_S156.counts
awk '{print $1 "\t" $4}' ../08_Counts_2/N04_S123/abundance.tsv > N04_S123.counts
awk '{print $1 "\t" $4}' ../08_Counts_2/O01_S100/abundance.tsv > O01_S100.counts
awk '{print $1 "\t" $4}' ../08_Counts_2/B08_S56/abundance.tsv > B08_S56.counts
awk '{print $1 "\t" $4}' ../08_Counts_2/N06_S139/abundance.tsv > N06_S139.counts
awk '{print $1 "\t" $4}' ../08_Counts_2/N12_S184/abundance.tsv > N12_S184.counts
awk '{print $1 "\t" $4}' ../08_Counts_2/N10_S170/abundance.tsv > N10_S170.counts
awk '{print $1 "\t" $4}' ../08_Counts_2/P01_S101/abundance.tsv > P01_S101.counts
awk '{print $1 "\t" $4}' ../08_Counts_2/E03_S21/abundance.tsv > E03_S21.counts
awk '{print $1 "\t" $4}' ../08_Counts_2/K12_S181/abundance.tsv > K12_S181.counts
awk '{print $1 "\t" $4}' ../08_Counts_2/F03_S22/abundance.tsv > F03_S22.counts

awk '{print $1 "\t" $4}' ../08_Counts_2/B04_S26/abundance.tsv > B04_S26.counts
awk '{print $1 "\t" $4}' ../08_Counts_2/G12_S92/abundance.tsv > G12_S92.counts
awk '{print $1 "\t" $4}' ../08_Counts_2/M04_S122/abundance.tsv > M04_S122.counts
awk '{print $1 "\t" $4}' ../08_Counts_2/L03_S113/abundance.tsv > L03_S113.counts
awk '{print $1 "\t" $4}' ../08_Counts_2/O06_S140/abundance.tsv > O06_S140.counts
awk '{print $1 "\t" $4}' ../08_Counts_2/T02_S198/abundance.tsv > T02_S198.counts
awk '{print $1 "\t" $4}' ../08_Counts_2/O12_S185/abundance.tsv > O12_S185.counts
awk '{print $1 "\t" $4}' ../08_Counts_2/L12_S182/abundance.tsv > L12_S182.counts
awk '{print $1 "\t" $4}' ../08_Counts_2/G10_S76/abundance.tsv > G10_S76.counts
awk '{print $1 "\t" $4}' ../08_Counts_2/C05_S33/abundance.tsv > C05_S33.counts
awk '{print $1 "\t" $4}' ../08_Counts_2/I05_S126/abundance.tsv > I05_S126.counts
