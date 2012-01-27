package Template::Plugin::StringDump;

use 5.006;
use strict;
use warnings;
use parent qw( Template::Plugin::Filter );
use String::Dump qw( dump_hex dump_dec dump_oct dump_bin dump_names );

our $VERSION = '0.03';

sub init {
    my ($self) = @_;

    for my $filter (qw< dump_hex dump_dec dump_oct dump_bin dump_names >) {
        $self->{_CONTEXT}->define_filter($filter => \&$filter);
    }

    return $self;
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

    hex: [% msg | dump_hex %]
    dec: [% msg | dump_dec %]
    oct: [% msg | dump_oct %]
    bin: [% msg | dump_bin %]
    names: [% msg | dump_names %]

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

This L<Template::Toolkit> plugin adds five filters for dumping strings of
characters for diplsay and debugging: C<dump_hex>, C<dump_dec>, C<dump_oct>,
C<dump_bin>, and C<dump_names>.  These filters are simple wrappers around the
functions of the same names from L<String::Dump>.  See that module for
details.

=head1 AUTHOR

Nick Patch <patch@cpan.org>

=head1 COPYRIGHT AND LICENSE

Copyright 2011 Nick Patch

This library is free software; you can redistribute it and/or modify it under
the same terms as Perl itself.

=cut
