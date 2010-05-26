#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'Catalyst::ActionRole::NotCachableHeaders' ) || print "Bail out!
";
}

diag( "Testing Catalyst::ActionRole::NotCachableHeaders $Catalyst::ActionRole::NotCachableHeaders::VERSION, Perl $], $^X" );
