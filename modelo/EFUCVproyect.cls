%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%  Clase para elaborar Trabajos de Grado (TEG), en la Escuela de Física de la UCV
%%%%  Autor: José Antonio López.
%%%%  Escrito "from scratch" pero basado-inspirado en ucvtesis.cls desarrollado por Alberto Bellorín, modificado por Emilio Lazo en el año 2007 (esta versión es ultrasimplificada)
%%%% licencia de uso: Attribution 4.0 International (CC BY 4.0)
%%%% el marco azul de la tapa del libro fue creado por Alberto Bellorin
%%%% el logo de la UCV fue tomado del manual de imagen de la Facultad de Ciencias http://www.ciens.ucv.ve/coordad/manimagen.html en el año 2014
%%%% el logo de la Escuela de Física fue reproducido por José Antonio López, manteniendo todas las dimensiones, a partir de una copia de baja definición.
% San Antonio de Los Altos, 18 de mayo de 2015
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%															%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%% 						Use pdflatex!						%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%															%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%		para generar la biblografía: pdflatex + bibtex + pdflatex		%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%															%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%  escrito y probado en texmaker 3.2 y 3.4, bajo ubuntu 12.04		%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%															%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%	probado en el terminal con $pdflatex lorem.tex 			%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%							  $bibtex	lorem.aux			%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%	 está libre de errores en las condiciones descritas  	%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%% 								 							%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%% recomedación: actualizar TexLive antes de usar EFUCVtesis %%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%preámbulo estándar
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{EFUCVproyect}[20/05/2015 Escuela de Fisica UCV Tesis Versión 1.0]

%% Article options
\DeclareOption{12pt}{
  \PassOptionsToClass{\CurrentOption}{article}
}

%% Custom package options
\DeclareOption{sansserif}{
  \PassOptionsToPackage{\CurrentOption}{paxcommands}
}
\DeclareOption{neverindent}{
  \PassOptionsToPackage{\CurrentOption}{paxcommands}
}

%% Fallback
\DeclareOption*{
  \ClassWarning{EFUCVreport}{Unknown option '\CurrentOption'}
}

%% Execute default options
\ExecuteOptions{10pt}

%% Process given options
\ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Tamaño de letra (12), impresión a dos caras en papel carta, basado en el class book
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Load base
\LoadClass[12pt,twoside,letterpaper]{article}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% inputenc utf8 para poner los acentos, babel para nombrar las secciones en español, 
%% ifthen para usar  condicionales
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Load additional packages and commands.
\RequirePackage[utf8]{inputenc}
\RequirePackage[spanish]{babel}
\RequirePackage{ifthen}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% mhchem se usa para escribir fórmulas químicas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[version=3]{mhchem}

%%%%%%%%%%%%%%%%%%%%%%%
%% Los siguientes comandos pasan la información sobre titulo, autor, jurados, etc; 
%% cargada en el documento maestro
%%%%%%%%%%%%%%%%%%%%%%%

%% Comando '\titulo' del trabajo de grado
%\def\titulo#1{\gdef\@titulo{#1}}
%\newcommand{\tesistitulo}{\@titulo}

