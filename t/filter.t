use strict;
use warnings;
use utf8;
use Template::Test;

test_expect(\*DATA);

__END__
[% USE StringDump -%]

--test--
[% 'Ĝis! ☺' | dump %]
--expect--
11C 69 73 21 20 263A

--test--
[% 'Ĝis! ☺' | dump('hex') %]
--expect--
11C 69 73 21 20 263A

--test--
[% 'Ĝis! ☺' | dump('dec') %]
--expect--
284 105 115 33 32 9786

--test--
[% 'Ĝis! ☺' | dump('oct') %]
--expect--
434 151 163 41 40 23072

--test--
[% 'Ĝis! ☺' | dump('bin') %]
--expect--
100011100 1101001 1110011 100001 100000 10011000111010

--test--
[% 'Ĝis! ☺' | dump('names') %]
--expect--
LATIN CAPITAL LETTER G WITH CIRCUMFLEX, LATIN SMALL LETTER I, LATIN SMALL LETTER S, EXCLAMATION MARK, SPACE, WHITE SMILING FACE
