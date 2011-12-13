package Template::Plugin::StringDump;

use 5.006;
use strict;
use warnings;
use parent qw( Template::Plugin::Filter );
use String::Dump;

our $VERSION = '0.03';
our $DYNAMIC = 1;  # dynamic filter

use constant FILTER_NAME => 'dump';

sub init {
    my ($self) = @_;

    $self->install_filter(FILTER_NAME);

    return $self;
}

sub filter {
    my ($self, $string, $args, $conf) = @_;
    my ($mode) = @{$args};

    return dumpstr($string) unless $mode;
    return dumpstr($mode, $string);
}

1;

__END__

=encoding utf8

=head1 NAME

Template::Plugin::StringDump - String::Dump plugin for TT

=head1 VERSION

This document describes Template::Plugin::StringDump version 0.03.

=head1 SYNOPSIS

Template:

    [% USE StringDump %]

    [% SET msg = 'Ĝis! ☺' %]

    hex: [% msg | dump %]
    dec: [% msg | dump('dec') %]
    oct: [% msg | dump('oct') %]
    bin: [% msg | dump('bin') %]
    names: [% msg | dump('names') %]

Output:

    hex: 11C 69 73 21 20 263A
    dec: 284 105 115 33 32 9786
    oct: 434 151 163 41 40 23072
    bin: 100011100 1101001 1110011 100001 100000 10011000111010
    names: LATIN CAPITAL LETTER G WITH CIRCUMFLEX, LATIN SMALL LETTER I,
    LATIN SMALL LETTER S, EXCLAMATION MARK, SPACE, WHITE SMILING FACE

The output has been manually split into multiple lines for the layout of this
document.

=head1 DESCRIPTION

This L<Template::Toolkit> plugin adds the C<dump> filter, which dumps strings
of characters or bytes for display and debugging.  This filter is a simple
wrapper around the C<dumpstr> function from the L<String::Dump> module.  The
filter takes the C<dumpstr> mode as an optional argument, defaulting to
C<hex>.  See L<String::Dump> for details.

The filter name C<dump> was selected instead of C<dumpstr> because filters
only work on strings, so the name would be repetitive.  It also doesn't
compete with other TT plugins like L<Template::Plugin::Dump> or
L<Template::Plugin::Dumper> because they need to function on data structures,
as opposed to strings, so they don't provide filters.

=head1 AUTHOR

Nick Patch <patch@cpan.org>

=head1 COPYRIGHT AND LICENSE

Copyright 2011 Nick Patch

This library is free software; you can redistribute it and/or modify it under
the same terms as Perl itself.

=cut
