#!/bin/bash
#SBATCH --account=PAS1855
#SBATCH --time=20:00
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --ntasks=1

set -e -u -o pipefail

module load python/3.6-conda5.2
source activate cutadapt-env

fastq_file_forward="$1"
output_dir="$2"
forward_primer="$3"
reverse_primer="$4"

primer_f_rc=$(echo "$forward_primer" | tr ATCGYRKMBVDH TAGCRYMKVBHD | rev)
primer_r_rc=$(echo "$reverse_primer" | tr ATCGYRKMBVDH TAGCRYMKVBHD | rev)


fastq_file_reverse="$(dirname "$fastq_file_forward")/$(basename -s ".fastq" "$fastq_file_forward" | sed -e 's/_R1_/_R2_/').fastq"
echo "Reverse file is $fastq_file_reverse"


fastq_file_forward_output="$output_dir/$(basename -s ".fastq" "$fastq_file_forward")_trimmed.fastq"
fastq_file_reverse_output="$output_dir/$(basename -s ".fastq" "$fastq_file_reverse")_trimmed.fastq"
echo "Forward output path is $fastq_file_forward_output"
echo "Reverse output path is $fastq_file_reverse_output"