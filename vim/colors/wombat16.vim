set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "wombat16"

if version >= 700
  hi CursorLine cterm=none ctermfg=none ctermbg=DarkGrey
  hi CursorLineNr term=bold cterm=bold ctermfg=White ctermbg=DarkGrey
  hi! link CursorColumn	CursorLine
  hi! link MatchParen CursorLineNr

  hi TabLine cterm=none ctermfg=none ctermbg=Black
  hi TabLineFill cterm=none ctermfg=none ctermbg=Black
  hi TabLineSel cterm=bold ctermfg=Black ctermbg=White

  " Auto-completion
  hi PmenuSel cterm=bold ctermfg=White ctermbg=Grey
  hi Pmenu cterm=none ctermfg=Grey ctermbg=DarkGrey
endif

hi Visual cterm=none ctermfg=DarkGrey ctermbg=Cyan

hi LineNr cterm=bold ctermfg=Black ctermbg=Black
hi Comment cterm=none ctermfg=Grey ctermbg=none
hi Todo cterm=bold ctermfg=White ctermbg=Black

hi StatusLine cterm=bold ctermfg=White ctermbg=Black
hi StatusLineNC cterm=none ctermfg=Grey ctermbg=Black
hi VertSplit cterm=none ctermfg=White ctermbg=Black
hi WildMenu cterm=bold ctermfg=White ctermbg=Magenta

hi Folded cterm=none ctermfg=Black ctermbg=none
hi FoldColumn cterm=none ctermfg=none ctermbg=Black
hi SignColumn cterm=none ctermfg=none ctermbg=Black
hi ColorColumn cterm=none ctermfg=none ctermbg=DarkGrey

hi Title cterm=bold ctermfg=Green ctermbg=none

hi Constant cterm=none ctermfg=Red ctermbg=none
hi Number cterm=none ctermfg=Red ctermbg=none
hi Special cterm=none ctermfg=Green ctermbg=none
hi Delimiter cterm=none ctermfg=none ctermbg=none

hi String cterm=none ctermfg=DarkGreen ctermbg=none
hi StringDelimiter cterm=none ctermfg=none ctermbg=none

hi Identifier cterm=none ctermfg=Green ctermbg=none
hi Structure cterm=none ctermfg=LightCyan ctermbg=none
hi Function cterm=none ctermfg=Green ctermbg=none
hi Operator cterm=none ctermfg=Blue ctermbg=none
hi Statement cterm=none ctermfg=Blue ctermbg=none
hi PreProc cterm=none ctermfg=Red ctermbg=none

hi Type cterm=none ctermfg=Green ctermbg=none
hi NonText cterm=none ctermfg=Grey ctermbg=none

hi SpecialKey term=bold cterm=bold ctermfg=Black ctermbg=White

hi Search cterm=reverse ctermfg=Yellow ctermbg=none

hi Directory cterm=none ctermfg=Yellow ctermbg=none
hi ErrorMsg cterm=none ctermfg=none ctermbg=DarkRed
hi! link Error ErrorMsg
hi! link MoreMsg Special
hi Question cterm=none ctermfg=Green ctermbg=none


" Spell Checking

hi SpellBad cterm=underline ctermfg=none ctermbg=DarkRed
hi SpellCap cterm=underline ctermfg=none ctermbg=Blue
hi SpellRare cterm=underline ctermfg=none ctermbg=DarkMagenta
hi SpellLocal cterm=underline ctermfg=none ctermbg=Green

" Diff

hi! link diffRemoved Constant
hi! link diffAdded String

" VimDiff

hi DiffAdd cterm=none ctermfg=White ctermbg=DarkGreen
hi DiffDelete cterm=none ctermfg=DarkRed ctermbg=DarkRed
hi DiffChange cterm=none ctermfg=White ctermbg=DarkBlue
hi DiffText cterm=reverse ctermfg=Yellow ctermbg=none

" PHP

hi! link phpFunctions Function
"hi StorageClass cterm=none ctermfg=Red ctermbg=none
hi! link StorageClass Type
hi! link phpSuperglobal Identifier
hi! link phpQuoteSingle StringDelimiter
hi! link phpQuoteDouble StringDelimiter
hi! link phpBoolean Constant
hi! link phpNull Constant
hi! link phpArrayPair Operator

" Ruby

hi! link rubySharpBang Comment
hi rubyClass cterm=none ctermfg=DarkBlue ctermbg=none
hi rubyIdentifier cterm=none ctermfg=Cyan ctermbg=none
hi! link rubyConstant Type
hi! link rubyFunction Function

hi rubyInstanceVariable cterm=none ctermfg=Cyan ctermbg=none
hi rubySymbol cterm=none ctermfg=Blue ctermbg=none
hi! link rubyGlobalVariable rubyInstanceVariable
hi! link rubyModule rubyClass
hi rubyControl cterm=none ctermfg=Blue ctermbg=none

hi! link rubyString String
hi! link rubyStringDelimiter StringDelimiter
hi! link rubyInterpolationDelimiter Identifier

hi rubyRegexpDelimiter cterm=none ctermfg=Magenta ctermbg=none
hi rubyRegexp cterm=none ctermfg=DarkMagenta ctermbg=none
hi rubyRegexpSpecial cterm=none ctermfg=Magenta ctermbg=none

hi rubyPredefinedIdentifier cterm=none ctermfg=Red ctermbg=none

" JavaScript

hi! link javaScriptValue Constant
hi! link javaScriptRegexpString rubyRegexp

" CoffeeScript

hi! link coffeeRegExp javaScriptRegexpString

" Lua

hi! link luaOperator Conditional

" C

hi! link cOperator Constant

" Objective-C/Cocoa

hi! link objcClass Type
hi! link cocoaClass objcClass
hi! link objcSubclass objcClass
hi! link objcSuperclass objcClass
hi! link objcDirective rubyClass
hi! link objcStatement Constant
hi! link cocoaFunction Function
hi! link objcMethodName Identifier
hi! link objcMethodArg Normal
hi! link objcMessageName Identifier

" Debugger.vim

hi DbgCurrent cterm=none ctermfg=White ctermbg=DarkBlue
hi DbgBreakPt cterm=none ctermfg=none ctermbg=DarkMagenta

" vim-indent-guides

if !exists("g:indent_guides_auto_colors")
  let g:indent_guides_auto_colors = 0
endif
hi IndentGuidesOdd cterm=none ctermfg=none ctermbg=none
hi IndentGuidesEven cterm=none ctermfg=none ctermbg=none

" Plugins  etc.

hi! link TagListFileName Directory
hi PreciseJumpTarget cterm=none ctermfg=White ctermbg=Green

