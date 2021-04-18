" Project: Interrato Vim
" Author: Simone Ragusa
" License: MIT

if version > 580
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif

let g:colors_name = "interrato"
let s:interrato_vim_version = "1.0.0-beta1"
set background=light

" Colors {{{
" Dark Colors
let s:interrato0_gui = "#000000"
let s:interrato1_gui = "#1e1f1d"
let s:interrato2_gui = "#353535"
let s:interrato3_gui = "#4d4e4f"
" Light Colors
let s:interrato4_gui = "#dcdee6"
let s:interrato5_gui = "#ecebe4"
let s:interrato6_gui = "#f3f2ee"
" Blue-ish Colors
let s:interrato7_gui = "#253443"
let s:interrato8_gui = "#007d9c"
let s:interrato9_gui = "#00acd7"
" Others
let s:interrato10_gui = "#9c1f00"  " Red
let s:interrato11_gui = "#d36916"  " Orange
let s:interrato12_gui = "#d3b706"  " Yellow
let s:interrato13_gui = "#499c00"  " Green
let s:interrato14_gui = "#9c0049"  " Purple-ish

" cterm
let s:interrato0_term = "0"
let s:interrato1_term = "0"
let s:interrato2_term = "8"
let s:interrato3_term = "8"
let s:interrato4_term = "7"
let s:interrato5_term = "7"
let s:interrato6_term = "15"
let s:interrato7_term = "1"
let s:interrato8_term = "3"
let s:interrato9_term = "11"
let s:interrato10_term = "12"
let s:interrato11_term = "6"
let s:interrato12_term = "14"
let s:interrato13_term = "10"
let s:interrato14_term = "5"

" Vim 8 Terminal Colors
if has('terminal')
    let g:terminal_ansi_colors = [s:interrato1_gui, s:interrato10_gui, s:interrato13_gui, s:interrato12_gui, s:interrato7_gui, s:interrato14_gui, s:interrato8_gui, s:interrato5_gui, s:interrato3_gui, s:interrato10_gui, s:interrato13_gui, s:interrato12_gui, s:interrato7_gui, s:interrato14_gui, s:interrato9_gui, s:interrato6_gui]
endif

" Neovim Terminal Colors
if has('nvim')
    let g:terminal_color_0 = s:interrato1_gui
    let g:terminal_color_1 = s:interrato10_gui
    let g:terminal_color_2 = s:interrato13_gui
    let g:terminal_color_3 = s:interrato12_gui
    let g:terminal_color_4 = s:interrato7_gui
    let g:terminal_color_5 = s:interrato14_gui
    let g:terminal_color_6 = s:interrato8_gui
    let g:terminal_color_7 = s:interrato5_gui
    let g:terminal_color_8 = s:interrato3_gui
    let g:terminal_color_9 = s:interrato10_gui
    let g:terminal_color_10 = s:interrato13_gui
    let g:terminal_color_11 = s:interrato12_gui
    let g:terminal_color_12 = s:interrato7_gui
    let g:terminal_color_13 = s:interrato14_gui
    let g:terminal_color_14 = s:interrato9_gui
    let g:terminal_color_15 = s:interrato6_gui
endif
" }}}

" Highlighter Function {{{
function! s:hi(group, guifg, guibg, ctermfg, ctermbg, attr)
    if a:guifg != ""
        exec "hi " . a:group . " guifg=" . a:guifg
    endif
    if a:guibg != ""
        exec "hi " . a:group . " guibg=" . a:guibg
    endif
    if a:ctermfg != ""
        exec "hi " . a:group . " ctermfg=" . a:ctermfg
    endif
    if a:ctermbg != ""
        exec "hi " . a:group . " ctermbg=" . a:ctermbg
    endif
    if a:attr != ""
        exec "hi " . a:group . " gui=" . a:attr
    endif
endfunction
" }}}

" UI Components : Editor {{{
""" Base
"          Group           GuiFG              GuiBG              CTermFG             CTermBG             Attr
call s:hi("ColorColumn",  "",                s:interrato5_gui,  "NONE",             s:interrato5_term,  "")
call s:hi("Cursor",       s:interrato6_gui,  s:interrato1_gui,  "",                 "NONE",             "")
call s:hi("CursorLine",   "",                s:interrato5_gui,  "NONE",             s:interrato5_term,  "NONE")
call s:hi("CursorColumn", "",                s:interrato5_gui,  "NONE",             s:interrato5_term,  "")
call s:hi("Error",        s:interrato1_gui,  s:interrato10_gui, "",                 s:interrato10_term, "")
call s:hi("iCursor",      s:interrato6_gui,  s:interrato1_gui,  "",                 "NONE",             "")
call s:hi("LineNr",       s:interrato3_gui,  "NONE",            s:interrato3_term,  "NONE",             "")
call s:hi("CursorLineNr", s:interrato0_gui,  "",                "NONE",             "",                 "NONE")
call s:hi("MatchParen",   s:interrato7_gui,  s:interrato4_gui,  s:interrato7_term,  s:interrato4_term,  "")
call s:hi("NonText",      s:interrato4_gui,  "",                s:interrato4_term,  "",                 "")
call s:hi("Normal",       s:interrato1_gui,  s:interrato6_gui,  "NONE",             "NONE",             "")
call s:hi("PMenu",        s:interrato1_gui,  s:interrato5_gui,  "NONE",             s:interrato1_term,  "NONE")
call s:hi("PmenuSbar",    s:interrato1_gui,  s:interrato5_gui,  "NONE",             s:interrato1_term,  "")
call s:hi("PMenuSel",     s:interrato8_gui,  s:interrato4_gui,  s:interrato8_term,  s:interrato4_term,  "")
call s:hi("PmenuThumb",   s:interrato8_gui,  s:interrato4_gui,  "NONE",             s:interrato4_term,  "")
call s:hi("SpecialKey",   s:interrato4_gui,  "",                s:interrato4_term,  "",                 "")
call s:hi("SpellBad",     s:interrato10_gui, s:interrato6_gui,  s:interrato10_term, "NONE",             "underline")
call s:hi("SpellCap",     s:interrato12_gui, s:interrato6_gui,  s:interrato12_term, "NONE",             "underline")
call s:hi("SpellLocal",   s:interrato0_gui,  s:interrato6_gui,  s:interrato0_term,  "NONE",             "underline")
call s:hi("SpellRare",    s:interrato2_gui,  s:interrato6_gui,  s:interrato2_term,  "NONE",             "underline")
call s:hi("Visual",       "",                s:interrato9_gui,  "",                 s:interrato9_term,  "")
call s:hi("VisualNOS",    "",                s:interrato9_gui,  "",                 s:interrato9_term,  "")
call s:hi("VertSplit",    s:interrato4_gui,  s:interrato6_gui,  s:interrato4_term,  "NONE",             "NONE")

""" Neovim Support
"          Group            GuiFG              GuiBG             CTermFG             CTermBG            Attr
call s:hi("healthError",   s:interrato10_gui, s:interrato5_gui, s:interrato10_term, s:interrato5_term, "")
call s:hi("healthSuccess", s:interrato13_gui, s:interrato5_gui, s:interrato13_term, s:interrato5_term, "")
call s:hi("healthWarning", s:interrato12_gui, s:interrato5_gui, s:interrato12_term, s:interrato5_term, "")
call s:hi("TermCursorNC",  "",                s:interrato5_gui, "",                 s:interrato5_term, "")

