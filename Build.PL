#!/usr/bin/perl -w
# $File: //member/autrijus/Acme-Hello/Build.PL $ 
# $Revision: #1 $ $Change: 1382 $ $DateTime: 2002/10/13 07:16:33 $

use strict;
use Build;

my $m = Build->new(
    dist_name           => 'Acme-Hello',
    dist_version        => '0.01',
    license             => 'perl',

    recommends          => {
	'Locale::Maketext'          => '0.20',
	'Locale::Maketext::Lexicon' => '0.08',
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
