package Catalyst::ActionRole::NotCachableHeaders;

use Moose::Role;
use HTTP::Date qw(time2str);
use namespace::autoclean;

our $VERSION = '0.01';

=encoding utf8

=head1 NAME

Catalyst::ActionRole::NotCachableHeaders - Set no cache headers for actions   

=head1 SYNOPSIS

    package MyApp::Controller::Foo;

    BEGIN { extends 'Catalyst::Controller'; }

    with 'Catalyst::TraitFor::Controller::ActionRole' => {
        action_roles => ['NotCachableHeaders'],
    };

    sub dont_cache_me : Local NotCachable { ... }


=head1 DESCRIPTION

Provides a ActionRole to set HTTP headers instructing proxies and browsers to
not cache the response.

    Pragma: no-cache
    Cache-Control: no-cache
    Expires: Thu, 01 Jan 1970 00:00:00 GMT
    Last-Modified: %current time%

Please note that if any of above headers were already set they will be
overwritten.

=head1 AUTHOR

Alex J. G. Burzyński, C<< <ajgb at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-catalyst-actionrole-notcachableheaders at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Catalyst-ActionRole-NotCachableHeaders>. 
I will be notified, and then you'll automatically be notified of progress
on your bug as I make changes.


=head1 LICENSE AND COPYRIGHT

Copyright 2010 Alex J. G. Burzyński.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.

=cut

around 'execute' => sub {
    my $orig = shift;
    my $self = shift;
    my ($controller, $c, @args) = @_;

    my $action = $self->$orig($controller, $c, @args);

    if ( exists $c->action->attributes->{NotCachable} ) {
        $c->response->header( 
            'Expires' =>  'Thu, 01 Jan 1970 00:00:00 GMT',
            'Pragma' => 'no-cache',
            'Cache-Control' => 'no-cache',
            'Last-Modified' => time2str( time ),
        );
    }

    return $action;
};


no Moose::Role;
1; # End of Catalyst::ActionRole::NotCachableHeaders

