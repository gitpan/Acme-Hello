package Acme::Hello::I18N;
$Acme::Hello::I18N::VERSION = '0.02';

use strict;
use vars qw( @ISA %Lexicon );
%Lexicon = ( '_AUTO' => 1 );

=head1 NAME

Acme::Hello::I18N - Localized messages for Acme::Hello

=head1 VERSION

This document describes version 0.02 of B<Acme::Hello::I18N>.

=head1 SYNOPSIS

    use Acme::Hello::I18N;
    my $lh = Acme::Hello::I18N->get_handle;
    $lh->maketext("Hello, world!\n");

=cut

if (eval { require Locale::Maketext; require Locale::Maketext::Lexicon; 1 }) {
    @ISA = 'Locale::Maketext';

    require File::Glob;
    require File::Spec;
    require File::Basename;

    my ($name, $path) = File::Basename::fileparse(__FILE__, '.pm');

    my @languages;
    foreach my $lexicon ( File::Glob::bsd_glob( File::Spec->catfile($path, $name, '*.po')) ) {
        File::Basename::basename($lexicon) =~ /^(\w+).po$/ or next;
        push @languages, $1;
    };

    Locale::Maketext::Lexicon->import( {
        map { lc($_) => [Gettext => "$path$name/$_.po"] } @languages
    } );
}
else {
    @ISA = 'Acme::Hello::I18N::_stub';
}

package Acme::Hello::I18N::_stub;

sub new {
    my ($class, %args) = @_;
    $class = ref($class) if defined(ref $class);

    return bless(\%args, $class);
}

sub maketext {
    my ($self, $str, @params) = @_;

    return $str;
}

1;

__END__

=head1 AUTHORS

Autrijus Tang E<lt>autrijus@autrijus.orgE<gt>

=head1 COPYRIGHT

Copyright 2002, 2005 by Autrijus Tang E<lt>autrijus@autrijus.orgE<gt>.

This program is free software; you can redistribute it and/or 
modify it under the same terms as Perl itself.

See L<http://www.perl.com/perl/misc/Artistic.html>

=cut

# Local variables:
# c-indentation-style: bsd
# c-basic-offset: 4
# indent-tabs-mode: nil
# End:
# vim: expandtab shiftwidth=4:
