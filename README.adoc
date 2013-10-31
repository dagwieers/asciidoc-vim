= AsciiDoc syntax highlighting in VIM
Dag Wieers <dag@wieers.com>


== Difference with upstream syntax file
While this syntax file was independently developed, it was later merged
with improved regular expressions taken from the upstream syntax file.

 - Bold is *bold*, Emphasize is _italic_
 - Document title stands out (in bold)
 - Titles are underlined
 - Better and more colors facilitate reading and editing
 - Links and email addresses are underlined
 - Admonitions look nicer

The reason why this syntax file looks better is because it does not stick
to the provided styles (that mostly maps to programming languages and
therefor is pretty limited).


== Installing the asciidoc.vim file
Put the _asciidoc.vim_ syntax file in your home directory at
_~/.vim/syntax/asciidoc.vim_. That should be sufficient to have AsciiDoc
support in VIM.


== Auto enabling syntax highlighting
AsciiDoc files have the default +.txt+ extension and therefor are
indistinguishable from plain text files (that do not honour the AsciiDoc
rules). Therefor we cannot automatically enable syntax highlighting in VIM for
AsciiDoc files.

To enable syntax highlighting for AsciiDoc files, add the following line at
the end of your AsciiDoc files:

----
// vim: set syntax=asciidoc:
----

Or install the +asciidoc_filetype.vim+ filetype detection script in
_~/.vim/ftdetect/asciidoc_filetype.vim_.


== Testing VIM syntax files
The syntax file considers 3 different environments.

 1. Terminal
 2. Color terminal
 3. GUI

Each of these have different capabilities and therefor can have different
definitions. To test each of these on a capable terminal, try:

 $ TERM=vt100 vim README.txt
 $ TERM=ansi vim README.txt
 $ gvim README.txt


== Known shortcomings
There are a few quirks in the syntax files. Here is an overview:

Underlining titles does not work consistently??

There is no way that we can match the length of a title with the length of
the line under it. Because of that every line preceded by text could
ambigously be interpreted as either a title or the start of a block. Use
the wiki-style syntax for titles. (used by this document)

Some asciidoc syntax is not implemented??

Yes, certain newer syntax rules have not been implemented yet, as is the case
with the upstream version.

== Feedback
If you have fixes or improvements to the syntax file, please send them to:
mailto:dag@wieers.com[dag@wieers.com].

// vim: set syntax=asciidoc:
