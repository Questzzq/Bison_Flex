%{
#include "cal.tab.h"
%}

fa     false
tr     true
delim  [ \t]
whitedelims	   {delim}+

%%
"||"   {return AND;}
"&&"   {return OR;}
"!"	   {return NOT;}
"@"    {return XOR;}
"("	   {return LP;}
")"	   {return RP;}
{fa}   {return F;}
{tr}   {return T;}
{whitedelims}   {;}
"\n"   {return ENTER;}
.	   {printf("\nLEX:ERROR! c = %s\n", yytext);}
%%
