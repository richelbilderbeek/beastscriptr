#!/bin/bash
# Script for the Groningen Peregrine computer cluster

#SBATCH --time=0:59:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --ntasks=1
#SBATCH --mem=1G
#SBATCH --job-name=test_random_1
#SBATCH --output=sbatch_test_random.log
for i in `seq 1 10`
do
  echo $i
  sbatch test_random_1.sh
  sleep 1
done