ANTLR_VERSION=4.13.0
ANTLR_JAR=antlr-$(ANTLR_VERSION)-complete.jar
ANTLR_URL=https://www.antlr.org/download/$(ANTLR_JAR)

GRAMMAR=Hypercode
SRC_LEXER=HypercodeLexer.g4
SRC_PARSER=HypercodeParser.g4
EXAMPLE=example.hc

# All generated files
GEN_FILES=$(GRAMMAR)Lexer.java \
           $(GRAMMAR)Parser.java \
           $(GRAMMAR)ParserBaseListener.java \
           $(GRAMMAR)ParserListener.java \
           $(GRAMMAR)Lexer.tokens \
           $(GRAMMAR)Parser.tokens \
           $(GRAMMAR).tokens \
           $(GRAMMAR)*.class \
           $(GRAMMAR)*.interp \
           Main.class

.PHONY: all build run test-all clean

all: run

$(ANTLR_JAR):
	curl -O $(ANTLR_URL)

build: $(ANTLR_JAR)
	java -Xmx500M -cp "$(ANTLR_JAR)" org.antlr.v4.Tool $(SRC_LEXER) $(SRC_PARSER)
	javac -cp ".:$(ANTLR_JAR)" Hypercode*.java

run: build
	javac -cp ".:$(ANTLR_JAR)" Main.java
	java -cp ".:$(ANTLR_JAR)" Main

TEST_DIR := hypercode_tests
TEST_FILES := $(wildcard $(TEST_DIR)/*.hc)

test-all: build
	@echo "🧪 Running Hypercode grammar tests..."
	@pass=0; fail=0; \
	for f in $(TEST_FILES); do \
	  echo "==> Testing $$f"; \
	  output=$$(java -Xmx500M -cp ".:$(ANTLR_JAR)" org.antlr.v4.gui.TestRig HypercodeParser hypercode -lexer HypercodeLexer $$f -tree 2>&1); \
	  if echo "$$output" | grep -q "line"; then \
	    if echo "$$f" | grep -q '/X'; then \
	      result="✅ PASS (expected error)"; \
	      pass=$$((pass+1)); \
	    else \
	      result="❌ FAIL"; \
	      fail=$$((fail+1)); \
	    fi; \
	  else \
	    result="✅ PASS"; \
	    pass=$$((pass+1)); \
	  fi; \
	  echo "$$result: $$f"; \
	  echo "$$output" | sed 's/^/    /'; \
	done; \
	echo ""; \
	echo "✅ Passed: $$pass"; \
	echo "❌ Failed: $$fail"; \
	echo "📊 Total:  $$((pass + fail))"

	@$(MAKE) clean QUIET=1

clean:
	@C=0; \
	for f in $(GEN_FILES); do \
	  if [ -f "$$f" ]; then \
	    [ "$(QUIET)" != "1" ] && [ "$$C" -eq 0 ] && echo "🧹 Cleaned up:"; \
	    [ "$(QUIET)" != "1" ] && echo "  • $$f"; \
	    rm -f "$$f" || true; \
	    C=1; \
	  fi; \
	done; \
	[ "$$C" -eq 0 ] && [ "$(QUIET)" != "1" ] && echo "🧼 Nothing to clean."; \
	true