\newcommand{\titulo}[1]{
\newcommand{\tesistitulo}{#1}
}

%% Comando '\autor'
\newcommand{\autor}[3]{
\newcommand{\tesisautor}{#1 }
\newcommand{\tesisautorgen}{#2}
\newcommand{\tesisautoremail}{#3}
}
%% Comando '\laboratorio'
\newcommand{\laboratorio}[1]{
\newcommand{\lab}{#1}
}
%% Comando '\centro'
\newcommand{\centro}[1]{
\newcommand{\centrolab}{#1}
}
%% Comando '\numproy'
\newcommand{\numproy}[1]{
\newcommand{\numerodelproyecto}{#1 }
}
%% Comando '\tutorA'
%\newcommand{\tutorA}[5]{
%\newcommand{\nombretutorA}{#1}
%\newcommand{\generotutorA}{#2}
%\newcommand{\titulotutorA}{#3}
%\newcommand{\afiliaciontutorA}{#4}
%\newcommand{\cedulatutorA}{#5}
%}
%% Comando '\tutorB'
%\newcommand{\tutorB}[5]{
%\newcommand{\nombretutorB}{#1}
%\newcommand{\generotutorB}{#2}
%\newcommand{\titulotutorB}{#3}
%\newcommand{\afiliaciontutorB}{#4}
%\newcommand{\cedulatutorB}{#5}
%}
%% Indica si hay dos tutores o uno solo "si" para dos tutores. Para cualquier otro valor toma un tutor
%\newcommand{\dostutores}[1]{
%\newcommand{\Dtutores}{#1}
%}
%% Designación de tutor o tutora según el género 
%\newcommand{\designaciontutor}[1]{
%\ifthenelse{\equal{#1}{m}}
%   		{{Tutor}}
%   		{\ifthenelse{\equal{#1}{f}}
%   		{{Tutora}}
%   		{{\bf Error! designación de genero de tutor no admitida. Use letras minúculas m o f}}}
%}
%% Comando '\tesisanho' del trabajo de grado
%\def\anho#1{\gdef\@anho{#1}}
%\newcommand{\tesisanho}{\@anho}
\newcommand{\anho}[1]{
\newcommand{\tesisanho}{#1}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Formatea la carta del tutor. Se usa cuando el TEG toma la opción \veredicto{borrador}
%% ver: http://tex.stackexchange.com/questions/111016/how-to-embed-a-letter
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{environ}
\NewEnviron{letter}{%
\begin{quote}
\begin{minipage}[c][20cm][c]{\linewidth}
\setlength{\parskip}{\baselineskip}
\BODY
\end{minipage}
\end{quote}
}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% opciones de portada
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\RequirePackage{pdfpages}
%
\RequirePackage{eso-pic}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Coloca marco azul en tapa del libro
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\newcommand\BackgroundPic{%
\put(0,0){%
\parbox[b][\paperheight]{\paperwidth}{%
\vfill
\centering
\includegraphics[width=\paperwidth,height=\paperheight,keepaspectratio]{EFUCVtesis/imagenes/ucvtesis-marco_fisica.pdf}%
\vfill
}}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% comando que hace la portada enmarcada
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\portada}{
\AddToShipoutPicture*{\BackgroundPic}
\textoportada{0.67cm}{3ex}{16.25cm} %textoportada está definido mas abajo
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% comando que hace la primera página del libro
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\primerapagina}{
\setcounter{page}{1}
\textoportada{0cm}{3ex}{15cm}
}
%fin del comando que hace la primera pagina
%% fin opciones de portada

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% comando que hace el veredicto el texto se importa de textoveredicto.tex
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\veredicto}[1]{%
\ifthenelse{\equal{#1}{final}}
{%\input{textoveredicto.tex}
\setcounter{page}{5}
\newpage}
{\ifthenelse{\equal{#1}{borrador}}{
\input{EFUCVtesis/carta_tutor.tex}
\newpage
}{
\input{EFUCVtesis/textoprueba.tex}
\newpage}
}}%fin del comando que hace el veredicto

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Este comando carga el texto de la primera página (que se usa también en la tapa del libro)
%% versión 0.5 da error en la portada tapa del libro. Pide insertar llaves {} arreglarlo
%% versión 0.5 da error en el veredicto
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\textoportada}[3]{
\begin{tabular}{cc} 
	\rule{#1}{0ex} \rule{0cm}{#2} & \rule{#3}{0ex} \\ 
	\rule{0pt}{20ex}  &
	\parbox[c]{8cm}{
	\sc \centering
	universidad central de venezuela\\
	facultad de ciencias\\
	escuela de física\\
	\rule{0pt}{10ex}}\\ 
	\rule{0pt}{24ex}  & 
	\includegraphics[scale=1]{EFUCVtesis/imagenes/logoucvgifpeq.png}\\ 	\rule{0pt}{26ex} &
		\raisebox{10ex}{\parbox[c]{15cm}{ \centering \tesistitulo }} \\ 
	\rule{0pt}{19ex} &
	\parbox[c]{8cm}{			
		\centering
  		Proyecto de investigación \\ 
 		Investigador responsable \tesisautor \\
 		email: \tesisautoremail \\
   		\lab \\
   		\centrolab \\
  	}\\ 
	\rule{0pt}{8ex} &
	\tesisanho \\ 
	\rule{0pt}{3ex} &
	Caracas-Venezuela\\ 
\end{tabular}
}


%----------------------------------------------------------------------%
%  page settings
%----------------------------------------------------------------------%
\topmargin -1.35cm \textwidth 16cm \textheight 23cm \oddsidemargin 0.5cm \evensidemargin 0cm
%%
%%%%%%%%%%%%%%%%%%%%%%%%
%%Espaciado entre lineas
%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{leading}
\leading{16pt}
%%
%%%%%%%%%%%%%%%%%%%%%%%%
%%encabezado y pie de pagina
%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{fancyhdr}
\pagestyle{fancy}
%with this we ensure that the chapter and section
%headings are in lowercase.
%\renewcommand{\chaptermark}[1]{\markboth{#1}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection\ #1}}
\fancyhf{} %delete the current setting for header and footer
\fancyhead[LE,RO]{\bfseries\thepage}%
\fancyhead[CO]{\bfseries\rightmark}%\fancyhead[LO]{\bfseries\rightmark}%
\fancyhead[CE]{\bfseries\leftmark}%\fancyhead[RE]{\bfseries\leftmark}%
\renewcommand{\headrulewidth}{0.5pt}%
\renewcommand{\footrulewidth}{0.5pt}%
\addtolength{\headheight}{2.5pt} %make space for the rule
\fancypagestyle{plain}{%
    \fancyhead{}% get rid of headers on plain pages
        \renewcommand{\headrulewidth}{0pt}% and the line
}%

\endinput