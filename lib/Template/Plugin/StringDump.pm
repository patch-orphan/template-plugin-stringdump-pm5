package Template::Plugin::StringDump;

use 5.006;
use strict;
use warnings;
use parent qw( Template::Plugin::Filter );
use String::Dump;

our $VERSION = '0.01';

use constant FILTER_NAME => 'dump';

sub init {
    my ($self) = @_;

    $self->{_DYNAMIC} = 1;
    $self->install_filter(FILTER_NAME);

    return $self;
}

sub filter {
    my ($self, $string, $args, $conf) = @_;
    my ($mode) = @{$args};

    return dump_string($string) unless $mode;
    return dump_string($mode, $string);
}

1;

__END__

=encoding utf8

=head1 NAME

Template::Plugin::StringDump - String::Dump plugin for TT

=head1 VERSION

This document describes Template::Plugin::StringDump version 0.01.

=head1 SYNOPSIS

    [% USE StringDump %]

    hex: [% foo | dump %]
    oct: [% foo | dump('oct') %]

=head1 DESCRIPTION

...

=head1 AUTHOR

Nick Patch <patch@cpan.org>

=head1 COPYRIGHT AND LICENSE

Copyright 2011 Nick Patch

This library is free software; you can redistribute it and/or modify it under
the same terms as Perl itself.

=cut
