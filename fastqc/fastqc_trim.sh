#!/bin/bash
#SBATCH --job-name=fastqc_trimmed
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 8
#SBATCH --mem=10G
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=ALL
#SBATCH --mail-user=swapna.subramanian@uconn.edu
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

echo `hostname`

#################################################################
# FASTQC of trim reads
#################################################################
dir="fastqc_trim"
if [ ! -d "$dir" ]; then
        mkdir -p $dir
fi

module load fastqc/0.11.7

fastqc --threads 8 --outdir ./$dir/ ../trim/EJCF002_P02_S109_L003_R1_001_pair.fastq.gz ../trim/EJCF002_P02_S109_L003_R2_001_pair.fastq.gz
fastqc --threads 8 --outdir ./$dir/ ../trim/EJCF002_P08_S156_L003_R1_001_pair.fastq.gz ../trim/EJCF002_P08_S156_L003_R2_001_pair.fastq.gz
fastqc --threads 8 --outdir ./$dir/ ../trim/EJCF002_N04_S123_L003_R1_001_pair.fastq.gz ../trim/EJCF002_N04_S123_L003_R2_001_pair.fastq.gz
fastqc --threads 8 --outdir ./$dir/ ../trim/EJCF002_O01_S100_L003_R1_001_pair.fastq.gz ../trim/EJCF002_O01_S100_L003_R2_001_pair.fastq.gz
fastqc --threads 8 --outdir ./$dir/ ../trim/EJCF002_B08_S56_L003_R1_001_pair.fastq.gz ../trim/EJCF002_B08_S56_L003_R2_001_pair.fastq.gz
fastqc --threads 8 --outdir ./$dir/ ../trim/EJCF002_N06_S139_L003_R1_001_pair.fastq.gz ../trim/EJCF002_N06_S139_L003_R2_001_pair.fastq.gz
fastqc --threads 8 --outdir ./$dir/ ../trim/EJCF002_N12_S184_L003_R1_001_pair.fastq.gz ../trim/EJCF002_N12_S184_L003_R2_001_pair.fastq.gz
fastqc --threads 8 --outdir ./$dir/ ../trim/EJCF002_N10_S170_L003_R1_001_pair.fastq.gz ../trim/EJCF002_N10_S170_L003_R2_001_pair.fastq.gz
fastqc --threads 8 --outdir ./$dir/ ../trim/EJCF002_P01_S101_L003_R1_001_pair.fastq.gz ../trim/EJCF002_P01_S101_L003_R2_001_pair.fastq.gz
fastqc --threads 8 --outdir ./$dir/ ../trim/EJCF002_E03_S21_L003_R2_001_pair.fastq.gz ../trim/EJCF002_E03_S21_L003_R1_001_pair.fastq.gz
fastqc --threads 8 --outdir ./$dir/ ../trim/EJCF002_K12_S181_L003_R1_001_pair.fastq.gz ../trim/EJCF002_K12_S181_L003_R2_001_pair.fastq.gz
fastqc --threads 8 --outdir ./$dir/ ../trim/EJCF002_F03_S22_L003_R1_001_pair.fastq.gz ../trim/EJCF002_F03_S22_L003_R2_001_pair.fastq.gz
fastqc --threads 8 --outdir ./$dir/ ../trim/EJCF002_B04_S26_L003_R1_001_pair.fastq.gz ../trim/EJCF002_B04_S26_L003_R2_001_pair.fastq.gz
fastqc --threads 8 --outdir ./$dir/ ../trim/EJCF002_G12_S92_L003_R1_001_pair.fastq.gz ../trim/EJCF002_G12_S92_L003_R2_001_pair.fastq.gz
fastqc --threads 8 --outdir ./$dir/ ../trim/EJCF002_N11_S221_L003_R1_001_pair.fastq.gz ../trim/EJCF002_N11_S221_L003_R2_001_pair.fastq.gz
fastqc --threads 8 --outdir ./$dir/ ../trim/EJCF002_M04_S122_L003_R1_001_pair.fastq.gz ../trim/EJCF002_M04_S122_L003_R2_001_pair.fastq.gz
fastqc --threads 8 --outdir ./$dir/ ../trim/EJCF002_L03_S113_L003_R1_001_pair.fastq.gz ../trim/EJCF002_L03_S113_L003_R2_001_pair.fastq.gz
fastqc --threads 8 --outdir ./$dir/ ../trim/EJCF002_O06_S140_L003_R1_001_pair.fastq.gz ../trim/EJCF002_O06_S140_L003_R2_001_pair.fastq.gz
fastqc --threads 8 --outdir ./$dir/ ../trim/EJCF002_T02_S198_L003_R1_001_pair.fastq.gz ../trim/EJCF002_T02_S198_L003_R2_001_pair.fastq.gz
fastqc --threads 8 --outdir ./$dir/ ../trim/EJCF002_O12_S185_L003_R1_001_pair.fastq.gz ../trim/EJCF002_O12_S185_L003_R2_001_pair.fastq.gz
fastqc --threads 8 --outdir ./$dir/ ../trim/EJCF002_L12_S182_L003_R1_001_pair.fastq.gz ../trim/EJCF002_L12_S182_L003_R2_001_pair.fastq.gz
fastqc --threads 8 --outdir ./$dir/ ../trim/EJCF002_G10_S76_L003_R1_001_pair.fastq.gz ../trim/EJCF002_G10_S76_L003_R2_001_pair.fastq.gz
fastqc --threads 8 --outdir ./$dir/ ../trim/EJCF002_C05_S33_L003_R1_001_pair.fastq.gz ../trim/EJCF002_C05_S33_L003_R2_001_pair.fastq.gz
fastqc --threads 8 --outdir ./$dir/ ../trim/EJCF002_I05_S126_L003_R1_001_pair.fastq.gz ../trim/EJCF002_I05_S126_L003_R2_001_pair.fastq.gz


