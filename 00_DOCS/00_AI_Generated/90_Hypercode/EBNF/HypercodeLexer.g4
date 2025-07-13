lexer grammar HypercodeLexer;

@header {
import java.util.Stack;
}

@members {
  private Stack<Integer> indentStack = new Stack<>() {{
    push(0);
  }};
  private java.util.LinkedList<Token> pendingTokens = new java.util.LinkedList<>();
  private int opened = 0;
  private boolean atStartOfLine = true;

  @Override
  public Token nextToken() {
    if (!pendingTokens.isEmpty()) return pendingTokens.poll();

    Token next = super.nextToken();
    if (next.getType() == NEWLINE) {
      atStartOfLine = true;
      return next;
    }

    if (next.getType() == WS && atStartOfLine) {
      int indent = next.getText().length();
      int prevIndent = indentStack.peek();

      if (indent > prevIndent) {
        indentStack.push(indent);
        pendingTokens.add(createToken(INDENT, next));
      } else {
        while (indent < prevIndent) {
          pendingTokens.add(createToken(DEDENT, next));
          indentStack.pop();
          prevIndent = indentStack.peek();
        }
      }
      atStartOfLine = false;
      return super.nextToken(); // skip WS
    }

    atStartOfLine = false;
    return next;
  }

  private Token createToken(int type, Token base) {
    return _factory.create(
      new Pair<>(this, this._input),
      type, "", Token.DEFAULT_CHANNEL,
      base.getStartIndex(), base.getStopIndex(),
      base.getLine(), base.getCharPositionInLine()
    );
  }

  @Override
  public void reset() {
    super.reset();
    this.indentStack.clear();
    this.indentStack.push(0);
    this.pendingTokens.clear();
    this.atStartOfLine = true;
  }
}

// ====== LEXER RULES ======

INDENT: ;
DEDENT: ;

NEWLINE: ('\r'? '\n')+ ;

WS: [ \t]+ -> skip ;

IDENTIFIER: [a-zA-Z] [a-zA-Z0-9_-]* ;

DOT: '.';
HASH: '#';
