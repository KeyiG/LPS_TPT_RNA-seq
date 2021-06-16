#!/bin/bash
#Made by Keyi
#Made on 2020-03-01, adapted 2020-12-30

#UPPMAX commands
#SBATCH -A UPPMAX_proj_num
#SBATCH -p core
#SBATCH -n 8
#SBATCH -t 15:00:00
#SBATCH -J salmon_TOP1
#SBATCH --output=salmon_201230.out
#SBATCH --error=salmon_201230.err

module load bioinfo-tools
module load Salmon/1.1.0

FQ_PATH=/proj/TOP1_project-RNAseq_data/trim_fastq
REF=/proj/TOP1_project-RNAseq_data/reference_genome
OUTPUT=/proj/TOP1_project-RNAseq_data/salmon_quanti

#download mouse reference transcripts fasta file
cd ${REF}
wget ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_mouse/release_M25/gencode.vM25.transcripts.fa.gz

#index reference
salmon index -p 8 -t ${REF}/gencode.vM25.transcripts.fa.gz -i ${OUTPUT}/gencode.vM25.transcripts.fa.gz_index -k 31

cd ${FQ_PATH}
for i in $(ls *_R1.fq.gz | sed 's/_R1.fq.gz//g'); do \
	salmon quant -p 8 -i ${OUTPUT}/gencode.vM25.transcripts.fa.gz_index -l A -1 ${i}_R1.fq.gz -2 ${i}_R2.fq.gz --validateMappings -o ${OUTPUT}/${i}_quant
done





