\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fieldnotes}[2025/02/05 Custom fieldnotes class]

\LoadClass[12pt]{article}
% ======================================
% Packages                              
% ======================================
\RequirePackage[utf8]{inputenc}
\RequirePackage[margin=1in]{geometry}
\RequirePackage{fontspec}
\setmainfont{Charis SIL}

\RequirePackage{enumerate}
\RequirePackage{enumitem}    
\RequirePackage{textcomp}
\RequirePackage{tipa}
\RequirePackage{float}
\RequirePackage{amssymb}
\RequirePackage{pifont} %checkmarks and Xmarks
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{setspace}
\RequirePackage{hyperref}
\RequirePackage{booktabs}
\RequirePackage{makecell}
\RequirePackage{xr}
\RequirePackage[most]{tcolorbox}
\RequirePackage{linguex}
\RequirePackage{assets/typgloss}
\RequirePackage{leipzig}
    \newleipzig{prep}{p}{preposition}
    \newleipzig{report}{report}{reportative}
    \newleipzig{interj}{interj}{interjection}
    \newleipzig{imprs}{imprs}{impersonal}

\setcounter{tocdepth}{1} % set table of contents depth
\setcounter{secnumdepth}{4} %enable \paragraph -- for subsubsubsections

% define custom colors
\definecolor{pennred}{HTML}{990000}

% ======================================
% Custom commands                              
% ======================================
\newcommand{\ts}{\textsc}
\newcommand{\trace}[1]{$\_\_\_\__\text{~#1}$}
\newcommand{\mss}[1]{$_\text{#1}$}

% For subscripts and superscripts 
\newcommand{\spspt}[1]{\ensuremath{^{\textrm{\scriptsize#1}}}}
\newcommand{\sbspt}[1]{\ensuremath{_{\textrm{\scriptsize#1}}}}

% color commands for comments
\newcommand{\jal}[1]{\textcolor{blue}{#1}}
\newcommand{\jk}[1]{\textcolor{red}{#1}}
\newcommand{\gd}[1]{\textcolor{JungleGreen}{#1}}
\newcommand{\wml}[1]{\textcolor{RoyalBlue}{#1}}
\newcommand{\chs}[1]{\textcolor{OliveGreen}{#1}}
\newcommand{\jf}[1]{\textcolor{orange}{#1}}
\newcommand{\ds}[1]{\textcolor{Brown}{#1}}
\newcommand{\mb}[1]{\textcolor{Dandelion}{#1}}
\newcommand{\jmt}[1]{\textcolor{Gray}{#1}}
\newcommand{\g}[1]{\textcolor{JungleGreen}{#1}}
% \newcommand{\alex}[1]{\textcolor{pennred}{#1}}
\newcommand{\alex}[1]{\textcolor{pennred}{\textbf{Alex:} #1}}

% set spacing values
\setlength{\parindent}{0pt} % set paragraph indent spacing

\renewcommand{\firstrefdash}{} %removes dash from ref sub examples, e.g., (1-b) -> (1b)

% package configuration and custom customs

\tcbuselibrary{skins}

\tcbset{
  enhanced,
  boxrule=0.25mm,
  titlerule=0.25mm,
  arc=0.5mm,
  box align=top,
  width=\linewidth-\pgflinewidth,
  fonttitle=\bfseries,
  colback=white
}

\newtcolorbox{checkdata}[2][]{% custom tcolorbox with frame 
    colback=gray!5!white,
    colframe=black,
    colbacktitle=white,
    coltitle=black,
    left=0mm,
    right=3.5mm,
    top=3.5mm,
    bottom=3.5mm,
    title={#2},
    attach boxed title to top center={yshift=-3mm},
    boxed title style={%
            colframe=black,
            boxrule=0.25mm,
            colback=white,
        },
    #1
}