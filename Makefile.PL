#!/usr/bin/perl -w
# $File: //member/autrijus/Acme-Hello/Makefile.PL $ 
# $Revision: #2 $ $Change: 2773 $ $DateTime: 2002/12/19 03:48:14 $

# This Makefile.PL creates a pass-through Makefile that simply calls
# the equivalent Module::Build methods for each make target.  See the
# documentation for Module::Build::Compat for more information.

unless (eval "use Module::Build::Compat 0.02; 1" ) {
    require ExtUtils::MakeMaker;

    my $yn = '';
    # Check if we're likely to have permission to install Module::Build
    if (-w $INC{'ExtUtils/MakeMaker.pm'}) {
        print "This module requires Module::Build to install itself.\n";

        $yn = ExtUtils::MakeMaker::prompt(
            '  Install Module::Build from CPAN?', 'y'
        );
    }

    if ($yn =~ /^y/i) {
        require Cwd;
        require File::Spec;

        # Save this 'cause CPAN will chdir all over the place.
        my $cwd = Cwd::cwd();
        my $makefile = File::Spec->rel2abs($0);

        if (eval { require CPANPLUS::Backend; 1 }) {
            CPANPLUS::Backend->new->install(
                modules => [ 'Module::Build' ]
            );
        }
        else {
            require CPAN;
            CPAN::Shell->install('Module::Build::Compat');
        }

        chdir $cwd or die "Cannot chdir() back to $cwd: $!";
        exec $^X, $makefile, @ARGV;  # Redo now that we have Module::Build
    } else {
        warn << '.';
This module requires Module::Build to install itself.
Please re-run Makefile.PL with root privilege to install it
automatically from CPAN, or manually download it from:

    http://search.cpan.org/author/KWILLIAMS/Module-Build/

.
        # Leave hints for CPAN.pm and CPANPLUS.pm
        ExtUtils::MakeMaker::WriteMakefile(
            PREREQ_PM   => { 'Module::Build' => 0.11 }
        );

        exit(0);
    }
}

Module::Build::Compat->run_build_pl(args => \@ARGV);
Module::Build::Compat->write_makefile();

__END__
# Local variables:
# c-indentation-style: bsd
# c-basic-offset: 4
# indent-tabs-mode: nil
# End:
# vim: expandtab shiftwidth=4:
