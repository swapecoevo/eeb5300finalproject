#!/bin/bash
#SBATCH --job-name=fastqc_raw
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 1
#SBATCH --mem=10G
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=ALL
#SBATCH --mail-user=swapna.subramanian@uconn.edu
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

echo `hostname`

#################################################################
# FASTQC of raw reads 
#################################################################
dir="raw_fastqc"
if [ ! -d "$dir" ]; then
        mkdir -p $dir
fi

module load fastqc/0.11.7
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_P02_S109_L003_R1_001.fastq.gz
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_P02_S109_L003_R2_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_C04_S27_L003_R1_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_C04_S27_L003_R2_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_I09_S157_L003_R1_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_I09_S157_L003_R2_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_C11_S80_L003_R1_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_C11_S80_L003_R2_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_P08_S156_L003_R1_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_P08_S156_L003_R2_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_N04_S123_L003_R1_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_N04_S123_L003_R2_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_O01_S100_L003_R1_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_O01_S100_L003_R2_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_B08_S56_L003_R1_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_B08_S56_L003_R2_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_K04_S120_L003_R1_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_K04_S120_L003_R2_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_J01_S95_L003_R1_001.fastq.gz  
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_J01_S95_L003_R2_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_C07_S49_L003_R1_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_C07_S49_L003_R2_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_N06_S139_L003_R1_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_N06_S139_L003_R2_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_N12_S184_L003_R1_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_N12_S184_L003_R2_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_N10_S170_L003_R1_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_N10_S170_L003_R2_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_P01_S101_L003_R1_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_P01_S101_L003_R2_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_H10_S77_L003_R1_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_H10_S77_L003_R2_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_F01_S6_L003_R1_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_F01_S6_L003_R2_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_J04_S119_L003_R1_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_J04_S119_L003_R2_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_E03_S21_L003_R2_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_E03_S21_L003_R1_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_K12_S181_L003_R1_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_K12_S181_L003_R2_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_F03_S22_L003_R1_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_F03_S22_L003_R2_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_B04_S26_L003_R1_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_B04_S26_L003_R2_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_D02_S12_L003_R1_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_D02_S12_L003_R2_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_O04_S124_L003_R1_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_O04_S124_L003_R2_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_H08_S61_L003_R1_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_H08_S61_L003_R2_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_I11_S173_L003_R1_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_I11_S173_L003_R2_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_G12_S92_L003_R1_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_G12_S92_L003_R2_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_N11_S221_L003_R1_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_N11_S221_L003_R2_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_M04_S122_L003_R1_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_M04_S122_L003_R2_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_L03_S113_L003_R1_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_L03_S113_L003_R2_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_F07_S52_L003_R1_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_F07_S52_L003_R2_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_N02_S107_L003_R1_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_N02_S107_L003_R2_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_B11_S79_L003_R1_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_B11_S79_L003_R2_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_M01_S98_L003_R1_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_M01_S98_L003_R2_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_O06_S140_L003_R1_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_O06_S140_L003_R2_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_T02_S198_L003_R1_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_T02_S198_L003_R2_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_O12_S185_L003_R1_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_O12_S185_L003_R2_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_L12_S182_L003_R1_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_L12_S182_L003_R2_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_C10_S72_L003_R1_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_C10_S72_L003_R2_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_I03_S110_L003_R1_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_I03_S110_L003_R2_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_A03_S17_L003_R1_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_A03_S17_L003_R2_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_K01_S96_L003_R1_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_K01_S96_L003_R2_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_G10_S76_L003_R1_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_G10_S76_L003_R2_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_C05_S33_L003_R1_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_C05_S33_L003_R2_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_I05_S126_L003_R1_001.fastq.gz 
fastqc --outdir ./"$dir"/ ../files/ecar/EJCF002_I05_S126_L003_R2_001.fastq.gz


