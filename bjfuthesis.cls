%
% Copyright 2021 Liu Changxin <liuchx@hotmail.com> 
%
% Licensed under the GNU General Public License v3.0 (the "License");
% you may not use this file except in compliance with the License.
% You may obtain a copy of the License at
%
%     https://www.gnu.org/licenses/gpl-3.0.html
%
% Unless required by applicable law or agreed to in writing, software
% distributed under the License is distributed on an "AS IS" BASIS,
% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
% See the License for the specific language governing permissions and
% limitations under the License.
%

\NeedsTeXFormat{LaTeX2e}[2020/10/01]
\newcommand*\@iflatexlater{\@ifl@t@r\fmtversion}
\@iflatexlater{2020/10/01}{}{\ClassError{bjfuthesis}{The version of LaTeX you installed does not meet the minimum version requirements}}
\RequirePackage{iftex}
\ifXeTeX\else\ClassError{bjfuthesis}{XeLaTeX is required to compile this document}\fi
\def\header@text{北京林业大学本科毕业论文}
\def\keywords@label@zh{关键词：}
\def\keywords@label@en{Keywords: }
\def\chartnote@label{注：}
\ProvidesClass{bjfuthesis}[2021/07/01 A thesis class for Beijing Forestry University]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions*
\LoadClass[a4paper,oneside,fontset=none]{ctexbook}
\RequirePackage{pdfpages,graphicx}
\RequirePackage[style=gb7714-2015]{biblatex}
\RequirePackage{silence,bicaption}
\DeclareCaptionFormat{bjfucaption}{\textbf{\fontsize{9}{21}\selectfont#1#2#3}}
\captionsetup{format=bjfucaption,skip=0pt,labelsep=space}
\captionsetup[figure][bi-second]{name=Figure}
\captionsetup[table][bi-second]{name=Table}
\RequirePackage{amsmath}
\setlength\voffset{-10.4mm}
\setlength\topmargin{0mm}
\setlength\textheight{242mm}
\setlength\footskip{10mm}
\setlength\textwidth{155mm}
\setlength\oddsidemargin{4.6mm}
\setlength\bibitemsep{0pt}
\setlength{\fboxsep}{0pt}
\setlength{\fboxrule}{1pt}
\setlength{\@fptop}{0pt}
\RequirePackage{etoolbox}
\setmainfont{Times New Roman}
\setCJKmainfont[AutoFakeBold]{SimSun}
\setCJKmonofont{SimSun}
\newCJKfontfamily\kaiti{KaiTi}
\renewcommand*{\bibfont}{\fontsize{10.5}{21}\selectfont}
\linespread{1}
\emergencystretch=1em
\RequirePackage{amssymb}
\renewcommand\fps@figure{htbp}
\renewcommand\fps@table{htbp}
\WarningFilter*{latex}{Text page \thepage\space contains only floats}
\NewCommandCopy\oldfigure\figure
\def\figure{\@ifnextchar[\figure@i \figure@ii}
\def\figure@i[#1]{\oldfigure[#1]\centering}
\def\figure@ii{\oldfigure\centering}
\NewCommandCopy\oldtable\table
\def\table{\@ifnextchar[\table@i \table@ii}
\def\table@i[#1]{\oldtable[#1]\centering\fontsize{9}{16}\selectfont}
\def\table@ii{\oldtable\centering\fontsize{9}{16}\selectfont}
\patchcmd{\@verbatim}{\verbatim@font}{\verbatim@font\fontsize{10.5}{21}\selectfont}{}{}
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\fancyhead[C]{\fontsize{9}{12}\selectfont \header@text}
\fancyfoot[C]{\thepage}
\renewcommand\headrulewidth{.5pt}
\fancypagestyle{plain}{\fancyhead[C]{\fontsize{9}{12}\selectfont\header@text}\renewcommand\headrulewidth{.5pt}}
\renewcommand\floatpagefraction{1}
\RequirePackage{titlesec}
\titleformat{\chapter}{\centering\fontsize{16}{30}\bfseries}{\thechapter}{.5em}{}
\titleformat{\section}{\fontsize{14}{37}\bfseries}{\thesection}{.5em}{}
\titleformat{\subsection}{\fontsize{12}{21}\bfseries}{\thesubsection}{.5em}{}
\titlespacing{\chapter}{0pt}{0pt}{10pt}
\titlespacing{\section}{0pt}{0pt}{3pt}
\titlespacing{\subsection}{0pt}{0pt}{0pt}
\RequirePackage{booktabs}
\ExecuteBibliographyOptions{gbpub=false}
\RequirePackage{titletoc}
\ctexset{chapter/number=\arabic{chapter},chapter/name={}}
\titlecontents{chapter}[0em]{\fontsize{10.5}{21}\bfseries}{\thecontentslabel~}{\thecontentslabel}{\hspace{.5em}\titlerule*{.}\contentspage}
\titlecontents{section}[1em]{\fontsize{10.5}{21}}{\thecontentslabel~}{\thecontentslabel}{\hspace{.5em}\titlerule*{.}\contentspage}
\titlecontents{subsection}[2em]{\fontsize{10.5}{21}}{\thecontentslabel~}{\thecontentslabel}{\hspace{.5em}\titlerule*{.}\contentspage}
\renewcommand\topfraction{1}
\renewcommand\bottomfraction{1}
\renewcommand\textfraction{0}
\RequirePackage[hidelinks]{hyperref}

\letbibmacro{oldtitle}{title}
\renewbibmacro*{title}{%
\ifentrytype{inproceedings}{
  \ifboolexpr{
    test {\iffieldundef{title}}
    and
    test {\iffieldundef{subtitle}}
  }
    {}
    \printtext[title]{%
       \printfield[titlecase]{title}}}{\usebibmacro{oldtitle}}}
\letbibmacro{oldbooktitle}{booktitle}
\renewbibmacro*{booktitle}{%
\ifentrytype{inproceedings}{
  \ifboolexpr{
    test {\iffieldundef{booktitle}}
    and
    test {\iffieldundef{booksubtitle}}
  }
    {}
    {\printtext[booktitle]{\bibtitlefont%
       \printfield[titlecase]{booktitle}\printtext{[C]} %
       \setunit{\subtitlepunct}%
       \printfield[titlecase]{booksubtitle}}%
     \newunit
     \setunit{\subtitlepunct}}%
  \printfield{booktitleaddon}}{\usebibmacro{oldbooktitle}}}
\DeclareBibliographyDriver{inproceedings}{%
  \usebibmacro{bibindex}%
  \usebibmacro{begentry}%
  \usebibmacro{author/translator+others}%
  \setunit{\printdelim{nametitledelim}}\newblock
  \usebibmacro{title}\printtext{[A]} 
   \unspace
  \usebibmacro{in:}%
  \usebibmacro{editor}%
  \newunit\newblock
  \usebibmacro{maintitle+booktitle}%%
  \newunit\newblock
  \usebibmacro{event+venue+date}%
  \newunit\newblock
  \newunit
  \printfield{volumes}%
  \newunit\newblock
  \usebibmacro{series+number}%
  \newunit\newblock
  \printfield{note}%
  \newunit\newblock
  \printlist{organization}%
  \newunit
  \usebibmacro{publisher+location+date}%
  \newunit\newblock
  \usebibmacro{chapter+pages}%
  \newunit\newblock
  \iftoggle{bbx:isbn}
    {\printfield{isbn}}
    {}%
  \newunit\newblock
  \usebibmacro{doi+eprint+url}%
  \newunit\newblock
  \usebibmacro{addendum+pubstate}%
  \setunit{\bibpagerefpunct}\newblock
  \usebibmacro{pageref}%
  \newunit\newblock
  \iftoggle{bbx:related}
    {\usebibmacro{related:init}%
     \usebibmacro{related}}
    {}%
  \usebibmacro{finentry}}

\newenvironment{abstract}{\kaiti}{\vskip \baselinestretch\baselineskip\par}
\newcommand\keywordscn[1]{\noindent\fontsize{12}{21}\selectfont\textbf{\keywords@label@zh}#1\par}
\newcommand\keywordsen[1]{\noindent\fontsize{12}{21}\selectfont\textbf{\keywords@label@en}#1\par}
\NewCommandCopy\oldfrontmatter\frontmatter
\renewcommand\frontmatter{\oldfrontmatter\renewcommand\thepage{\Roman{page}}\fontsize{12}{21}\selectfont}
\NewCommandCopy\oldmainmatter\mainmatter
\renewcommand\mainmatter{\oldmainmatter\fontsize{12}{21}\selectfont}
\newcommand\chartnote[1]{\fontsize{9}{21}\selectfont\\\begin{flushleft}\chartnote@label#1\end{flushleft}}
\NewCommandCopy\oldbackmatter\backmatter
\renewcommand\backmatter{\oldbackmatter\fontsize{10.5}{21}\selectfont}
\NewCommandCopy\oldprintbibliography\printbibliography
\renewcommand\printbibliography{\oldprintbibliography[heading=bibintoc]}
\endinput
