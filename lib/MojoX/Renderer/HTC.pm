package MojoX::Renderer::HTC;

use warnings;
use strict;

use HTML::Template::Compiled;

# ABSTRACT: HTML::Template::Compiled renderer for Mojo

our $VERSION = '0.02';

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

1; # End of MojoX::Renderer::HTC
