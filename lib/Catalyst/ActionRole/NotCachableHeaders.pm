package # hide from CPAN
    Catalyst::ActionRole::NotCachableHeaders;

use strict;
use Moose::Role;

sub BUILD {
    die "please use Catalyst::ActionRole::NotCacheableHeaders instead"
       ." (typo in package name)";
}

no Moose::Role;
1; # End of Catalyst::ActionRole::NotCachableHeaders

__END__

=pod

=begin Pod::Coverage

  BUILD

=end Pod::Coverage

=cut


