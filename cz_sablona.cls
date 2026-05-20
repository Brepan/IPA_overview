\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{LaTeX_CZ_Sablona/cz_sablona}[Stylovy balicek pro psani ceskych textu]

%---------------------
%%% Parametry třídy
%---------------------

%%% Základí hodnoty parametrů
\newif\iffont \let\iffont\iftrue

\DeclareOption{nofont}{\let\iffont\iffalse}

%%% Zakončení deklarace parametrů třídy
\DeclareOption*{}
\ProcessOptions\relax

%---------------------
%%% Nastavení vzhledu
%---------------------

%%% Načtení základní třídy article
\LoadClass[12pt, a4paper]{article}

%%% Nastavení prametrů stránky
\setlength{\intextsep}{5mm} % nastavení mezery okolo obrázků
\unitlength=1mm % nastavení volby jednotek
\emergencystretch=3em % oprava některých přetečení

%---------------------
%%% Základní balíčky
%---------------------
\RequirePackage[czech]{babel}
\RequirePackage{csquotes}
\RequirePackage[margin=2.5cm]{geometry}
\RequirePackage[bookmarksopen,colorlinks,plainpages=false,linkcolor=black,urlcolor=blue,citecolor=black,filecolor=black,menucolor=black,unicode=true,breaklinks]{hyperref}
\RequirePackage[style=numeric,sorting=none,date=long,dateabbrev=false,texencoding=utf8,bibencoding=utf8,style=iso-numeric]{biblatex}
\RequirePackage[l2tabu, orthodox]{nag}
\RequirePackage{iftex}
\RequirePackage{enumitem}
\RequirePackage[all]{nowidow} % Kontrola sirotků a vdov
\RequirePackage{fancyhdr}
\RequirePackage{wrapfig}
\RequirePackage{tikz}
\RequirePackage{graphicx}
\RequirePackage{tabularx}
\RequirePackage{array}
\RequirePackage{microtype}

%%% Nastavení fontu na Times New Roman
\iffont
	\iftutex % Používá se LuaLaTeX nebo XeLaTeX
		\RequirePackage{fontspec}
		\setmainfont{Times New Roman}[Ligatures=Rare]
	\else % PdfLaTeX
		\RequirePackage[T1]{fontenc}
		\RequirePackage{newtx}
		\RequirePackage{cmap}
	\fi
\fi

%%% Nastavení hlavičky strany
\def\title#1{\gdef\@title{#1}\gdef\thetitle{#1}}

\pagestyle{fancy}
\fancyhead{}
\fancyfoot{}
\fancyhead[L]{\thetitle}
\fancyfoot[C]{\thepage}

%%% Použití balíčků xevlna nebo luavlna pro automatické doplnění nezlomitelných mezer
\ifxetex
	\RequirePackage{xevlna}
\fi
\ifluatex
	% Aktivuje nezlomitelné mezery za "a", které nejsou ve výchozím nastavené balíčku
	\RequirePackage[defaults=false]{luavlna}
	\singlechars{czech}{AaIiVvOoUuSsZzKk}
\fi

%%% Balíčky pro sázení matematických a fyzikálních rovnic
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{siunitx}

% Změna desetinného oddělovače na čárku
\DeclareMathSymbol{.}{\mathord}{letters}{"3B}
\sisetup{
	output-decimal-marker = {,},
}