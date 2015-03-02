package MojoX::Renderer::HTC;

use warnings;
use strict;
use Mojo::Base 'Mojolicious::Plugin';

use HTML::Template::Compiled;
__PACKAGE__->attr( htc_args => sub { return {} });

# ABSTRACT: HTML::Template::Compiled renderer for Mojo

our $VERSION = '0.02';

sub build {
    my $self = shift->SUPER::new(@_);
    my %args = @_;
    $self->htc_args(\%args);
    return sub { $self->_render(@_) }
}

sub _render {
    my ($self, $r, $c, $output, $options) = @_;

    my $name = $r->template_name($options);
    my $stash = $c->stash;
    my $template = HTML::Template::Compiled->new(
        %{ $self->htc_args },
        filename => $name,
    );

    $template->param(
        %$stash,
    );

    $$output = $template->output;
}

1; # End of MojoX::Renderer::HTC

__END__

=pod

=encoding UTF-8

=head1 NAME

MojoX::Renderer::HTC - HTML::Template::Compiled renderer for Mojo

=head1 VERSION

version 0.02

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

In the app:

  $self->render(
      msg => 'Welcome to the Mojolicious real-time web framework!',
      handler => 'htc',
      format => 'html', # optional
      template => "example/schema", # optional
  );

=head1 METHODS

=head2 build

=head1 AUTHOR

Renee Baecker <reneeb@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2015 by Renee Baecker.

This is free software, licensed under:

  The Artistic License 2.0 (GPL Compatible)

=cut
