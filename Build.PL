#!/usr/bin/perl -w
# $File: //member/autrijus/Acme-Hello/Build.PL $ 
# $Revision: #2 $ $Change: 2770 $ $DateTime: 2002/12/19 03:18:33 $

use strict;
use lib './inc';
use Build;

my $m = Build->new(
    dist_name           => 'Acme-Hello',
    dist_version        => '0.02',
    license             => 'perl',

    recommends          => {
	'Locale::Maketext'          => '0.20',
	'Locale::Maketext::Lexicon' => '0.15',
    },

    requires            => {
	'perl' => '5.005',
    },
);

$m->create_build_script;

__END__
# Local variables:
# c-indentation-style: bsd
# c-basic-offset: 4
# indent-tabs-mode: nil
# End:
# vim: expandtab shiftwidth=4:
