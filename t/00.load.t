use Test::More tests => 2;

BEGIN {
use_ok( 'MooseX::Templated::Role' );
use_ok( 'MooseX::Templated::View' );
}

diag( "Testing MooseX::Templated $MooseX::Templated::Role::VERSION" );
