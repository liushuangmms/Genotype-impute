#!/usr/bin/perl

# 2010-11-11 
# (c) Stephen Turner
# http://GettingGeneticsDone.blogspot.com/
# http://www.stephenturner.us/

# This script takes as input the base filename of binary pedfiles (*.bed, 
# *.bim, *.fam) and a base output filename and splits up a dataset by 
# chromosome. Useful for imputing to 1000 genomes. 


chomp(my $pwd = `pwd`);
my $help = "\nUsage: $0 <BEDfile base> <output base>\n\n";
die $help if @ARGV!=2;

$infile_base=$ARGV[0]; #base filename of inputs
$outfile_base=$ARGV[1]; #base filename of outputs
$plink_exec="plink --nonfounders --allow-no-sex --noweb";
$chr=22; #last chromosome to write out


for (1..$chr) {
	print "Processing chromosome $_\n";
	`$plink_exec --bfile $infile_base --chr $_ --make-bed --out ${outfile_base}$_;`
}

