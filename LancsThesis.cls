\newcommand{\UniThesisUpdate}{2014/09/14}
\newcommand{\UniThesisVersion}{1.0}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{LancsThesis}[\UniThesisUpdate\space Version
\UniThesisVersion\space by Erick Chacon Montalvan, School of Statistics]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions
\LoadClass[oneside]{book}
\usepackage{fontspec}
% \setmainfont{Latin Modern Roman}
\setsansfont{Latin Modern Sans}[SmallCapsFeatures = {Letters=SmallCaps}]
\setmonofont{Latin Modern Mono}[SmallCapsFeatures = {Letters=SmallCaps}]
\setmainfont{Latin Modern Roman}[SmallCapsFeatures = {Letters=SmallCaps}]
% \usepackage[T1]{fontenc} % fonts
% \usepackage{lmodern}
\usepackage{enumitem}
% \usepackage{enumerate}                                
% \usepackage[inline]{enumitem}
\usepackage[a4paper, top=3cm,bottom=3cm,right=2.5cm,left=3cm,headheight=0.6cm]{geometry}
\usepackage[toc,title,page]{appendix}                 % Configure appendix formatting
\usepackage{tocloft}                                  % Configure ToC Lo{F,T} formatting
\usepackage{indentfirst}                              % Always indent first paragraph
\usepackage{fancyhdr}                                 % Control header, footer position
\usepackage{graphicx}                                 % Include figures
\usepackage{setspace}                                 % Control spacing
% \usepackage[latin1]{inputenc}                         % Coding latin1
\usepackage[english]{babel}                           % english language
\usepackage{color}                                    % Manage colors
\usepackage{breakcites}                               % Break citation reference
\usepackage[font=small,labelfont=bf,justification=centering]{caption}
\usepackage{multirow}                            
\usepackage{float}                                    
\usepackage{subcaption}                               % Subcaption of subtables or subfigures
\usepackage{etoolbox}
\usepackage[export]{adjustbox} % figure position

% \usepackage{blindtext}				% Random text
% \usepackage{natbib}
% \usepackage[ backend=biber, style=numeric]{biblatex}
\usepackage[backend=biber, style=numeric, sorting=none]{biblatex}
\usepackage{tocbibind}

\usepackage{csquotes}
\usepackage{titlesec}
\usepackage{textcomp}
\usepackage{xurl}
\usepackage{xspace}
\usepackage{listings}
\usepackage{caption}
\usepackage{booktabs}
\usepackage{tabularx}
\usepackage{underscore}
\usepackage[svgnames]{xcolor}
\usepackage{hyperref}
\usepackage{makecell} 
\usepackage{tabularray}
\usepackage{minted}
\usepackage{subcaption}

%\usepackage[plainpages=false,pdfpagelabels,hidelinks,breaklinks=true]{hyperref} % Get nice PDF document links
% \hypersetup{
%     colorlinks,
%     linkcolor={black},
%     citecolor={blue},
%     filecolor={black},
%     urlcolor={black},
%     pdftitle={\theTitle},
%     pdfauthor={\theAuthor},
%     pdfsubject={\theDocumentType},
%     pdfkeywords={\theUniversity, \theDepartment, \theDocumentType, \theMajor},
%     pdfstartpage={1},
% }\\
% ============================================================================
% NEW COMMANDS AND ENVIRONMENTS
% ============================================================================
% redefine plain to delete page number
\newcommand{\hackplain}{\fancypagestyle{plain}{%
    \fancyhf{} % clear all header and footer fields
}}

\renewcommand{\appendixpagename}{Appendix}  % appendix name
\appto\frontmatter{\pagestyle{plain}}       % pagestyle frontmatter
\appto\mainmatter{\pagestyle{fancy}}        % pagestyle mainmatter
\appto\backmatter{\pagestyle{fancy}}        % pagestyle backmatter

%\renewcommand{\bibsetup}{\thispagestyle{empty}} % not number first page bibliography

%\renewcommand{\familydefault}{\sfdefault}				% Use sans serif font

