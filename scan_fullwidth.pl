#!/usr/bin/perl

use Encode qw(decode encode);
use I18N::Langinfo qw(langinfo CODESET);

my $codeset = langinfo(CODESET);
@ARGV = map { decode $codeset, $_ } @ARGV;

my ($input_str) = @ARGV;
unless (defined $input_str) {
	print "Error: No input string!\n";
	print "Usage: scan_fullwidth.pl <INPUT_STR>\n";
	exit 1;
}

my @fullwidth_letters = ('a3e1', 'a3e2', 'a3e3', 'a3e4', 'a3e5', 'a3e6', 'a3e7', 'a3e8', 'a3e9', 'a3ea', 'a3eb', 'a3ec', 'a3ed', 'a3ee', 'a3ef', 'a3f0', 'a3f1', 'a3f2', 'a3f3', 'a3f4', 'a3f5', 'a3f6', 'a3f7', 'a3f8', 'a3f9', 'a3fa', 'a3c1', 'a3c2', 'a3c3', 'a3c4', 'a3c5', 'a3c6', 'a3c7', 'a3c8', 'a3c9', 'a3ca', 'a3cb', 'a3cc', 'a3cd', 'a3ce', 'a3cf', 'a3d0', 'a3d1', 'a3d2', 'a3d3', 'a3d4', 'a3d5', 'a3d6', 'a3d7', 'a3d8', 'a3d9', 'a3da');

foreach (@fullwidth_letters) {
	my $char = decode('cp936', pack('H*', $_));
	if (index($input_str, $char) != -1) {
		print "Found!\n";
		exit 2;
	}
}

print "Not found.\n";
