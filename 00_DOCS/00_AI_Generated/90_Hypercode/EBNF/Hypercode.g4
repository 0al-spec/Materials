grammar Hypercode;

// ===== Parser rules =====

hypercode     : line* ;

line          : commandLine
              | NEWLINE ;

commandLine   : INDENT? command NEWLINE block? ;

command       : IDENTIFIER classDecl? idDecl? ;

classDecl     : '.' IDENTIFIER ;
idDecl        : '#' IDENTIFIER ;

block         : INDENT commandLine+ ;

// ===== Lexer rules =====

IDENTIFIER    : [a-zA-Z] [a-zA-Z0-9_-]* ;

INDENT        : [ \t]+ ;
NEWLINE       : '\r'? '\n' ;

WS            : [ \t]+ -> skip ;
