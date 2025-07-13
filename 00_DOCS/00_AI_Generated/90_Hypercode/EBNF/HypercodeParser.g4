parser grammar HypercodeParser;

options { tokenVocab=HypercodeLexer; }

// ===== Parser rules =====

hypercode     : statement* ;

statement     : commandLine ;

commandLine   : command NEWLINE block? ;

command       : IDENTIFIER classDecl? idDecl? ;

classDecl     : DOT IDENTIFIER ;
idDecl        : HASH IDENTIFIER ;

block         : INDENT statement+ DEDENT ;
