#!/usr/bin/perl -w

use strict;
use warnings;

use FindBin;
use lib $FindBin::Bin . '/lib';

use Plack::Builder;

use TwentyFleet;
builder {
    enable_if { $_[0]->{REMOTE_ADDR} eq '::ffff:127.0.0.1' }
         "Plack::Middleware::ReverseProxy";

    my $app = TwentyFleet->apply_default_middlewares(TwentyFleet->psgi_app);
    $app;
}
