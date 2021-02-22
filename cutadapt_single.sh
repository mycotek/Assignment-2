#!/bin/bash
#SBATCH --account=PAS1855
#SBATCH --time=20:00
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --ntasks=1

set -e -u -o pipefail

module load python/3.6-conda5.2
source activate cutadapt-env