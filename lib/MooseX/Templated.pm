package MooseX::Templated;

use strict;
use Carp;

croak "Nothing here - try MooseX::Templated::Role";

=head1 NAME

MooseX::Templated - Template framework for Moose objects

=head1 SYNOPSIS

Farm/Cow.pm

    package Farm::Cow;
    use Moose;
    with 'MooseX::Templated::Role';

    has 'spots'   => ( is => 'rw' );
    has 'hobbies' => ( is => 'rw', default => sub { ['mooing', 'chewing'] } );

    sub moo { "Moooooooo!" }

Farm/Cow.tt

    This cow has [% self.spots %] spots - it likes
    [% self.hobbies.join(" and ") %]. 
    [% self.moo %]!

Elsewhere on the Farm...

    my $cow = Farm::Cow->new( spots => '8' );
    
    $cow->render();
    
    # This cow has 8 spots - it likes
    # mooing and chewing.
    # Moooooooo!

=head1 INTERFACE

This module contains no code to speak of - it is just here to provide an obvious root document for the rest of the project.

If you're looking for more details on the interface available for rendering your Moose object with templates then you are probably looking for:

    L<MooseX::Templated::Role>

If you are interested in looking under the bonnet or implementing your own templating engine then you probably want to have a look at:

    L<MooseX::Templated::View>

The rest of this document is a general ramble about the motivation for this project and why it may be useful.


=head1 DISCUSSION

=head2 What this module aims to be

The intention of this module is to provide a quick and simple framework
to glue all things good about Moose to all things sensible about using
templates to separate your internals from your display logic.

It makes some guesses about what your templates are called and where
they live and going along with those defaults should get you up and 
running within a couple lines of code.

If you don't want to go with those default suggestions then the intention 
is to provide enough flexible to fit in with your setup with the minimum of 
fuss (if not, then patches/suggestions are always welcome).

=head2 What this module doesn't aim to be

This module is not intended to be an attempt at a MVC framework.

If you haven't heard of L<Catalyst> then go have a look.

=head2 Why using templates is a Good Thing

If you're sufficiently enlightened to be using Moose then this section 
is most probably redundant. I've included here because it seemed like 
the right thing to do.

So, most applications can be broken down into the following three steps.

    +------------+    +--------------+    +-------------+
    | Input Data | -> | Process Data | -> | Output Data |
    +------------+    +--------------+    +-------------+

Providing a clear separation between these components makes creating 
and maintaining your application much more simple in the long term.

Let's say you've been asked to maintain an application
where the B<Output Data> stage of the code has been implemented by scattering
a bunch of print statements at various points throughout the B<Process Data> 
stage. 

Now lets say that you've been asked to 
change the output format (e.g. from say tab- to comma-delimited format).
Your application doesn't have to be terribly big or complicated before 
maintaining this code rapidly becomes a find-and-replace nightmare. 
Even worse, adding and supporting new output formats
will probably make you want to seek alternative employment.

Now there are plenty of ways that this code could be refactored to make this
situation more sane (after all this is Perl so TIMTOWTDI). This
module attempts to make it as easy as possible to keep a healthy 
separation between the internals of your application and how your
application data is displayed.

=head1 SEE ALSO

L<Moose>

Please report any bugs or feature requests to
C<bug-moosex-templated@rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org>.


=head1 AUTHOR

Ian Sillitoe  C<< <isillitoe@cpan.org> >>

Chris Prather C<< <perigrin@cpan.org> >>

=head1 LICENCE AND COPYRIGHT

Copyright (c) 2008, Ian Sillitoe C<< <isillitoe@cpan.org> >>. All rights reserved.

This module is free software; you can redistribute it and/or
modify it under the same terms as Perl itself. See L<perlartistic>.

=cut

1;
