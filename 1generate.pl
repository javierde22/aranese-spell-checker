#!/usr/bin/perl
binmode (STDOUT, ":utf8");

use strict;
use warnings;

my $main_directory = './diccionari';
my $output_directory = './fitxers';
my $dictionary_file = 'oc_ES1.dic';
my $dictionary_file2 = 'oc_ES.dic';
my $output_path = "$output_directory/$dictionary_file";
my $output_path2 = "$output_directory/$dictionary_file2";
my $num_rows = '';

opendir(DIR, $main_directory) or die $!;
print "ARANESE ASPELL DICTIONARY\n\n";
print "BY Javier Torres Fdz. - www.occitans.com\n\n";
print "Opening the source files\n";
open(FH1, '>:encoding(UTF-8)', "$output_path");

while (my $main_files = readdir(DIR)) {
        next if ($main_files =~ m/^\./);
        print "Processing the folder: $main_files\n";

        opendir(DIR2, "$main_directory/$main_files") or die $!;
		while (my $content_files = readdir(DIR2)) {

		next if ($content_files =~ m/^\./);

		print "\tFile: $content_files\n";
		#open(my $fh, '<:encoding(UTF-8)', $filename)
		open(FH2, '<:encoding(UTF-8)', "$main_directory/$main_files/$content_files");
		 foreach my $line (<FH2>) {
        		chomp($line);
           		next if $line =~ /^\s*\#/;
           		print FH1 "$line\n";
           		#print "\t\t$line\n"
           	}
           	
           	close(FH2);

		}
	closedir(DIR2);

	
}
#$count = $.

close(FH1);
open(FH4, '>:encoding(UTF-8)', "$output_path2");
	open(FH3, '<:encoding(UTF-8)', "$output_path");
	foreach my $line2 (<FH3>){
		chomp($line2);		
		}
		print("Total rows: $.\n");
		#$num_row = $.
	
	print(FH4 "$.\n");
	close(FH3);
	open(FH5, '<:encoding(UTF-8)', "$output_path");
	foreach my $line2 (<FH5>){
		chomp($line2);	
		print(FH4 "$line2\n");	
		}
		
	close(FH5);
close(FH4);

closedir(DIR);
exit 0;

