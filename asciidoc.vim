" Vim syntax file
" Language: Asciidoc text document
" Maintainer: Dag Wieers <dag@wieers.com>
" Last Change:»·$Date: 2007/07/18 16:11:12 $
" $Revision$

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn sync fromstart

syn match asciidocBold /\*[^*]\+\*/
syn match asciidocEmphasize /_[^_]\+_/
"FIXME: Emphasizing using single quotes is prone to failure, so we disable it.
"syn match asciidocEmphasize /'[^']\+'/
"syn region asciidocEmphasize start="\'\{1}[^\']"  end="\'\{1}\([^\']\|$\)"
syn match asciidocMonospace /+[^+]\++/
syn match asciidocMonospace /`[^`]\+`/
syn match asciidocPassthrough /\$\$.\+\$\$/
syn match asciidocBullet /^\s*[\*\-]\s/
syn match asciidocNumItem /^\s*\d\+[.)]\s/
syn match asciidocBiblio /^\s*+\s\+/
syn match asciidocSource /^\s\s*\$\s\+.\+$/
syn keyword asciidocTodo TODO FIXME XXX contained
syn match asciidocEmail /\S\+@\S\+\(.\S+\)*/
syn match asciidocSpecialChar /{amp}\w+;/
syn match asciidocAdmonitionNote /^\(NOTE\|TIP\):/
syn match asciidocAdmonitionWarn /^\(CAUTION\|IMPORTANT\|WARNING\):/
syn match asciidocAdmonitionNote /^\[\(NOTE\|TIP\)\]\s*$/
syn match asciidocAdmonitionWarn /^\[\(CAUTION\|IMPORTANT\|WARNING\)\]\s*$/

syn region asciidocAttribute start="^:" end=":\s\+"
syn region asciidocAttributeList start="^\[" end="\]\s*$" oneline
syn region asciidocSect0 start="^=[^=]" end="$" oneline
syn region asciidocSect1 start="^==[^=]" end="$" oneline 
syn region asciidocSect2 start="^===[^=]" end="$" oneline
syn region asciidocSect3 start="^====[^=]" end="$" oneline
syn region asciidocSect4 start="^=====[^=]" end="$" oneline

"FIXME: It is impossible to distinguish underlined titles from block delimiters
"       because we cannot calculate length in VIM syntax
"syn region asciidocSectOld0 start="^=" end="=$" oneline
"syn region asciidocSectOld1 start="^-" end="-$" oneline
"syn region asciidocSectOld2 start="^\~" end="\~$" oneline
"syn region asciidocSectOld3 start="^\^" end="\^$" oneline
"syn region asciidocSectOld4 start="^+" end="+$" oneline
"syn match asciidocSectOld0 /^===\+$/
"syn match asciidocSectOld1 /^---\+$/
"syn match asciidocSectOld2 /^\~\~\~\+$/
"syn match asciidocSectOld3 /^\^\^\^\+$/
"syn match asciidocSectOld4 /^+++\+$/
syn region asciidocDefinition start="^" end="::\s*$" oneline
syn region asciidocGlossary start="^" end=":-\s*$" oneline
syn match asciidocReference /<<\w\+>>/
syn match asciidocReference /<<\w\+,.\+>>/
syn match asciidocFootnote /footnote:\[.*\]/
syn match asciidocLink /link:.*\[.*\]/
syn match asciidocURI /\(file\|ftp\|gopher\|http\|https\|mailto\|news\|xref\):.*\[.*\]/
syn match asciidocInclude /include::.*\[\]/
syn match asciidocInclude /image:.*\[.*\]/
syn match asciidocInclude /image::.*\[.*\]/
syn match asciidocInclude /footnote:\[.*\]/
syn match asciidocInclude /indexterm:\[.*\]/
syn match asciidocInclude /ifdef::.*\[\]/
syn match asciidocInclude /endif::.*\[\]/
syn match asciidocMacro /\[\[.*\]\]/
syn match asciidocMacro /((.*))/
syn match asciidocComment /^\ *\/\/.*$/ contains=asciidocTodo
syn region asciidocComment start="^\s*#" end="$" oneline
syn region asciidocCommentBlock start="^////\+\s*$" end="^////\+\s*$" contains=asciidocTodo
syn region asciidocListingBlock start="^---\+$" end="^---\+$"
syn region asciidocLiteralBlock start="^\.\.\.\+$" end="^\.\.\.\+$"
syn region asciidocSidebarBlock start="^\*\*\*\+$" end="^\*\*\*\+$"
syn region asciidocQuoteBlock start="^___\+$" end="^___\+$"
syn region asciidocSourceBlock start="^source\~\~\~\+$" end="^source\~\~\~\+$"
syn region asciidocMusicBlock start="^music\~\~\~\+$" end="^music\~\~\~\+$"
syn region asciidocExampleBlock start="^===\+$" end="^===\+$"
syn region asciidocBlockTitle start="^\." end="$" oneline

if version <= 508 || !exists("did_asciidoc_syntax_inits")
  if version < 508
    let did_asciidoc_syntax_inits = 1
  endif

  "Styles
  hi asciidocBold term=bold cterm=bold gui=bold
  hi asciidocEmphasize term=italic ctermfg=darkgreen guifg=darkgreen
  hi asciidocMonospace term=standout ctermfg=darkyellow guifg=darkyellow
  hi asciidocAttribute term=standout ctermfg=darkgreen guifg=darkgreen
  hi asciidocAttributeList term=standout ctermfg=darkgreen guifg=darkgreen
  hi asciidocBlockTitle term=standout ctermfg=darkgreen guifg=darkgreen
  hi asciidocAdmonitionNote term=reverse ctermfg=white ctermbg=green guifg=white guibg=green
  hi asciidocAdmonitionWarn term=reverse ctermfg=white ctermbg=red guifg=white guibg=red
  hi asciidocTodo term=reverse ctermfg=black ctermbg=yellow guifg=black guibg=yellow
  hi asciidocReference term=underline ctermfg=darkmagenta guifg=darkmagenta
  hi asciidocFootnote term=underline ctermfg=darkmagenta guifg=darkmagenta
  hi asciidocDefinition term=underline ctermfg=darkmagenta guifg=darkmagenta
  hi asciidocGlossary term=underline ctermfg=darkmagenta guifg=darkmagenta
  hi asciidocMacro term=standout ctermfg=darkyellow guifg=darkyellow
  hi asciidocSpecialChar term=standout ctermfg=darkyellow guifg=darkyellow
  hi asciidocSource term=standout ctermfg=darkyellow guifg=darkyellow
  hi asciidocPassthrough term=underline ctermfg=darkmagenta guifg=darkmagenta
  hi asciidocInclude term=underline ctermfg=darkmagenta guifg=darkmagenta

  "Lists
  hi asciidocBullet term=bold ctermfg=cyan guifg=cyan
  hi asciidocNumItem term=bold ctermfg=cyan guifg=cyan
  hi asciidocBiblio term=bold ctermfg=cyan guifg=cyan

  "Sections
  hi asciidocSect0 term=underline ctermfg=darkmagenta cterm=underline guifg=darkmagenta gui=underline
  hi asciidocSect1 term=underline ctermfg=darkmagenta cterm=underline guifg=darkmagenta gui=underline
  hi asciidocSect2 term=underline ctermfg=darkmagenta cterm=underline guifg=darkmagenta gui=underline
  hi asciidocSect3 term=underline ctermfg=darkmagenta cterm=underline guifg=darkmagenta gui=underline
  hi asciidocSect4 term=underline ctermfg=darkmagenta cterm=underline guifg=darkmagenta gui=underline
  hi asciidocSectOld0 term=underline ctermfg=darkmagenta guifg=darkmagenta
  hi asciidocSectOld1 term=underline ctermfg=darkmagenta guifg=darkmagenta
  hi asciidocSectOld2 term=underline ctermfg=darkmagenta guifg=darkmagenta
  hi asciidocSectOld3 term=underline ctermfg=darkmagenta guifg=darkmagenta
  hi asciidocSectOld4 term=underline ctermfg=darkmagenta guifg=darkmagenta

  "Links
  hi asciidocEmail term=underline ctermfg=darkmagenta cterm=underline guifg=darkmagenta gui=underline
  hi asciidocLink term=underline ctermfg=darkmagenta cterm=underline guifg=darkmagenta gui=underline
  hi asciidocURI term=underline ctermfg=darkmagenta cterm=underline guifg=darkmagenta gui=underline

  "Blocks
  hi asciidocBlock term=standout ctermfg=darkyellow guifg=darkyellow
  hi asciidocExampleBlock term=standout ctermfg=darkyellow guifg=darkyellow
  hi asciidocListingBlock term=standout ctermfg=darkyellow guifg=darkyellow
  hi asciidocLiteralBlock term=standout ctermfg=darkyellow guifg=darkyellow
  hi asciidocMusicBlock term=standout ctermfg=darkyellow guifg=darkyellow
  hi asciidocQuoteBlock term=standout ctermfg=darkyellow guifg=darkyellow
  hi asciidocSidebarBlock term=standout ctermfg=darkyellow guifg=darkyellow
  hi asciidocSourceBlock term=standout ctermfg=darkyellow guifg=darkyellow

  "Comments
  hi asciidocComment term=standout ctermfg=darkblue guifg=darkblue
  hi asciidocCommentBlock term=standout ctermfg=darkblue guifg=darkblue
endif

let b:current_syntax = "asciidoc"

"eof
