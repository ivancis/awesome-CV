%% Start of file `awesome-cv.cls'.
\ProvidesClass{awesome-cv}[2017/02/05 v1.6.1 Awesome Curriculum Vitae Class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

%-------------------------------------------------------------------------------
%                3rd party packages
%-------------------------------------------------------------------------------
\RequirePackage{array}
\RequirePackage{tabularx}
\RequirePackage{enumitem}
\RequirePackage{ragged2e}
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{xcolor}
\RequirePackage{ifxetex}
\RequirePackage{xifthen}
\RequirePackage{xstring}
\RequirePackage{etoolbox}
\RequirePackage{setspace}
\RequirePackage[quiet]{fontspec}
\defaultfontfeatures{Ligatures=TeX}
\RequirePackage{unicode-math}
\RequirePackage{fontawesome6}
\RequirePackage{accsupp}
\defaultfontfeatures{Renderer=HarfBuzz}

\IfFontExistsTF{Helvetica}{
  \setmainfont{Helvetica}[UprightFont=*,ItalicFont=* Oblique,BoldFont=* Bold,BoldItalicFont=* Bold Oblique]
  \setsansfont{Helvetica}[UprightFont=*,ItalicFont=* Oblique,BoldFont=* Bold,BoldItalicFont=* Bold Oblique]
  \newfontfamily\roboto{Helvetica}[UprightFont=*,ItalicFont=* Oblique,BoldFont=* Bold,BoldItalicFont=* Bold Oblique]
}{
  \setmainfont{Arial}[UprightFont=*,ItalicFont=* Italic,BoldFont=* Bold,BoldItalicFont=* Bold Italic]
  \setsansfont{Arial}[UprightFont=*,ItalicFont=* Italic,BoldFont=* Bold,BoldItalicFont=* Bold Italic]
  \newfontfamily\roboto{Arial}[UprightFont=*,ItalicFont=* Italic,BoldFont=* Bold,BoldItalicFont=* Bold Italic]
}

\renewcommand{\familydefault}{\sfdefault}

\RequirePackage[skins]{tcolorbox}
\RequirePackage{parskip}
\RequirePackage{graphicx}
\RequirePackage[hidelinks,unicode,pdfpagelabels=false]{hyperref}
\hypersetup{pdftitle={},pdfauthor={},pdfsubject={},pdfkeywords={}}
\RequirePackage{bookmark}
\RequirePackage{microtype}% Enables letterspacing via \textls

%-------------------------------------------------------------------------------
%                Layout
%-------------------------------------------------------------------------------
\newcommand*{\fontdir}[1][fonts/]{\def\@fontdir{#1}}

% Slightly more generous top margin to give the header room to breathe
\geometry{left=1.4cm, top=1.1cm, right=1.4cm, bottom=1.6cm, footskip=0.5cm}

\fancyhfoffset{0em}
\renewcommand{\headrulewidth}{0pt}
\fancyhf{}
\pagestyle{fancy}

%-------------------------------------------------------------------------------
%                Colors
%-------------------------------------------------------------------------------
\definecolor{white}{HTML}{FFFFFF}
\definecolor{black}{HTML}{000000}
\definecolor{darkgray}{HTML}{1F2937}
\definecolor{gray}{HTML}{4B5563}
\definecolor{lightgray}{HTML}{6B7280}
\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}
\definecolor{darktext}{HTML}{1F2937}
\colorlet{text}{darkgray}
\colorlet{graytext}{gray}
\colorlet{lighttext}{lightgray}
\colorlet{sectiondivider}{lightgray}

\definecolor{awesome-emerald}{HTML}{00A388}
\definecolor{awesome-skyblue}{HTML}{0395DE}
\definecolor{awesome-red}{HTML}{DC3522}
\definecolor{awesome-pink}{HTML}{EF4089}
\definecolor{awesome-orange}{HTML}{FF6138}
\definecolor{awesome-nephritis}{HTML}{27AE60}
\definecolor{awesome-concrete}{HTML}{95A5A6}
\definecolor{awesome-darknight}{HTML}{131A28}
\colorlet{awesome}{awesome-red}

\newbool{acvSectionColorHighlight}
\setbool{acvSectionColorHighlight}{true}

%-------------------------------------------------------------------------------
%                Fonts
%-------------------------------------------------------------------------------
\newcommand*{\headerfont}{\roboto\selectfont}
\newcommand*{\headerfontlight}{\roboto\fontseries{l}\selectfont}
\newcommand*{\ibmplexlight}{\fontseries{l}\selectfont}
\newcommand*{\ibmplexmedium}{\fontseries{m}\selectfont}
\newcommand*{\footerfont}{\sffamily}
\newcommand*{\bodyfont}{\sffamily}
\newcommand*{\bodyfontlight}{\sffamily\fontseries{l}\selectfont}

%-------------------------------------------------------------------------------
%                Typography scale
%
%  Design rationale (UX portfolio context):
%  - Name: 26pt bold — commanding but not excessive on A4
%  - Section titles: 13pt light — clear hierarchy without shouting
%  - Entry title: 11pt regular — one clear step below section
%  - Meta (company, date, location): 8.5pt muted — recedes appropriately
%  - Body/bullets: 9pt, leading 1.55 — comfortable reading density
%  - Summary: 9pt italic, leading 1.6 — slightly looser for paragraph text
%
%  Line heights use em so they scale with font size.
%-------------------------------------------------------------------------------

% Header
\newcommand*{\headerfirstnamestyle}[1]{{\fontsize{26pt}{1.2em}\headerfont\bfseries\color{darktext} #1}}
\newcommand*{\headerlastnamestyle}[1]{{\fontsize{26pt}{1.2em}\headerfont\bfseries\color{darktext} #1}}
\newcommand*{\headerpositionstyle}[1]{{\fontsize{9pt}{1.45em}\bodyfont\color{graytext} #1}}
\newcommand*{\headeraddressstyle}[1]{{\fontsize{8.5pt}{1.4em}\headerfont\itshape\color{lighttext} #1}}
% Header social links — 8.5pt, graytext, tight leading (line gaps set explicitly via \\[Xmm] in makecvheader)
\newcommand*{\headersocialstyle}[1]{{\fontsize{8.5pt}{8.5pt}\bodyfont\upshape\color{graytext} #1}}
\newcommand*{\headerquotestyle}[1]{{\fontsize{9pt}{1.55em}\bodyfont\itshape\color{darktext} #1}}

% Footer — same family/weight as body, no small-caps
\newcommand*{\footerstyle}[1]{{\fontsize{7.5pt}{1.3em}\bodyfont\upshape\color{lighttext} #1}}

% Section titles — 11pt semibold, tracked. Tailwind-inspired: font-semibold text-sm uppercase tracking-wide.
% Using \bfseries for weight — clear hierarchy without being heavy.
\newcommand*{\sectionstyleface}[1]{{\fontsize{11pt}{1.3em}\bodyfont\bfseries\addfontfeatures{LetterSpace=12} #1}}
\newcommand*{\sectionstyle}[1]{%
  \def\@acvSectionTmp{#1}
  \ifthenelse{\boolean{acvSectionColorHighlight}}{%
    \StrSplit{\@acvSectionTmp}{3}{\acvSectionStringAwesome}{\acvSectionStringPlain}%
      \color{awesome}\sectionstyleface{\acvSectionStringAwesome%
      \color{text}{\acvSectionStringPlain}}}%
      {\color{text}\sectionstyleface{\@acvSectionTmp}}}

\newcommand*{\subsectionstyle}[1]{{\fontsize{10pt}{1.4em}\bodyfont\scshape\textcolor{text}{#1}}}

% Summary paragraph
\newcommand*{\paragraphstyle}{\fontsize{9pt}{1.6em}\bodyfont\itshape\color{text}}

% Entry elements
% Job title: 11pt — sits clearly above meta info
\newcommand*{\entrytitlestyle}[1]{{\fontsize{11pt}{1.3em}\bodyfont\upshape\color{darktext} #1}}
% Company + date on same line: 8.5pt gray
\newcommand*{\entrypositionstyle}[1]{{\fontsize{8.5pt}{1.45em}\bodyfont\color{graytext} #1}}
% Date: 8.5pt muted — same size as company, unified meta line
\newcommand*{\entrydatestyle}[1]{{\fontsize{8.5pt}{1.45em}\bodyfont\color{lighttext} #1}}
% Location: 8.5pt muted
\newcommand*{\entrylocationstyle}[1]{{\fontsize{8.5pt}{1.45em}\bodyfont\color{lighttext} #1}}
% Bullet text: 9pt, leading 1.55 — comfortable density
\newcommand*{\descriptionstyle}[1]{{\fontsize{9pt}{1.55em}\bodyfont\upshape\color{text} #1}}

% Subentry
\newcommand*{\subentrytitlestyle}[1]{{\fontsize{8.5pt}{1.4em}\bodyfont\mdseries\color{graytext} #1}}
\newcommand*{\subentrypositionstyle}[1]{{\fontsize{8pt}{1.25em}\bodyfont\scshape\color{graytext} #1}}
\newcommand*{\subentrydatestyle}[1]{{\fontsize{8pt}{1.25em}\bodyfontlight\slshape\color{graytext} #1}}
\newcommand*{\subentrylocationstyle}[1]{{\fontsize{8pt}{1.25em}\bodyfontlight\slshape\color{awesome} #1}}
\newcommand*{\subdescriptionstyle}[1]{{\fontsize{8.5pt}{1.4em}\bodyfontlight\upshape\color{text} #1}}

% Honor
\newcommand*{\honortitlestyle}[1]{{\fontsize{9pt}{1.4em}\bodyfont\color{graytext} #1}}
\newcommand*{\honorpositionstyle}[1]{{\fontsize{9pt}{1.4em}\bodyfont\bfseries\color{darktext} #1}}
\newcommand*{\honordatestyle}[1]{{\fontsize{9pt}{1.4em}\bodyfont\color{graytext} #1}}
\newcommand*{\honorlocationstyle}[1]{{\fontsize{9pt}{1.4em}\bodyfontlight\slshape\color{awesome} #1}}

% Skills
\newcommand*{\skilltypestyle}[1]{{\fontsize{9pt}{1.45em}\bodyfont\upshape\color{darktext} #1}}
\newcommand*{\skillsetstyle}[1]{{\fontsize{9pt}{1.45em}\bodyfont\color{text} #1}}

% Cover letter
\newcommand*{\lettersectionstyleface}[1]{{\fontsize{12pt}{1.25em}\bodyfont\bfseries #1}}
\newcommand*{\lettersectionstyle}[1]{%
  \def\@acvLetterSectionTmp{#1}
  \ifthenelse{\boolean{acvSectionColorHighlight}}{%
    \StrSplit{\@acvLetterSectionTmp}{3}{\acvLetterSectionStringAwesome}{\acvLetterSectionStringPlain}%
      \color{awesome}\sectionstyleface{\acvLetterSectionStringAwesome%
      \color{text}{\acvLetterSectionStringPlain}}}%
      {\color{text}\lettersectionstyleface{\@acvLetterSectionTmp}}}
\newcommand*{\recipientaddressstyle}[1]{{\fontsize{9pt}{1.4em}\bodyfont\scshape\color{graytext} #1}}
\newcommand*{\recipienttitlestyle}[1]{{\fontsize{10.5pt}{1.4em}\bodyfont\bfseries\color{darktext} #1}}
\newcommand*{\lettertitlestyle}[1]{{\fontsize{10pt}{1.4em}\bodyfontlight\bfseries\color{darktext} \underline{#1}}}
\newcommand*{\letterdatestyle}[1]{{\fontsize{9pt}{1.4em}\bodyfontlight\slshape\color{graytext} #1}}
\newcommand*{\lettertextstyle}{\fontsize{10pt}{1.55em}\bodyfontlight\upshape\color{graytext}}
\newcommand*{\letternamestyle}[1]{{\fontsize{10pt}{1.4em}\bodyfont\bfseries\color{darktext} #1}}
\newcommand*{\letterenclosurestyle}[1]{{\fontsize{10pt}{1.4em}\bodyfontlight\slshape\color{lighttext} #1}}

%-------------------------------------------------------------------------------
%                Personal information commands
%-------------------------------------------------------------------------------
\newcommand{\photo}[2][circle,edge,left]{%
  \def\@photo{#2}
  \@for\tmp:=#1\do{%
    \ifthenelse{\equal{\tmp}{circle} \or \equal{\tmp}{rectangle}}{\let\@photoshape\tmp}{}%
    \ifthenelse{\equal{\tmp}{edge} \or \equal{\tmp}{noedge}}{\let\@photoedge\tmp}{}%
    \ifthenelse{\equal{\tmp}{left} \or \equal{\tmp}{right}}{\let\@photoalign\tmp}{}%
  }%
}
\def\@photoshape{circle}
\def\@photoedge{edge}
\def\@photoalign{left}

\newcommand*{\name}[2]{\def\@firstname{#1}\def\@lastname{#2}}
\newcommand*{\firstname}[1]{\def\@firstname{#1}}
\newcommand*{\lastname}[1]{\def\@lastname{#1}}
\newcommand*{\familyname}[1]{\def\@lastname{#1}}
\def\@familyname{\@lastname}
\newcommand*{\address}[1]{\def\@address{#1}}
\newcommand*{\position}[1]{\def\@position{#1}}
\newcommand*{\mobile}[1]{
  \def\@mobile{#1}
  \def\@teluri{tel:\@mobile}
  \StrDel{\@teluri}{ }[\@teluri]%
  \StrDel{\@teluri}{-}[\@teluri]%
  \StrDel{\@teluri}{(}[\@teluri]%
  \StrDel{\@teluri}{)}[\@teluri]%
}
\newcommand*{\whatsapp}[1]{
  \def\@whatsapp{#1}
  \def\@wameuri{https://wa.me/\@whatsapp}
  \StrDel{\@wameuri}{ }[\@wameuri]%
  \StrDel{\@wameuri}{+}[\@wameuri]%
  \StrDel{\@wameuri}{-}[\@wameuri]%
  \StrDel{\@wameuri}{(}[\@wameuri]%
  \StrDel{\@wameuri}{)}[\@wameuri]%
}
\newcommand*{\email}[1]{\def\@email{#1}}
\newcommand*{\dateofbirth}[1]{\def\@dateofbirth{#1}}
\newcommand*{\homepage}[1]{\def\@homepage{#1}}
\newcommand*{\github}[1]{\def\@github{#1}}
\newcommand*{\gitlab}[1]{\def\@gitlab{#1}}
\newcommand*{\bitbucket}[1]{\def\@bitbucket{#1}}
\newcommand*{\stackoverflow}[2]{\def\@stackoverflowid{#1}\def\@stackoverflowname{#2}}
\newcommand*{\linkedin}[1]{\def\@linkedin{#1}}
\newcommand*{\orcid}[1]{\def\@orcid{#1}}
\newcommand*{\twitter}[1]{\def\@twitter{#1}}
\newcommand*{\x}[1]{\def\@x{#1}}
\newcommand*{\mastodon}[2]{\def\@mastodoninstance{#1}\def\@mastodonname{#2}}
\newcommand*{\researchgate}[1]{\def\@researchgate{#1}}
\newcommand*{\skype}[1]{\def\@skype{#1}}
\newcommand*{\reddit}[1]{\def\@reddit{#1}}
\newcommand*{\xing}[1]{\def\@xing{#1}}
\newcommand*{\medium}[1]{\def\@medium{#1}}
\newcommand*{\kaggle}[1]{\def\@kaggle{#1}}
\newcommand*{\hackerrank}[1]{\def\@hackerrank{#1}}
\newcommand*{\telegram}[1]{\def\@telegram{#1}}
\newcommand*{\googlescholar}[2]{%
  \def\@googlescholarid{#1}%
  \ifthenelse{\equal{#2}{}}{\def\@googlescholarname{\@firstname~\@lastname}}{\def\@googlescholarname{#2}}%
}
\newcommand*{\extrainfo}[1]{\def\@extrainfo{#1}}
\renewcommand*{\quote}[1]{\def\@quote{#1}}
\newcommand*{\recipient}[2]{\def\@recipientname{#1}\def\@recipientaddress{#2}}
\newcommand*{\recipientname}[1]{\def\@recipientname{#1}}
\newcommand*{\recipientaddress}[1]{\def\@recipientaddress{#1}}
\newcommand*{\lettertitle}[1]{\def\@lettertitle{#1}}
\newcommand*{\letterdate}[1]{\def\@letterdate{#1}}
\newcommand*{\letteropening}[1]{\def\@letteropening{#1}}
\newcommand*{\letterclosing}[1]{\def\@letterclosing{#1}}
\newcommand*{\letterenclname}[1][Enclosure]{\def\@letterenclname{#1}}
\newcommand*{\letterenclosure}[2][]{%
  \ifthenelse{\equal{#1}{}}{}{\def\@letterenclname{#1}}
  \def\@letterenclosure{#2}
}

%-------------------------------------------------------------------------------
%                Spacing system
%
%  Consistent rhythm built on a 4pt base unit:
%
%  Macro                      Value   Purpose
%  ─────────────────────────────────────────────────────────────────────────
%  acvSectionTopSkip          5mm     Space ABOVE a section title.
%                                     Separates sections clearly.
%  acvSectionContentTopSkip   2.5mm   Space BELOW section title, ABOVE
%                                     first entry. Keeps title and content
%                                     visually grouped.
%  cventry internal vspace    2mm     Gap ABOVE each entry block (between
%                                     entries). Tighter than section gap
%                                     — entries belong to the same section.
%  cventry post-title gap     2mm     Space after the title/meta row,
%                                     before bullet list starts.
%  cvitems top adjust        -2mm     Pulls bullets up slightly — the
%                                     itemize environment adds its own
%                                     internal padding.
%  cvitems bottom             1mm     Tiny breath after last bullet.
%  itemsep                   2pt      Between individual bullets.
%
%  Net visual result:
%    section title → 2.5mm → entry title → meta line → 2mm → bullets
%    last bullet → 1mm → [next entry: 2mm top] → entry title …
%    last bullet → 1mm → [next section: 5mm top] → section title
%
%-------------------------------------------------------------------------------
\newcommand{\acvHeaderNameDelim}{\space}
\newcommand{\acvHeaderAfterNameSkip}{0.4mm}
\newcommand{\acvHeaderAfterPositionSkip}{0.4mm}
\newcommand{\acvHeaderAfterAddressSkip}{0mm}
\newcommand{\acvHeaderIconSep}{}
\newcommand{\acvHeaderSocialSep}{\quad\textbar\quad}
\newcommand{\acvHeaderAfterSocialSkip}{2mm}
\newcommand{\acvHeaderAfterQuoteSkip}{3mm}

\newcommand{\acvSectionTopSkip}{5mm}
\newcommand{\acvSectionContentTopSkip}{1mm}

%-------------------------------------------------------------------------------
%                Utilities
%-------------------------------------------------------------------------------
\renewcommand{\tabularxcolumn}{p}
\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\def\vhrulefill#1{\leavevmode\leaders\hrule\@height#1\hfill \kern\z@}
\newcommand*{\ifempty}[3]{\ifthenelse{\isempty{#1}}{#2}{#3}}
\newcommand{\faAlt}[3]{%
  \BeginAccSupp{ActualText={#1}}%
    \mbox{#2\acvHeaderIconSep#3}%
  \EndAccSupp{}%
}

%-------------------------------------------------------------------------------
%                CV Structure Commands
%-------------------------------------------------------------------------------
\newcommand*{\makecvheader}[1][C]{%
  \noindent
  \ifthenelse{\isundefined{\@photo}}{%
    \begin{minipage}[t]{0.65\textwidth}
      \raggedright
      \headerfirstnamestyle{\@firstname}\headerlastnamestyle{{}\acvHeaderNameDelim\@lastname}%
      \\[\acvHeaderAfterNameSkip]%
      \ifthenelse{\isundefined{\@position}}{}{\headerpositionstyle{\@position}}%
    \end{minipage}%
    \hfill
    \begin{minipage}[t]{0.32\textwidth}
      \raggedleft
      \headersocialstyle{%
        \ifthenelse{\isundefined{\@email}}{}{\href{mailto:\@email}{\underline{\@email}}}%
        \ifthenelse{\isundefined{\@homepage}}{}{\\[3.5pt]\href{https://\@homepage}{\underline{\@homepage}}}%
        \ifthenelse{\isundefined{\@linkedin}}{}{\\[3.5pt]\href{https://www.linkedin.com/in/\@linkedin}{\underline{linkedin.com/in/\@linkedin}}}%
      }%
    \end{minipage}%
  }{%
    % Photo | Name+Position | Links — three fixed columns summing to \textwidth.
    % photo=2.4cm | 3mm gap | name=flexible | 3mm gap | links=0.28\textwidth
    \setlength{\cvphotowidth}{2.4cm}%
    \setlength{\cvlinkswidth}{0.28\textwidth}%
    \setlength{\cvnamewidth}{\textwidth}%
    \addtolength{\cvnamewidth}{-\cvphotowidth}%
    \addtolength{\cvnamewidth}{-\cvlinkswidth}%
    \addtolength{\cvnamewidth}{-6mm}%
    \noindent
    \begin{minipage}[t]{\cvphotowidth}%
      \vspace{0pt}%
      \includegraphics[width=\cvphotowidth,height=\cvphotowidth,keepaspectratio]{\@photo}%
    \end{minipage}%
    \hspace{3mm}%
    \begin{minipage}[t]{\cvnamewidth}%
      \vspace{0pt}%
      \raggedright
      \headerfirstnamestyle{\@firstname}%
      \\[\acvHeaderAfterNameSkip]%
      \headerlastnamestyle{\@lastname}%
      \\[\acvHeaderAfterNameSkip]%
      \ifthenelse{\isundefined{\@position}}{}{\headerpositionstyle{\@position}}%
    \end{minipage}%
    \hspace{3mm}%
    \begin{minipage}[t]{\cvlinkswidth}%
      \vspace{0pt}%
      \raggedleft
      \headersocialstyle{%
        \ifthenelse{\isundefined{\@email}}{}{\href{mailto:\@email}{\underline{\@email}}}%
        \ifthenelse{\isundefined{\@homepage}}{}{\\[3.5pt]\href{https://\@homepage}{\underline{\@homepage}}}%
        \ifthenelse{\isundefined{\@linkedin}}{}{\\[3.5pt]\href{https://www.linkedin.com/in/\@linkedin}{\underline{linkedin.com/in/\@linkedin}}}%
      }%
    \end{minipage}%
  }%
  \vspace{5mm}% Slightly more breathing room after header before first section
}

\newcommand*{\makecvfooter}[3]{%
  \fancyfoot{}
  \fancyfoot[L]{\ifnum\value{page}>1\footerstyle{#1}\fi}
  \ifthenelse{\isempty{#3}}{%
    \fancyfoot[R]{\ifnum\value{page}>1\footerstyle{#2}\fi}%
  }{%
    \fancyfoot[R]{\ifnum\value{page}>1\footerstyle{#2~~~·~~~#3}\fi}%
  }
  \fancypagestyle{firstpage}{%
    \fancyfoot{}
    \renewcommand{\footrulewidth}{0pt}
  }
  \thispagestyle{firstpage}
}

% Section title
\newcommand{\cvsection}[1]{%
  \vspace{\acvSectionTopSkip}
  \sectionstyle{#1}
  \phantomsection
}

\newcommand{\cvsubsection}[1]{%
  \vspace{\acvSectionContentTopSkip}
  \vspace{-2mm}
  \subsectionstyle{#1}
  \phantomsection
}

% Summary paragraph
\newenvironment{cvparagraph}{%
  \vspace{\acvSectionContentTopSkip}
  \paragraphstyle
}{%
  \par
  \vspace{1.5mm}
}

% Entries container
\newenvironment{cventries}{%
  \vspace{\acvSectionContentTopSkip}
  \begin{center}
}{%
  \end{center}
}

% Single entry
% Spacing rationale:
%   - 2mm above each entry keeps entries grouped within a section
%     but visually separated from each other
%   - 2mm gap [2.5mm] after the title/meta rows before bullets
%     gives the eye a moment to parse the header before reading detail
\newcommand*{\cventry}[5]{%
  \vspace{2mm}
  \setlength\tabcolsep{0pt}
  \setlength{\extrarowheight}{0pt}
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{\textwidth - 4.5cm} R{4.5cm}}
    \ifempty{#2#3}
      {\entrytitlestyle{#1 \textemdash\ \entrydatestyle{#4}} \\[-3mm]}
      {\entrytitlestyle{#1} & \entrylocationstyle{#3} \\
      \entrypositionstyle{#2 \textemdash\ \entrydatestyle{#4}} \\[-3mm]}
    \ifstrempty{#5}{}{\multicolumn{2}{L{\textwidth}}{\descriptionstyle{#5}} \\}
  \end{tabular*}%
}

\newenvironment{cvsubentries}{\begin{center}}{\end{center}}

\newcommand*{\cvsubentry}[4]{%
  \setlength\tabcolsep{0pt}
  \setlength{\extrarowheight}{0pt}
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{\textwidth - 4.5cm} R{4.5cm}}
    \setlength\leftskip{0.2cm}
    \subentrytitlestyle{#2} & \ifthenelse{\equal{#1}{}}{\subentrydatestyle{#3}}{}
    \ifthenelse{\equal{#1}{}}{}{\subentrypositionstyle{#1} & \subentrydatestyle{#3} \\}
    \ifthenelse{\equal{#4}{}}{}{\multicolumn{2}{L{17.0cm}}{\subdescriptionstyle{#4}} \\}
  \end{tabular*}
}

\newenvironment{cvhonors}{%
  \vspace{\acvSectionContentTopSkip}
  \vspace{-2mm}
  \begin{center}
    \setlength\tabcolsep{0pt}
    \setlength{\extrarowheight}{0pt}
    \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} C{1.5cm} L{\textwidth - 4.0cm} R{2.5cm}}
}{%
    \end{tabular*}
  \end{center}
}

\newcommand*{\cvhonor}[4]{%
  \honordatestyle{#4} & \honorpositionstyle{#1}\ifempty{#2}{}{,} \honortitlestyle{#2} & \honorlocationstyle{#3} \\
}

% Skills environment — paragraph list, no category headings, gap between groups.
% Top vspace intentionally omitted here — callers (cvquadrants) control their own spacing.
\newenvironment{cvskills}{%
  \raggedright
}{%
  \par
}

\newcommand*{\cvskill}[2]{%
  % Arg #1 (category label) is intentionally ignored — no headings.
  % Arg #2 is a plain prose string; rendered as a paragraph in skillsetstyle.
  {\skillsetstyle{#2}}\par
  \vspace{3mm}% visual gap between the three skill groups
}

% Bullet list for entries
% -2mm top pulls the list flush against the entry header gap we already set (2mm via \\[2mm]).
% 2pt itemsep keeps bullets tight but distinct.
% 1.5mm bottom gives a small breath before the next entry's 2mm top.
\newenvironment{cvitems}{%
  \vspace{0mm}
  \begin{justify}
  \begin{itemize}[leftmargin=1.5ex, nosep, noitemsep, topsep=0pt]
    \setlength{\parskip}{0pt}
    \setlength{\itemsep}{2pt}
    \renewcommand{\labelitemi}{\bullet}
}{%
  \end{itemize}
  \end{justify}
  \vspace{0mm}
}

%-------------------------------------------------------------------------------
%  Four-quadrant bottom section
%  Layout: 2×2 grid — Skills (TL), Education (TR), More About Me (BL), Graph (BR)
%  All four cells are equal width (0.47\textwidth each) with a fixed column gap.
%  Vertical rhythm: top row and bottom row separated by \cvquadrantRowGap.
%
%  Usage in .tex:
%    \cvquadrants
%      {skills content}        % top-left:  \cvskill blocks
%      {education content}     % top-right: \cventries block
%      {more about me text}    % bottom-left: paragraph
%      {path/to/graph.png}     % bottom-right: image path
%
%  The section titles (Skills, Education) are typeset inside the cells using
%  the normal \cvsection style so they match the rest of the document.
%-------------------------------------------------------------------------------
\newlength{\cvquadrantColWidth}
\newlength{\cvquadrantGap}
\setlength{\cvquadrantGap}{5mm}
% Header photo layout lengths (declared here, set in \makecvheader)
\newlength{\cvphotowidth}
\newlength{\cvlinkswidth}
\newlength{\cvnamewidth}

\newcommand{\cvquadrants}[4]{%
  \setlength{\cvquadrantColWidth}{0.5\textwidth}%
  \addtolength{\cvquadrantColWidth}{-0.5\cvquadrantGap}%
  \vspace{\acvSectionTopSkip}%
  \noindent
  % ── TOP ROW: Skills (left) | Education (right) ───────────────────────────
  \begin{minipage}[t]{\cvquadrantColWidth}
    \raggedright
    \sectionstyle{Skills}\par
    \vspace{1.5mm}
    #1%
  \end{minipage}%
  \hspace{\cvquadrantGap}%
  \begin{minipage}[t]{\cvquadrantColWidth}
    \raggedright
    \sectionstyle{Education}\par
    \vspace{1.5mm}
    #2%
  \end{minipage}%
  \par\vspace{7mm}%
  % ── BOTTOM ROW: More about me (left) | Graph (right) ─────────────────────
  \noindent
  \begin{minipage}[t]{\cvquadrantColWidth}
    \raggedright
    \sectionstyle{More about me}\par
    \vspace{2mm}
    {\paragraphstyle #3\par}%
  \end{minipage}%
  \hspace{\cvquadrantGap}%
  \begin{minipage}[t]{\cvquadrantColWidth}
    \centering\vspace{0pt}%
    \includegraphics[width=\linewidth,keepaspectratio]{#4}%
  \end{minipage}%
  \vspace{3mm}%
}

%-------------------------------------------------------------------------------
%                Cover Letter
%-------------------------------------------------------------------------------
\newenvironment{cvletter}{\lettertextstyle}{}

\newcommand{\lettersection}[1]{%
  \par\addvspace{2.5ex}
  \phantomsection{}
  \lettersectionstyle{#1}
  \color{sectiondivider}\vhrulefill{0.9pt}
  \par\nobreak\addvspace{0.4ex}
  \lettertextstyle
}

\newcommand*{\makelettertitle}{%
  \vspace{8.4mm}
  \setlength\tabcolsep{0pt}
  \setlength{\extrarowheight}{0pt}
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{\textwidth - 4.5cm} R{4.5cm}}
    \recipienttitlestyle{\@recipientname} & \letterdatestyle{\@letterdate}
  \end{tabular*}
  \begin{singlespace}
    \recipientaddressstyle{\@recipientaddress} \\\\
  \end{singlespace}
  \ifthenelse{\isundefined{\@lettertitle}}{}{\lettertitlestyle{\@lettertitle} \\}
  \lettertextstyle{\@letteropening}
}

\newcommand*{\makeletterclosing}{%
  \vspace{3.4mm}
  \lettertextstyle{\@letterclosing} \\\\
  \letternamestyle{\@firstname\ \@lastname}
  \ifthenelse{\isundefined{\@letterenclosure}}{\\}{%
    \\\\\\
    \letterenclosurestyle{\@letterenclname: \@letterenclosure} \\
  }
}