""" Folding
"          Group         GuiFG             GuiBG             CTermFG            CTermBG            Attr
call s:hi("Folded",     s:interrato9_gui, s:interrato5_gui, s:interrato9_term, s:interrato5_term, "bold")
call s:hi("FoldColumn", s:interrato9_gui, s:interrato4_gui, s:interrato9_term, "NONE",            "")
call s:hi("SignColumn", s:interrato5_gui, s:interrato4_gui, s:interrato5_term, "NONE",            "")
" }}}

" UI Components : Navigation {{{
call s:hi("Directory", s:interrato8_gui, "", s:interrato8_term, "NONE", "")
" }}}

" Language Base Groups {{{
"          Group             GuiFG              GuiBG   CTermFG             CTermBG Attr
call s:hi("Boolean",        s:interrato7_gui,  "",     s:interrato7_term,  "",     "")
call s:hi("Character",      s:interrato2_gui,  "",     s:interrato2_term,  "",     "")
call s:hi("Comment",        s:interrato3_gui,  "",     s:interrato3_term,  "",     "")
call s:hi("Conditional",    s:interrato7_gui,  "",     s:interrato7_term,  "",     "")
call s:hi("Constant",       s:interrato1_gui,  "",     "NONE",             "",     "")
call s:hi("Define",         s:interrato7_gui,  "",     s:interrato7_term,  "",     "")
call s:hi("Delimiter",      s:interrato0_gui,  "",     s:interrato0_term,  "",     "")
call s:hi("Exception",      s:interrato7_gui,  "",     s:interrato7_term,  "",     "")
call s:hi("Float",          s:interrato0_gui,  "",     s:interrato0_term,  "",     "")
call s:hi("Function",       s:interrato8_gui,  "",     s:interrato8_term,  "",     "")
call s:hi("Identifier",     s:interrato1_gui,  "",     "NONE",             "",     "NONE")
call s:hi("Include",        s:interrato7_gui,  "",     s:interrato7_term,  "",     "")
call s:hi("Keyword",        s:interrato7_gui,  "",     s:interrato7_term,  "",     "")
call s:hi("Label",          s:interrato7_gui,  "",     s:interrato7_term,  "",     "")
call s:hi("Number",         s:interrato0_gui,  "",     s:interrato0_term,  "",     "")
call s:hi("Operator",       s:interrato7_gui,  "",     s:interrato7_term,  "",     "NONE")
call s:hi("PreProc",        s:interrato7_gui,  "",     s:interrato7_term,  "",     "NONE")
call s:hi("Repeat",         s:interrato7_gui,  "",     s:interrato7_term,  "",     "")
call s:hi("Special",        s:interrato1_gui,  "",     "NONE",             "",     "")
call s:hi("SpecialChar",    s:interrato12_gui, "",     s:interrato12_term, "",     "")
call s:hi("SpecialComment", s:interrato8_gui,  "",     s:interrato8_term,  "",     "")
call s:hi("Statement",      s:interrato7_gui,  "",     s:interrato7_term,  "",     "")
call s:hi("StorageClass",   s:interrato7_gui,  "",     s:interrato7_term,  "",     "")
call s:hi("String",         s:interrato2_gui,  "",     s:interrato2_term,  "",     "")
call s:hi("Structure",      s:interrato7_gui,  "",     s:interrato7_term,  "",     "")
call s:hi("Tag",            s:interrato1_gui,  "",     "",                 "",     "")
call s:hi("Todo",           s:interrato12_gui, "NONE", s:interrato12_term, "NONE", "")
call s:hi("Type",           s:interrato7_gui,  "",     s:interrato7_term,  "",     "NONE")
call s:hi("Typedef",        s:interrato7_gui,  "",     s:interrato7_term,  "",     "")
hi! link Macro Define
hi! link PreCondit PreProc
" }}}

" Go {{{
call s:hi("goBuiltins", s:interrato8_gui, "", s:interrato8_term, "", "")
hi! link goConstants Keyword
" }}}

" vim:foldmethod=marker:foldlevel=0
