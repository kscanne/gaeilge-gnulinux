#!/usr/bin/perl

use strict;
use warnings;
use Locale::PO;

if (@ARGV == 0) {
	die "Usage: $0 POFILES\n";
}

my @rules;   # array of hash refs

open (DEPRECATED, '/home/kps/gaeilge/gnu/gnu/deprecated.txt') or die "Could not open list of deprecated terms: $!\n";

while(<DEPRECATED>) {
	unless (/^#/) {
		chomp;
		my ($eng,$dep,$pref,$enpatt,$gapatt) = m/^(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)/;
		$eng =~ s/_/ /g;
		$dep =~ s/_/ /g;
		$pref =~ s/_/ /g;
		push @rules, {
				'english' => $eng,
				'deprecated' => $dep,
				'preferred' => $pref,
				'english_pattern' => qr/$enpatt/i,
				'irish_pattern' => qr/$gapatt/i,
				};
	}
}

sub my_warn
{
return 1;
}

while ($ARGV = shift @ARGV) {
	my $aref;
{
	local $SIG{__WARN__} = 'my_warn';
	$aref = Locale::PO->load_file_asarray($ARGV);
}
	print "Checking PO file $ARGV for deprecated translations...\n";
	foreach my $msg (@$aref) {
		my $id = $msg->msgid();
		my $str = $msg->msgstr();
		if (defined($id) && defined($str)) {
			if ($str and $id) {
				$id =~ s/^"_: .*\\n//;
				foreach my $rule (@rules) {
					my $searchid = $id;
					my $searchstr = $str;
					$searchid =~ s/[~&]//g;
					$searchstr =~ s/[~&]//g;
					my $en = $rule->{'english_pattern'};
					my $ga = $rule->{'irish_pattern'};
					if ($searchid =~ m/$en/ and $searchstr =~ m/$ga/) {
						print "Found deprecated term \"$rule->{'deprecated'}\" as a translation of \"$rule->{'english'}\"\n\tmsgid=$id\n\tmsgstr=$str\n\tYou should use \"$rule->{'preferred'}\" instead\n\n";
					}
				}
			}
		}
	}
}

exit 0;
