#!/usr/local/bin/perl

# patscan_batch.pl
# Run patscan on all seqs in a folder
# Can be easily modified to run any command on every sequence in a folder
# WI Biocomputing course - Bioinformatics for Biologists - October 2003

################  User-supplied variables  #############

# Directory of sequences
$myDir = "/home/elvis/seqs";

# Output directory (relative to $myDir or full path)
$outputDir = "patscan";

# Path to pattern file
$patFile = "/home/elvis/patterns/polyA.pat";

#########################################################

# Go to sequence directory and open it (i.e, read contents)
chdir($myDir) || die "Cannot change to $myDir: $!";      # Go to $myDir
opendir(DIR, ".") || die "Cannot open .: $!";      # Open $myDir

foreach $seqFile (sort readdir(DIR))
{
    if ($seqFile =~ /\.tfa$/)      # if file ends in .tfa
    {
        print "Processing $seqFile\n";
        $outFile = $seqFile;         # Create $outFile name
        $outFile =~ s/\.tfa/\.polyA\.out/;      # s/old/new/; 

        ############  Run PATSCAN  ###############
        `scan_for_matches $patFile < $seqFile > $outputDir/$outFile`;
     }
}

		