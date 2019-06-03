### Bison_Flex
---
+ flex Cal.l  
+ bison -d Cal.y
+ gcc -w .\lex.yy.c .\Cal.tab.c -o test
+ .\test.exe
