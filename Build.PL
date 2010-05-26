use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'Catalyst::ActionRole::NotCachableHeaders',
    license             => 'perl',
    dist_author         => q{Alex J. G. Burzyński <ajgb@cpan.org>},
    dist_version_from   => 'lib/Catalyst/ActionRole/NotCachableHeaders.pm',
    dist_abstract       => 'Set no cache headers for actions',
    add_to_cleanup      => [ 'Catalyst-ActionRole-NotCachableHeaders-*' ],
    create_makefile_pl => 'traditional',
    create_license      => 1,
    build_requires => {
        'Test::More' => 0,
        'DateTime' => 0,
        'DateTime::Format::DateParse' => '0.05',
    },
    requires => {
        'Catalyst::TraitFor::Controller::ActionRole' => 0,
        'Moose' => '1.00',
        'HTTP::Date' => '5.831',
    },
);

$builder->create_build_script();
