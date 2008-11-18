use Test::More tests => 8;

use strict;
use warnings;
use FindBin;
use File::Slurp;

use lib $FindBin::Bin . '/lib';
use Farm::Cow;

my @view_public_methods = qw(
    render
    set_source
    get_source
    engine
    engine_class
    engine_config
    build_src_path
    module
    template_src_base
    template_src_ext
);

my $cow = Farm::Cow->new( spots => 4 );

isa_ok( my $view = $cow->template_view, 'MooseX::Templated::View::TT', 
    'templated_view' );

can_ok( $view, @view_public_methods );

is( $cow->render, "This cow has 4 spots and goes Moooooooo!\n",
    'default render' );

my $alt_ext  = '.tt2';
my $alt_path = $FindBin::Bin . '/tt2_src';
my $alt_file = $alt_path . "/Farm/Cow.tt2";
my $alt_src  = read_file( $alt_file );

is( $view->build_src_path( base => $alt_path, ext => $alt_ext), 
    $alt_file,
    'default render' );

$alt_file = $alt_path . "/Farm/AltCow.tt2";
$alt_src  = read_file( $alt_file );

is( $view->set_source( $alt_file ),
    $alt_src, 
    'set source (from file)' );

isa_ok( $view->engine, 'Template', 'engine');
is    ( $view->engine_class, 'Template', 'engine class');
isa_ok( $view->module, 'Farm::Cow', 'module');


