#!/bin/bash
#Updated on 20201006 by Keyi Geng

#UPPMAX commands
#SBATCH -A UPPMAX_porject_num
#SBATCH -p core
#SBATCH -n 8
#SBATCH -t 4:00:00


#modules
module load bioinfo-tools
module load trimmomatic/0.36
#end of modules

FQ_PATH=/proj/TOP1_project-RNAseq_data/fastq
OUTPUT_PATH=/proj/TOP1_project-RNAseq_data/trim_fastq

cd ${FQ_PATH}
for i in $(ls *_1.fq.gz | sed 's/_1.fq.gz//g'); do \
	java -jar $TRIMMOMATIC_HOME/trimmomatic.jar \
		PE \
		-threads 8\
		-phred33 \
		${i}_1.fq.gz \
		${i}_2.fq.gz \
		${OUTPUT_PATH}/${i}_R1.fq.gz \
		${OUTPUT_PATH}/${i}_unparied_R1.fq.gz \
		${OUTPUT_PATH}/${i}_R2.fq.gz \
		${OUTPUT_PATH}/${i}_unparied_R2.fq.gz \
		HEADCROP:15 \
		TRAILING:5 \
		SLIDINGWINDOW:4:15 \
		MINLEN:50 \
		>>${OUTPUT_PATH}/${i}.trimmomatic.stdout.stderr.txt 2>&1
done
