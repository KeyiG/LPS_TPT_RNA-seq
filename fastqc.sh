#!/bin/bash
#Updated on 20201006 by Keyi Geng

#UPPMAX commands
#SBATCH -A UPPMAX_porject_num
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 4:00:00


#modules
module load bioinfo-tools
module load FastQC/0.11.9
#end of modules

fastqc *.fq.gz


