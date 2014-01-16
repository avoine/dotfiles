
execute pathogen#infect()

" Change les couleurs de la coloration syntaxique
" colorscheme peachpuff
"
" Themes disponible:
" blue default desert evening morning pablo shine torte 
" darkblue delek elflord koehler murphy peachpuff ron slate zellner

" Change les couleurs de commentaire pour Cyan
" hi Comment ctermfg=DarkCyan guifg=Cyan
hi Search ctermbg=LightGrey
hi MatchParen ctermbg=LightGrey
hi PyFlakes ctermbg=LightGrey

" Activation de la coloration syntaxique
syntax on

" cinquante ligne d'historique de commande:
set history=50

" configurer la langue de correction pour le français
setlocal spelllang=fr

" Configuration de l'historique de travail sur un fichier
" (recherche 10 termes, position dans le fichier, etc)
set viminfo=/10,'10,r/mnt/zip,r/mnt/floppy,f0,h,\"100,:20,%

" Activation du repliage de paraphaphe selon la syntaxe du fichier
set foldmethod=syntax
" Par défaut on déplie tous les niveaux
set foldlevelstart=20

" Pour utilisation de la sourie pour déplacer le curseur
"set mouse=a
" Permet de voir la commande en cours d'être inscite en bas à droite
set showcmd

" Indique que la touche <tab> ajoutera 4 espaces
set tabstop=4
" Indique le nombre d'espace ajouté avec l'indentation automatique
set shiftwidth=4
" Arrondie l'indentation pour qu'elle soit un multiple de shiftwidth
set shiftround
" la suppression d'un <tab> supprime 4 espaces
set softtabstop=4
" Transforme les <tab> en espaces
set expandtab

" Indique que la touche tab espacera pour garder une bonne indentation
set smarttab
set expandtab

" DéActivation de l'indentation automatique
set noai

" Active l'indentation automatique pour le type de fichier édité
" filetype indent on

" Largeur du texte à l'écran (déactivé)
set textwidth=0

" Saut de ligne automatique
set wrap

" Recherche incrémentale (en cours de frappe)
set incsearch
" La recherche surligne le mot trouvé
set hlsearch

" La recherche ignore les majuscules/minuscules
set ignorecase

" Active le menu de positionnement du curseur
set ruler wildmenu

" Désactive la compatiblilité avec les commandes de l'éditeur vi
set nocompatible

" Active la détection du type de fichier et charge les plugins correspondant
filetype on
filetype plugin on

" Active le Backspace de type deux"
set backspace=2

" Recharge le fichier lors de modification
"set autoread

" Permet de modifier les couleurs de coloration syntaxique de Vim
"colorscheme desert

" Épaisseur de la ligne de commande
"set cmdheight=1

" Configuration de la ligne de status
hi StatusLine term=reverse ctermfg=4 gui=undercurl guisp=White
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%04l,%03v][%p%%]\ [LC=%L]

" speakup config
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]
set laststatus=2

" Souligne la ligne du curseur
"set cursorline

" Active la numérotation des lignes
"set number
"set numberwidth=5

" Permet la navigation entre les fichiers ouverts sans sauvegarder
set hid

:au Filetype html,xhtml,xml,xsl set tabstop=2 shiftwidth=2 softtabstop=2

" Déactive les backups d'édition
set nobackup
set nowb
set noswapfile

noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Saut au dernier emplacement connu du curseur à l'ouverture
augroup JumpCursorOnEdit
  au!
  autocmd BufReadPost *
    \ if expand("<afile>:p:h") !=? $TEMP |
    \   if line("'\"") > 1 && line("'\"") <= line("$") |
    \     let JumpCursorOnEdit_foo = line("'\"") |
    \     let b:doopenfold = 1 |
    \     if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
    \        let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
    \        let b:doopenfold = 2 |
    \     endif |
    \     exe JumpCursorOnEdit_foo |        
    \   endif |
    \ endif
  " Need to postpone using "zv" until after reading the modelines.
  autocmd BufWinEnter *
    \ if exists("b:doopenfold") |
    \   exe "normal zv" |
    \   if(b:doopenfold > 1) |
    \       exe  " ".1 |
    \   endif |
    \   unlet b:doopenfold |
    \ endif
augroup END


" Surligne les caractères 80 et +
:au BufWinEnter * let w:m2=matchadd('Search', '\%>80v.\+', -1)

" Fichier de sauvegarde des couper/coller entre les éditions
let g:yankring_history_dir = expand('$HOME/.vim')

" Active modelines (Configuration de vim via un commentaire en fin de fichier)
"set modeline

" Permettre les erreurs courantes de frappe
cab W w
cab Q q
cab WQ wq
cab Wq wq
cab wQ wq

" Souligner une ligne avec les caratères -/=/etc
map ,u <ESC>yyp<c-v>$r
map # gd

" Permet l'ouverture et la fermeture des replis à l'aide de l'espace
" 
" If there is no fold at current line, just moves forward. 
" If it is present, reverse it's state. 
fun! ToggleFold() 
    if foldlevel('.') == 0 
        normal! l 
    else 
        if foldclosed('.') < 0 
            . foldclose 
        else 
            . foldopen 
        endif 
    endif 
    " Clear status line 
    echo 
endfun

" Map this function to Space key. 
noremap <space> :call ToggleFold()<CR>

nmap <silent> <c-n> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1
let g:xptemplate_key = '<s-Tab>'
let g:xptemplate_always_show_pum = 1

let g:LargeFile=10

" Commenting blocks of code.
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

set t_Co=256

let b:surround_{char2nr("v")} = "{{ \r }}"
let b:surround_{char2nr("{")} = "{{ \r }}"
let b:surround_{char2nr("%")} = "{% \r %}"
let b:surround_{char2nr("b")} = "{% block \1block name: \1 %}\r{% endblock \1\1 %}"
let b:surround_{char2nr("i")} = "{% if \1condition: \1 %}\r{% endif %}"
let b:surround_{char2nr("w")} = "{% with \1with: \1 %}\r{% endwith %}"
let b:surround_{char2nr("f")} = "{% for \1for loop: \1 %}\r{% endfor %}"
let b:surround_{char2nr("c")} = "{% comment %}\r{% endcomment %}"


" Load show documentation plugin
let g:pymode_doc = 1
"
" " Key for show python documentation
let g:pymode_doc_key = 'K'

":au Filetype less let let b:current_syntax = "css"
:au Filetype html UltiSnipsAddFiletypes django.snippet
hi SpellBad ctermbg=LightGray ctermfg=black
hi PyFlakes ctermbg=LightGray ctermfg=black
let g:khuno_ignore="E501,W293,E301,E302,E201,E202,E231,E225,"

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
 
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

set completeopt-=preview
