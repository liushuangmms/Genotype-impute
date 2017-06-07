#!/bin/bash
#$ -cwd

CHR=$1
CHUNK_START=`printf "%.0f" $2`
CHUNK_END=`printf "%.0f" $3`

# directories
ROOT_DIR=/home/sl857/testdata/
DATA_DIR=${ROOT_DIR}CMC_gen/
RESULTS_DIR=${ROOT_DIR}CMC_res_ph1_test/
REF_DIR=/home/sl857/software/1kp_phase1/ALL.integrated_phase1_SHAPEIT_16-06-14.nosing/

IMPUTE2_EXEC=/home/sl857/software/impute_v2.3.2_x86_64_static/impute2

NE=20000

#GENMAP_FILE=/home/sl857/software/1kp/1000GP_Phase3/genetic_map_chr${CHR}_combined_b37.txt
#HAPS_FILE=/home/sl857/software/1kp/1000GP_Phase3/1000GP_Phase3_chr${CHR}.hap.gz
#LEGEND_FILE=/home/sl857/software/1kp/1000GP_Phase3/1000GP_Phase3_chr${CHR}.legend.gz

GENMAP_FILE=${REF_DIR}genetic_map_chr${CHR}_combined_b37.txt
HAPS_FILE=${REF_DIR}ALL.chr${CHR}.integrated_phase1_v3.20101123.snps_indels_svs.genotypes.nosing.haplotypes.gz
LEGEND_FILE=${REF_DIR}ALL.chr${CHR}.integrated_phase1_v3.20101123.snps_indels_svs.genotypes.nosing.legend.gz
 
GWAS_HAPS_FILE=${RESULTS_DIR}chr${CHR}.haps
 
# main output file
OUTPUT_FILE=${RESULTS_DIR}CMC_data_chr${CHR}.pos${CHUNK_START}-${CHUNK_END}.impute2
 
## impute genotypes from CMC haplotypes
$IMPUTE2_EXEC \
   -m $GENMAP_FILE \
   -known_haps_g $GWAS_HAPS_FILE \
   -h $HAPS_FILE \
   -l $LEGEND_FILE \
   -Ne $NE \
   -int $CHUNK_START $CHUNK_END \
   -o $OUTPUT_FILE \
   -allow_large_regions \
   -seed 367946
