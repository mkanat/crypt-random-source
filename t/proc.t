#!/usr/bin/perl

use strict;
use warnings;

use Test::More 'no_plan';
use Test::Exception;

use ok 'Crypt::Random::Source::Base::Proc';

{
	my $p = Crypt::Random::Source::Base::Proc->new( command => [qw( echo foo bar )] );

	is( $p->get(3), 'foo', "got data" );

	throws_ok { $p->get(50) } qr/enough bytes/, "not having enough data is fatal";
}
