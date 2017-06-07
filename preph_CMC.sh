#!/bin/bash
#$ -cwd
 
CHR=$1
 
# directories
#ROOT_DIR=/home/sl857/testdata/
ROOT_DIR=$2
DATA_DIR=${ROOT_DIR}CMC_gen/
RESULTS_DIR=${ROOT_DIR}CMC_res_ph1_test/

THREAD=4

#GENMAP_FILE=/home/sl857/software/1kp/1000GP_Phase3/genetic_map_chr${CHR}_combined_b37.txt
GENMAP_FILE=/home/sl857/software/1kp_phase1/ALL.integrated_phase1_SHAPEIT_16-06-14.nosing/genetic_map_chr${CHR}_combined_b37.txt

# GWAS data files in PLINK BED format
GWASDATA_BED=${DATA_DIR}CMC_gen_chr${CHR}.bed
GWASDATA_BIM=${DATA_DIR}CMC_gen_chr${CHR}.bim
GWASDATA_FAM=${DATA_DIR}CMC_gen_chr${CHR}.fam

OUTPUT_HAPS=${RESULTS_DIR}chr${CHR}.haps
OUTPUT_SAMPLE=${RESULTS_DIR}chr${CHR}.sample
OUTPUT_LOG=${RESULTS_DIR}chr${CHR}.log

shapeit \
--input-bed $GWASDATA_BED $GWASDATA_BIM $GWASDATA_FAM \
--input-map $GENMAP_FILE \
--thread $THREAD \
--output-max $OUTPUT_HAPS $OUTPUT_SAMPLE \
--output-log $OUTPUT_LOG
