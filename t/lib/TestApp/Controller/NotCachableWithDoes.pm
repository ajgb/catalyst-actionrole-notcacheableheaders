package TestApp::Controller::NotCachableWithDoes;

use Moose;
BEGIN { extends 'Catalyst::Controller'; }
with 'Catalyst::TraitFor::Controller::ActionRole';

sub dont_cache_me  : Local Does('NotCachableHeaders') NotCachable {
    my ($self, $c) = @_;
    $c->res->body( join(":", $c->action->name ) );
}

sub no_notcachable  : Local {
    my ($self, $c) = @_;
    $c->res->body( join(":", $c->action->name) );
}

sub own_headers  : Local Does('NotCachableHeaders') NotCachable {
    my ($self, $c) = @_;

    $c->response->header( 
        'Expires' =>  'Wed, 26 May 2010 14:14:53 GMT',
        'Cache-Control' => 'public',
        'Last-Modified' => 'Wed, 26 May 2010 14:14:53 GMT',
    );

    $c->res->body( join(":", $c->action->name) );
}

1;
