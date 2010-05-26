package TestApp::Controller::NotCachableWithActionRoles;

use Moose;
BEGIN { extends 'Catalyst::Controller'; }

with 'Catalyst::TraitFor::Controller::ActionRole' => {
    action_roles => ['NotCachableHeaders']
};

sub dont_cache_me  : Local NotCachable {
    my ($self, $c) = @_;
    $c->res->body( join(":", $c->action->name ) );
}

sub no_notcachable  : Local {
    my ($self, $c) = @_;
    $c->res->body( join(":", $c->action->name) );
}

sub own_headers  : Local NotCachable {
    my ($self, $c) = @_;

    $c->response->header( 
        'Expires' =>  'Wed, 26 May 2010 14:14:53 GMT',
        'Cache-Control' => 'public',
        'Last-Modified' => 'Wed, 26 May 2010 14:14:53 GMT',
    );

    $c->res->body( join(":", $c->action->name) );
}

1;
