package FireCracker::Handler::EmbedCodeHandler;
use strict;
use warnings;
use Tatsumaki;
use Tatsumaki::Error;
use Tatsumaki::Application;
use Time::HiRes;
use Carp ();

use base qw(Tatsumaki::Handler);

sub get {
    my($self, $embed_code) = @_;

    $self->response->content_type( 'text/html; charset=UTF-8' );
    $self->response->body( [ $self->get_slide( $embed_code ) ] );

    $self->finish;
}

sub get_slide {
    my($self, $embed_code) = @_;

    my $agent = $self->application->get( 'Furl' ); 
    my $res = $agent->get( 'http://www.slideshare.net/slideshow/embed_code/'. $embed_code );
    Carp::croak $res->status_line unless $res->is_success;

    return $res->content;
}

1;
