#!/usr/bin/perl -w
# $File: //member/autrijus/Acme-Hello/Makefile.PL $ 
# $Revision: #1 $ $Change: 1382 $ $DateTime: 2002/10/13 07:16:33 $

# This Makefile.PL creates a pass-through Makefile that simply calls
# the equivalent Module::Build methods for each make target.  See the
# documentation for Module::Build::Compat for more information.

unless (eval {
    require Module::Build;
    Module::Build->VERSION >= 0.11
}) {
    # Workaround with old CPAN.pm and CPANPLUS.pm
    require ExtUtils::MakeMaker;
    ExtUtils::MakeMaker::WriteMakefile(
	PREREQ_PM => { 'Module::Build' => 0.11 }
    );
    warn "Warning: prerequisite Module::Build is not found.\n";
    exit(0);
}

require Module::Build::Compat;
Module::Build::Compat->run_build_pl(args => \@ARGV);
Module::Build::Compat->write_makefile;

__END__
# Local variables:
# c-indentation-style: bsd
# c-basic-offset: 4
# indent-tabs-mode: nil
# End:
# vim: expandtab shiftwidth=4:
