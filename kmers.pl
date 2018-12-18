#!/usr/bin/env perl
# ------------------------------------------------------------------------------
# This is where I'd put my copyright notice...IF I HAD ONE!
# Daniel Standage 2017
# ------------------------------------------------------------------------------

$k = 25;
$/ = ">";

$seqcount = 0;
$kmercount = 0;
while ($line = <STDIN>) {
    chomp($line);
    ($header, @seq) = split(/\n/, $line);
    $sequence = join("", @seq);
    if ($sequence eq "") {
        next;
    }
    for $i (0 .. length($sequence) - $k + 1) {
        $kmer = substr($sequence, $i, $k);
        print("$kmer\n");
        $kmercount++;
    }
    $seqcount++;
}
print(STDERR "Processed $kmercount k-mers in $seqcount sequences\n");
