%
%   LaTeX class file for Jurnal Rekayasa Proses (JRekPros). This is the 
%   English version and should be used for managing articles that 
%   are English-only.
%   Copyright 2022–2025 Joaquim Baeta <mail@joaquimbaeta.com>
%                for Jurnal Rekayasa Proses
%
%   This program is free software: you can redistribute it and/or modify
%   it under the terms of the GNU General Public License as published by
%   the Free Software Foundation, either version 3 of the License, or
%   (at your option) any later version.
%
%   This program is distributed in the hope that it will be useful,
%   but WITHOUT ANY WARRANTY; without even the implied warranty of
%   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%   GNU General Public License for more details.
%
%   You should have received a copy of the GNU General Public License
%   along with this program.  If not, see <https://www.gnu.org/licenses/>.
%
%   Changes in version 1.1:
%   
%   - Updated TeX Live version to 2024.
%   - Fixed the spacing error in header (not sure of the cause).
%   - Moved metadata-related code to the .cls file instead.
%   - Reordered some packages for better compatibility during loading.
%   - Removed fontenc (redundant).
%   - Replaced mathpazo with unicode-math (better compatibility with fontspec).
%	- Using STIX Two Math for math environments instead of Pazo.
%   - Removed gensymb; these symbols should already be in unicode-math.
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{base/jrekpros}[2025/05/06, version 1.1]
\AtEndOfClass{\RequirePackage{microtype}} % For better typography

% Options for element switching
\RequirePackage{xifthen} % For if arguments
    \DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}}
    \ProcessOptions*

\LoadClass{extarticle} % Support more font sizes

% Page structure
\RequirePackage[inner=18mm,%
                outer=18mm,%
                top=18mm,%
                bottom=18mm,%
                headheight=8mm,%
                headsep=6mm,%
                footskip=8mm,%
                a4paper]{geometry}% Control margins
	\setlength{\columnsep}{8mm} % Distance between columns
\RequirePackage{flushend} % Balance the article's last page

% Paragraph structure
\RequirePackage{setspace}
    \setstretch{1.197} % Body leading
	\edef\restoreparindent{\parindent=\the\parindent\relax} % Maintain indents when using parskip package with \restoreparindent
\RequirePackage{parskip}
	\setlength{\parskip}{0pt plus 0.5pt minus 0pt} % Maintain spaces between paragraphs
	\restoreparindent % Restore indents when using parskip package
	\setlength{\parindent}{16pt} % Indent length
\RequirePackage{enumitem}
	\setlist[enumerate]{noitemsep,labelindent=2pt,style=multiline,leftmargin=*,label=\arabic*.} % Remove separation between ordered list items

% Language and fonts
\RequirePackage[fontsize=8.5pt]{scrextend} % Set default font size to 8.5pt (nb. this is a KOMA-Script package)
\RequirePackage[english]{babel} % Set language to English 
\RequirePackage{fontspec} % Set fonts
	\setmainfont[
        Path = base/fonts/,
        Extension = .ttf,
        UprightFont = *-Regular,
        ItalicFont = *-Italic,
        BoldFont = *-Bold,
        BoldItalicFont = *-BoldItalic,
    ]{Bitter}
	\setsansfont[
        Path = base/fonts/,
        Extension = .ttf,
        UprightFont = *-Regular,
        ItalicFont = *-Italic,
        BoldFont = *-Bold,
        BoldItalicFont = *-BoldItalic,
    ]{Aller}
\RequirePackage{amsmath} % For math environments
\RequirePackage{unicode-math} % Handle math environments
    \setmathfont{STIX Two Math}
\RequirePackage{chemfig} % Render chemical formulae
\RequirePackage{datetime} % Dates
	\newdateformat{monthyeardate}{%
		\monthname[\THEMONTH] \THEYEAR}
\RequirePackage{url} % For urls
\RequirePackage{xurl} % Load xurl package to break urls at the end of lines
\RequirePackage[pdfusetitle,%
				colorlinks=true,%
				allcolors=flamingo]{hyperref} % For links; includes colours of links
