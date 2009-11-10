use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'MojoX::Renderer::HTC',
    AUTHOR              => q{Renee Baecker <module@renee-baecker.de>},
    VERSION_FROM        => 'lib/MojoX/Renderer/HTC.pm',
    ABSTRACT_FROM       => 'lib/MojoX/Renderer/HTC.pm',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'MojoX::Renderer::HTC-*' },
);
