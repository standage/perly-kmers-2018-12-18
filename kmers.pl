#!/usr/bin/env perl
# ------------------------------------------------------------------------------
# This is where I'd put my copyright notice...IF I HAD ONE!
# Daniel Standage 2017-2018
# ------------------------------------------------------------------------------
use strict;

my $k = 25;
$/ = ">";

my $seqcount = 0;
my $kmercount = 0;
while (my $line = <STDIN>) {
    chomp($line);
    my ($header, @seq) = split(/\n/, $line);
    my $sequence = join("", @seq);
    if ($sequence eq "") {
        next;
    }
    for my $i (0 .. length($sequence) - $k + 1) {
        my $kmer = substr($sequence, $i, $k);
        print("$kmer\n");
        $kmercount++;
    }
    $seqcount++;
}
print(STDERR "Processed $kmercount k-mers in $seqcount sequences\n");