\RequirePackage{hyperxmp} % Enable extra PDF metadata options

% Font styles
	\renewcommand{\titlefont}{\normalfont\sffamily\fontsize{15}{18}\selectfont} % Article title
	\newcommand{\basesansfont}{\normalfont\sffamily\fontsize{8.5}{10}\selectfont} % Abstract, keywords, genesis, and anything else that needs 8.5-point Aller
	\renewcommand\UrlFont{\rmfamily} % Make \url adhere to default body font (use \url only in references)
\RequirePackage{authblk} % Authors and affiliations
	\setlength{\affilsep}{10pt} % Spacing between list of authors and affiliations
	\renewcommand\Authfont{\normalfont\sffamily\fontsize{10}{12}\selectfont} % Authors
	\renewcommand\Affilfont{\normalfont\sffamily\fontsize{8.5}{10}\selectfont} % Affiliations
	\renewcommand\AB@affilsepx{\\ \protect\Affilfont}
	\renewcommand\AB@authnote[1]{\textsuperscript{\mdseries\upshape#1}}
	\renewcommand\AB@affilnote[1]{\textsuperscript{\upshape#1}}
	\renewcommand\Authands{, } % Remove comma when there are only two authors

% Graphics, tables, and figures
\RequirePackage{graphicx,xcolor}
	\definecolor{black}{RGB}{0,0,0} % Base colour
	  \definecolor{flamingo}{HTML}{F45B2D} % Primary colour
    \definecolor{sirocco}{HTML}{627b7B} % Primary accent
    \definecolor{big-stone}{HTML}{37424A} % Secondary accent
    \definecolor{tower-gray}{HTML}{A9BDBF} %  Banner text colour
    \definecolor{mystic}{HTML}{E2EBED} % Specialised page background colour
\RequirePackage{adjustbox} % Control boxes
\RequirePackage{pdfpages} % Enable presentation of vectorised journal logo in the header of the first page
\RequirePackage{colortbl} % Enable changing colours of tables
\RequirePackage[font={sf,footnotesize},%
                labelfont={color=flamingo},%
                labelsep=period,%
                figurename=FIGURE,%
                tablename=TABLE,%
                singlelinecheck=off,]{caption} % Captions
\RequirePackage{subcaption}
\RequirePackage{tabularx}
% Table style
	\newenvironment{tableminipage}[1]{\begin{minipage}{#1}\renewcommand  \footnoterule{ \kern -1ex}}{\end{minipage}}
	\arrayrulecolor{black} % Colour of horizontal rules
 	\renewcommand{\arraystretch}{1.5} % Table leading
	\captionsetup[table]{position=below} % Reduce spacing below caption
\RequirePackage{booktabs}
\RequirePackage{siunitx} % Enable S columns
    \sisetup{detect-all} 
\RequirePackage{multirow} % Allow multirows
\RequirePackage{tikz} % Allow tikz drawings
	\usetikzlibrary{calc}
\RequirePackage{changepage}
\RequirePackage{afterpage} % Prevent content ending abruptly when page is cleared
\RequirePackage{rotating} % For sideways tables and figures
\RequirePackage{stfloats} % Improve figure placement in two column environment
\RequirePackage[absolute,overlay]{textpos} % Enable absolute positioning of figures
	\setlength{\TPHorizModule}{1mm}
	\setlength{\TPVertModule}{1mm}
	\textblockorigin{0mm}{0mm} % Start everything near the top-left corner

% Style equations
    \AtBeginDocument{%
        \abovedisplayskip=4pt plus 2pt minus 2pt%
        \abovedisplayshortskip=4pt plus 2pt minus 2pt%
        \belowdisplayskip=12pt plus 2pt minus 2pt%
        \belowdisplayshortskip=12pt plus 2pt minus 2pt%
    }

% Enable editing of article information in main.tex
	\newcommand{\articleinformation}[1]{\def\articleinformation{#1}} % Volume, issue, year, and pages
	\newcommand{\articleinformationtruncated}[1]{\def\articleinformationtruncated{#1}} % Truncated volume number, issue, and pages
	\newcommand{\articletype}[1]{\def\articletype{\basesansfont\textcolor{flamingo}{#1}}} % Article type
    \newcommand{\authorheader}[1]{\def\authorheader{#1}} % Author(s)
    \newcommand{\email}[1]{\def\email{#1}} % Corresponding author's email address
	\newcommand{\articledoi}[1]{\def\articledoi{#1}} % DOI
	\newcommand{\submitted}[1]{\def\submitted{#1}} % Date article was submitted
	\newcommand{\revised}[1]{\def\revised{#1}} % Date article was revised
	\newcommand{\accepted}[1]{\def\accepted{#1}} % Date article was accepted

% Manage abstract content    
    \newenvironment{abstractcontent}[1]{\setlength{\parskip}{2ex plus3pt minus2pt}\setlength{\parindent}{0pt}{#1}}{}
    % Style headings in abstracts and keywords
    \newcommand{\objective}{\basesansfont\textcolor{flamingo}{OBJECTIVES}}
    \newcommand{\methods}{\basesansfont\textcolor{flamingo}{METHODS}}
    \newcommand{\results}{\basesansfont\textcolor{flamingo}{RESULTS}}
    \newcommand{\conclusions}{\basesansfont\textcolor{flamingo}{CONCLUSIONS}}
    \newcommand{\keywords}{\basesansfont\textcolor{flamingo}{KEYWORDS}}
    \newcommand{\tujuan}{\basesansfont\textcolor{flamingo}{TUJUAN}}
    \newcommand{\metode}{\basesansfont\textcolor{flamingo}{METODE}}
    \newcommand{\hasil}{\basesansfont\textcolor{flamingo}{HASIL}}
    \newcommand{\kesimpulan}{\basesansfont\textcolor{flamingo}{KESIMPULAN}}
    \newcommand{\katakunci}{\basesansfont\textcolor{flamingo}{KATA KUNCI}}

% Headers and footers
\RequirePackage{fancyhdr} % Create custom header/footer
    \pagestyle{fancy}
% Main header style
    \fancyhead[LO]{\sffamily\fontsize{8}{10}\selectfont\textcolor{sirocco}{\authorheader}}
    \fancyhead[RE]{\sffamily\fontsize{8}{10}\selectfont\textcolor{sirocco}{DOI \articledoi}}
    \fancyhead[LE,RO]{\sffamily\fontsize{8}{10}\selectfont\textcolor{sirocco}{Jurnal Rekayasa Proses \articleinformationtruncated}}
    \renewcommand{\headrulewidth}{0pt} % No header line 
% Main footer style
	\lfoot{}
	\cfoot{}
	\rfoot{}
	\fancyfoot[RO,LE]{\sffamily\fontsize{8}{10}\selectfont\textcolor{sirocco}{\thepage\ }} % Page number
	\fancyfoot[RE]{}
	\fancyfoot[LO]{}
	\renewcommand{\footrulewidth}{0pt} % No footer line
\RequirePackage{totpages} % Page numbers
% Header and footer of first page
	\fancypagestyle{firststyle}{%
        \renewcommand{\headrulewidth}{0pt} % No header line 
        \fancyhead[L]{}%
        \fancyhead[R]{}%       
        \fancyfoot[L]{\vspace{-2.5mm}\sffamily\fontsize{8}{10}\selectfont
        \textcolor{sirocco}{*Correspondence: \href{mailto:\email}{\email}}}
        \fancyfoot[R]{\vspace{-2.5mm}\sffamily\fontsize{8}{10}\selectfont\textcolor{sirocco}{\copyright\hspace{1pt} The Author(s) \the\year, under the terms of a \href{https://creativecommons.org/licenses/by-sa/4.0/}{CC BY-SA 4.0} license.}}
    }

% Sectioning 
	\setcounter{secnumdepth}{3} % Number sections, subsections, and subsubsections
	\setcounter{tocdepth}{3} % If table of contents is shown, both sections and subsections will be listed
\RequirePackage[explicit]{titlesec} % Better handling of section titles
	\titleformat{\section} % Formatting of section titles
 		{\color{flamingo}\raggedright\normalfont\sffamily\fontsize{9}{10}\selectfont}
		{\thesection.}
		{0.5em}
		{\MakeUppercase{#1}}
		[]
	\titleformat{name=\section,numberless} % Formatting of unnumbered section titles
		{\color{flamingo}\raggedright\normalfont\sffamily\fontsize{9}{10}\selectfont}
		{}
		{0em}
		{#1}
		[]
	\titleformat{\subsection} % Formatting of subsection titles
		{\color{flamingo}\raggedright\normalfont\sffamily\fontsize{9}{10}\selectfont}
		{\thesubsection}
		{0.5em}
		{#1}
		[]
	\titleformat{\subsubsection} % Formatting of subsubsection titles
		{\color{flamingo}\raggedright\normalfont\sffamily\fontsize{9}{10}\selectfont}
		{\thesubsubsection}
		{0.5em}
		{#1}
		[]
	\titleformat{\paragraph}[runin] % Formatting of paragraph titles
		{\bfseries}
		{}
		{0em}
		{#1}
	\titlespacing*{\section}{0pc}{3ex \@plus4pt \@minus3pt}{6pt} % Spacing of section titles
	\titlespacing*{\subsection}{0pc}{2.5ex \@plus3pt \@minus2pt}{4pt} % Spacing of subsection titles
	\titlespacing*{\subsubsection}{0pc}{2.5ex \@plus3pt \@minus2pt}{4pt} % Spacing of subsubsection titles
	\titlespacing*{\paragraph}{0pc}{1.5ex \@plus2pt \@minus1pt}{2pt} % Space after paragraph titles

% References
\RequirePackage[round]{natbib} % Use the Natbib package
	\bibpunct{(}{)}{;}{author-year}{}{,} % Citation punctuation
	\bibliographystyle{base/cse} % Use cse.bst
	\addto{\captionsenglish}{\renewcommand{\refname}{REFERENCES}}
	\setlength{\bibsep}{0pt plus 0.5pt minus 0pt} % Spacing between each reference
	\setlength{\bibhang}{16pt} % Reference indentation
	\setcitestyle{aysep={}}

% Set structure of first page
\renewcommand{\@maketitle}{
    \bgroup\setlength{\parindent}{0pt}%
    \vspace{-12mm}%
    \includepdf[offset=0 133.5mm]{base/banner.pdf}%
    \vskip10.3mm%
    \begin{flushright}
        \basesansfont\textcolor{tower-gray}{\articleinformation\hskip42mm}
    \end{flushright}
    \vskip4.4mm%
	\begin{flushleft}
    {%
        \vskip7mm%
        \articletype%
        \vskip0mm%
		{\titlefont \@title\par} % Title
		\vskip5mm%
		{\@author\par} % Author(s)
        \vskip3mm%
        {\basesansfont\textcolor{sirocco}{Received \submitted; revised \revised; accepted \accepted}}%
        \vskip9mm%
	}% 
	\end{flushleft}\egroup
}

% Add PDF metadata   
    \DeclareRobustCommand{\<}[1]{#1}%
    \pdfstringdefDisableCommands{%
        \let\kern\relax
        \let\hskip\relax
        \let\\\space
        \let\affilsep\space
        \let\leavevmode@ifvmode\relax
        \let\<\relax
        \let\rlap\relax
        \let\textbf\@firstofone
        \let\textit\@firstofone
        \let\emph\@firstofone
        \let\underline\@firstofone
        \let\textsuperscript\@gobble
        \let\@textsuperscript\@gobble
        \let\textsubscript\@gobble
    }
    \AtBeginDocument{%
        \makeatletter
        \hypersetup{%
            pdftitle={\@title},%
 		    pdfauthor={\authorheader},%
    		pdfcopyright={Copyright © \the\year{} THE AUTHORS. Published under a Creative Commons Attribution-ShareAlike 4.0 International license.}, % Copyright
    		pdflicenseurl={https://creativecommons.org/licenses/by-sa/4.0/} % Link to license
    	}
        \makeatother
    }