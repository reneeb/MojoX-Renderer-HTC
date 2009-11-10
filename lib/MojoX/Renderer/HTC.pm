package MojoX::Renderer::HTC;

use warnings;
use strict;

use HTML::Template::Compiled;

=head1 NAME

MojoX::Renderer::HTC - HTML::Template::Compiled renderer for Mojo

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

  use MojoX::Renderer::HTC;

  sub startup {
    my $self = shift;

    $self->types->type(tmpl => 'text/html');

    my $render = MojoX::Renderer::HTC->build(
        %html_template_compiled_params,
    );

    $self->renderer->add_handler( tmpl => $render );
  }

=head1 METHODS

=head2 build

=cut

sub build {
    my ($self, %args) = @_;
    
    return sub {
        my ($mojo, $ctx, $output) = @_;
        
        my $stash = $ctx->stash;
        my $template = HTML::Template::Compiled->new(
            %args,
            filename => $stash->{template},
        );
        
        $template->param(
            %$stash,
        );
        
        $$output = $template->output;
    }
}

=head1 AUTHOR

Renee Baecker, C<< <module at renee-baecker.de> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-mojox::renderer::htc at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=MojoX::Renderer::HTC>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc MojoX::Renderer::HTC


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=MojoX::Renderer::HTC>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/MojoX::Renderer::HTC>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/MojoX::Renderer::HTC>

=item * Search CPAN

L<http://search.cpan.org/dist/MojoX::Renderer::HTC/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 COPYRIGHT & LICENSE

Copyright 2009 Renee Baecker.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1; # End of MojoX::Renderer::HTC
