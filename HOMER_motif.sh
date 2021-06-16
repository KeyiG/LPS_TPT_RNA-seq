#!/bin/bash
#made on 2020.07.13, by Keyi
#UPPMAX commands
#SBATCH -A UPPMAX_proj_num
#SBATCH -p core
#SBATCH -n 8
#SBATCH -t 02:00:00
#SBATCH -J DEgene_motif
#SBATCH --output=DEgene_motif_210305.out
#SBATCH --error=DEgene_motif_210305.err

module load bioinfo-tools
module load HOMER/4.11


findMotifs.pl TvsL_edgeR_DEgenename.txt mouse TvsL_edgeR/ -start -2000 -end 500 -len 8,10 -p 8 
