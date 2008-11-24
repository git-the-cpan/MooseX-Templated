use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'MooseX::Templated',
    AUTHOR              => 'Ian Sillitoe <isillitoe@cpan.org>',
    VERSION_FROM        => 'lib/MooseX/Templated.pm',
    ABSTRACT_FROM       => 'lib/MooseX/Templated.pm',
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' 	=> '0.86',
   		'File::Slurp'   => '9999.13',
   		'File::Where'   => '1.16',
   		'Moose' 		=> '0.60',
   		'Readonly' 		=> '1.03',
   		'Template'   	=> '2.20',
		'MooseX::AttributeHelpers' => '0.14',
		'Path::Class'   => '0.16',
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'MooseX-Templated-*' },
);
