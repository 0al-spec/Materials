grammar Hypercode;

// ===== Parser rules =====

hypercode     : commandLine* ;

commandLine   : command NEWLINE ;

command       : IDENTIFIER classDecl? idDecl? ;

classDecl     : '.' IDENTIFIER ;
idDecl        : '#' IDENTIFIER ;

// ===== Lexer rules =====

IDENTIFIER    : [a-zA-Z] [a-zA-Z0-9_-]* ;
NEWLINE       : '\r'? '\n' ;
WS            : [ \t]+ -> skip ;
