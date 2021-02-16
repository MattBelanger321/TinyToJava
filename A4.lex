import java_cup.runtime.*;
import java.io.*;
%%

%class A4
%implements java_cup.runtime.Scanner
%type Symbol
%function next_token
%class A4Scanner
%eofval{ return null;
%eofval}
%state com
%%

<YYINITIAL>"BEGIN"			{ return new Symbol(A4Symbol.BEGIN); }
<YYINITIAL>"END"			{ return new Symbol(A4Symbol.END); }
<YYINITIAL>"IF"			    { return new Symbol(A4Symbol.IF); }
<YYINITIAL>"ELSE"			{ return new Symbol(A4Symbol.ELSE); }
<YYINITIAL>"WRITE"			{ return new Symbol(A4Symbol.WRITE); }
<YYINITIAL>"READ"			{ return new Symbol(A4Symbol.READ); }
<YYINITIAL>"MAIN"			{ return new Symbol(A4Symbol.MAIN); }
<YYINITIAL>"INT"			{ return new Symbol(A4Symbol.INT); }
<YYINITIAL>"REAL"			{ return new Symbol(A4Symbol.REAL); }
<YYINITIAL>"RETURN"		    { return new Symbol(A4Symbol.RETURN); }
<YYINITIAL>"STRING"		    { return new Symbol(A4Symbol.STRING); }

<YYINITIAL>"!="            { return new Symbol(A4Symbol.NOTEQUAL); }
<YYINITIAL>"=="            { return new Symbol(A4Symbol.EQUALTO); }
<YYINITIAL>"("				{ return new Symbol(A4Symbol.LEFTPAREN); }
<YYINITIAL>")"				{ return new Symbol(A4Symbol.RIGHTPAREN); }
<YYINITIAL>","				{ return new Symbol(A4Symbol.COMMA); }
<YYINITIAL>";"				{ return new Symbol(A4Symbol.SEMI); }
<YYINITIAL>":="			    { return new Symbol(A4Symbol.ASSIGN); }
<YYINITIAL>"+"				{ return new Symbol(A4Symbol.PLUS); }
<YYINITIAL>"-"				{ return new Symbol(A4Symbol.MINUS); }
<YYINITIAL>"*"				{ return new Symbol(A4Symbol.MULT); }
<YYINITIAL>"/"				{ return new Symbol(A4Symbol.DIV); }

<YYINITIAL>[a-zA-Z][a-zA-Z0-9]* 		{ return new Symbol(A4Symbol.ID, yytext()); }
<YYINITIAL>[0-9]*(\.[0-9]*)?           { return new Symbol(A4Symbol.NUM, yytext()); }
<YYINITIAL>\"[^\"]*\"              { return new Symbol(A4Symbol.QSTRING, yytext()); }

<YYINITIAL>"/**"        {yybegin(com);}
<com>"**/"  {yybegin(YYINITIAL);}
<com>. {}
<YYINITIAL>[ \t\r\n\f]			{}
. {return new Symbol(A4Symbol.error);}
\r|\n {}