% Environment to make a fancy dedication in the thesis
\newenvironment{dedication}{\phantom{}\begin{flushright}\begin{em}\begin{minipage}{0.5\textwidth}\raggedleft}{\end{minipage}\end{em}\end{flushright}}

% Environment to make a list without indentation
\newcounter{mycounter}
\newenvironment{noindlist}
 {\begin{list}{\arabic{mycounter}.~~}{\usecounter{mycounter} \labelsep=0em \labelwidth=0em \leftmargin=0em \itemindent=0em}}
 {\end{list}}

% Initially define all of our variables as empty
\gdef\@UniLocation{}
\gdef\@UniLogo{}
\gdef\@UniUniversity{}
\gdef\@UniThesisYear{}
\gdef\@UniMajor{}
\gdef\@UniDepartment{}
\gdef\@UniDocumentType{}
\gdef\@UniAuthor{}
\gdef\@title{}
\gdef\@UniSupervisor{}
\gdef\@subtitle{}

\newcommand{\location}[1]             {\ifx\empty#1\else \gdef\@UniLocation{#1}      \fi}
\newcommand{\logo}[1]                 {\ifx\empty#1\else \gdef\@UniLogo{#1}      \fi}
\newcommand{\university}[1]           {\ifx\empty#1\else \gdef\@UniUniversity{#1}      \fi}
\newcommand{\thesisYear}[1]           {\ifx\empty#1\else \gdef\@UniThesisYear{#1}       \fi}
\newcommand{\major}[1]                {\ifx\empty#1\else \gdef\@UniMajor{#1}                \fi}
\newcommand{\department}[1]           {\ifx\empty#1\else \gdef\@UniDepartment{#1}           \fi}
\newcommand{\documentType}[1]         {\ifx\empty#1\else \gdef\@UniDocumentType{#1}         \fi}
\renewcommand{\author}[1]             {\ifx\empty#1\else \gdef\@UniAuthor{#1}               \fi}
\renewcommand{\title}[1]              {\ifx\empty#1\else \gdef\@title{#1}                       \fi}
\newcommand{\supervisor}[1]              {\ifx\empty#1\else \gdef\@UniSupervisor{#1}  \fi}
\newcommand{\subtitle}[1]              {\ifx\empty#1\else \gdef\@subtitle{#1}  \fi}

\newcommand{\theLocation}{%
    \ifx\@UniLocation\@empty
        \PackageError{UniThesis}{'location' has not been defined}\@ehc
    \else
        \@UniLocation
    \fi
}

\newcommand{\theLogo}{%
    \ifx\@UniLogo\@empty
        \PackageError{UniThesis}{'logo' has not been defined}\@ehc
    \else
        \@UniLogo
    \fi
}

\newcommand{\theUniversity}{%
    \ifx\@UniUniversity\@empty
        \PackageError{UniThesis}{'university' has not been defined}\@ehc
    \else
        \@UniUniversity
    \fi
}

\newcommand{\theThesisYear}{%
    \ifx\UniThesisYear\@empty
        \PackageError{UniThesis}{'thesisYear' has not been defined}\@ehc
    \else
        \@UniThesisYear
    \fi
}

\newcommand{\theMajor}{%
    \ifx\@UniMajor\@empty
        \PackageError{UniThesis}{'major' has not been defined}\@ehc
    \else
        \@UniMajor
    \fi
}

\newcommand{\theDepartment}{%
    \ifx\@UniDepartment\@empty
        \PackageError{UniThesis}{'department' has not been defined}\@ehc
    \else
        \@UniDepartment
    \fi
}

\newcommand{\theDocumentType}{%
    \ifx\@UniDocumentType\@empty
        \PackageError{UniThesis}{'documentType' has not been defined}\@ehc
    \else
        \@UniDocumentType
    \fi
}

\newcommand{\theAuthor}{%
    \ifx\@UniAuthor\@empty
        \PackageError{UniThesis}{'author' has not been defined}\@ehc
    \else
        \@UniAuthor
    \fi
}

\newcommand{\theTitle}{%
    \ifx\@title\@empty
        \PackageError{UniThesis}{'title' has not been defined}\@ehc
    \else
        \@title
    \fi
}

\newcommand{\theSupervisor}{%
    \ifx\@UniSupervisor\@empty
        \PackageError{UniThesis}{'supervisor' has not been defined}\@ehc
    \else
        \@UniSupervisor
    \fi
}

\newcommand{\theSubtitle}{%
    \ifx\@subtitle\@empty
        \PackageError{UniThesis}{'supervisor' has not been defined}\@ehc
    \else
        \@subtitle
    \fi
}

% A command to control the line spacing
\newcommand{\newlinestretch}[1]{\renewcommand{\baselinestretch}{#1}\normalsize}


% Generate a phantom section to help the 'hyperref' package understand where
% a section begins, add a line to the ToC with the specified title, then
% execute the specified command (e.g., \maketitle).
\newcommand{\addtotoc}[2]{
    \phantomsection
    \addcontentsline{toc}{chapter}{#1}
    #2 \clearpage
}

% We want our Table of Contents (ToC) to be named 'Table of Contents' rather than
% just 'Contents'
\renewcommand\contentsname{Table of Contents}


\renewcommand{\maketitle}{
   \begin{titlepage}
   \newgeometry{top=2cm,bottom=4cm,right=2.5cm,left=3cm}
   \pagestyle{fancy} % do not put neither header nor footer

       \begin{center}
          \theLogo
          \newlinestretch{1.5}
          {\ }\\[12ex]

          \noindent \rule[5mm]{\linewidth}{0.5mm}
          { \LARGE  \textbf \theTitle}\\[3ex]
          { \Large \theSubtitle}\\[3ex]

          \noindent \rule[5mm]{\linewidth}{0.5mm}
          {\large by}\\[2ex]
          {\Large \textbf \theAuthor}\\[3ex]
          {\large Supervisors:}\\
          {\Large \textbf \theSupervisor}\\[3ex]

          \noindent \rule[5mm]{\linewidth}{0.5mm}
          {\large Thesis submitted in partial fulfilment for the \\
          degree of \emph{\theMajor}}\\[3ex]

          \noindent \rule[5mm]{\linewidth}{0.5mm}
          {\ }\\[7ex]
          {\large \theThesisYear}\\

       \end{center}
   \end{titlepage}
}

%A dissertation submitted in partial fulfilment for the\\
%degree of Doctor of Philosophy\\[1em]
%in the\\[1em]
%Faculty Name\\
%University Name
% ============================================================================
% ADDITIONAL PARAMETERS
% ============================================================================

% Set paragraph indention to 0.5 inches
\setlength{\parindent}{0.5in}

% Make the ToC only show Chapters and Sections
\setcounter{tocdepth}{2}

% Make subsections get numbered
\setcounter{secnumdepth}{3}

% Setup the page format.  All headers are empty.  The center footer
% contains the page number.  Also, remove the headrule from all pages.
% Finally, use the 'fancy' page style (which uses all the things we
% just setup).
\lhead{\empty}
\chead{\empty}
\rhead{\thepage}
\lfoot{\empty}
\cfoot{\empty}
\rfoot{\empty}
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0pt}

% Set the appendix to just have a letter not prepended by the main division
% number in the ToC (see the documentation for the 'appendix' package)
\renewcommand{\setthesection}{\Alph{section}}

% Setup the ToC and List of {Tables|Figures|Whatever} to
% include the ellipses between the name and the page number.  Also make
% the page number big enough so that three digit numbers can be used.
\DeclareRobustCommand{\changetochap}{%
    \renewcommand{\cftchapleader}{\cftchapfont\cftdotfill{\cftdotsep}}%
    \cftsetpnumwidth{1.5em}
%    \newgeometry{top=4cm,bottom=4cm,right=2.5cm,left=2.5cm}
}
\changetochap

% Do not enumerate page appendix title
\makeatletter
\patchcmd{\@chap@pppage}{\thispagestyle{plain}}{\thispagestyle{empty}}{}{}
\makeatother

% \addtotoc{Bibliography}{\bibliography{mendeley}}

