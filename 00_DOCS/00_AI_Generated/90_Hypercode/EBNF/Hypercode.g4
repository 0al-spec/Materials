grammar Hypercode;

// ===== Parser rules =====

hypercode     : commandLine* ;

commandLine   : command NEWLINE block? ;

command       : IDENTIFIER classDecl? idDecl? ;

classDecl     : '.' IDENTIFIER ;
idDecl        : '#' IDENTIFIER ;

block         : INDENT commandLine+ ;

// ===== Lexer rules =====

IDENTIFIER    : [a-zA-Z] [a-zA-Z0-9_-]* ;
NEWLINE       : '\r'? '\n' ;
INDENT        : {getCharPositionInLine() == 0}? [ ]+ ;

WS            : [ \t]+ -> skip ;
