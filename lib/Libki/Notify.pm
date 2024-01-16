package Libki::Notify;

=head2 notify_login_via_http

Notifies user login to external system via HTTP.

=cut

sub notify_login_via_http {
    my ( $c, $user, $password, $client) = @_;

    my $instance = $c->instance;
    my $config = $c->config->{instances}->{$instance} || $c->config;

    my $log = $c->log();

    my $user_name = $user->username;
    my $client_name = $client->name;
    my $client_ip = $client->ipaddress;

    $log->debug( __PACKAGE__ . " sending login HTTP notification for user $user_name  with password $password on client $client_name, ip $client_ip" );

}

1;