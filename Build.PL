#!/usr/bin/perl -w

use strict;
use lib './inc';
use Build;

my $m = Build->new(
    dist_name           => 'Acme-Hello',
    dist_version        => '0.03',
    license             => 'perl',
    sign                => 1,

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
