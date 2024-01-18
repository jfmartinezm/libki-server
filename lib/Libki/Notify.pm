package Libki::Notify;

use strict;
use warnings;

use LWP::UserAgent;

=head2 notify_login_via_http

Notifies user login to external system via HTTP.

=cut

sub notify_login_via_http {
    my ( $c, $user, $password, $client) = @_;

    my $instance = $c->instance;
    my $config = $c->config->{instances}->{$instance} || $c->config;

    my $log = $c->log();

    my $notify_url = "http://kroki:8080/libki/login";

    my $user_name = $user->username;
    my $client_name = $client->name;
    my $client_ip = $client->ipaddress;

    $log->debug( __PACKAGE__ . " sending login HTTP notification for user $user_name  with password $password on client $client_name, ip $client_ip" );

    my $ua       = LWP::UserAgent->new();
    my $response = $ua->post( $notify_url, { 
        'username' => $user_name, 
        'password' => $password,
        'ipaddress' => $client_ip} );

    if ($response->is_success) {
        my $content  = $response->decoded_content();
        $log->debug( __PACKAGE__ . " HTTP notification response: $content" );
    }
    else {
        my $status = $response->status_line;
        $log->debug( __PACKAGE__ . " HTTP notification error: $status" );
    }
    
}

1;