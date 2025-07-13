# ANTLR version to use
ANTLR_VERSION=4.13.0
ANTLR_JAR=antlr-$(ANTLR_VERSION)-complete.jar
ANTLR_URL=https://www.antlr.org/download/$(ANTLR_JAR)

SRC=Hypercode.g4
GRAMMAR=Hypercode
EXAMPLE=example.hc

# All generated files
GEN_FILES=$(GRAMMAR)Lexer.java \
           $(GRAMMAR)Parser.java \
           $(GRAMMAR)BaseListener.java \
           $(GRAMMAR)Listener.java \
           $(GRAMMAR)Lexer.tokens \
           $(GRAMMAR).tokens \
           $(GRAMMAR)*.class \
           $(GRAMMAR)*.interp

# Default target
all: run

# Download ANTLR jar if not present
$(ANTLR_JAR):
	curl -O $(ANTLR_URL)

# Compile the grammar and Java sources
build: $(ANTLR_JAR)
	java -Xmx500M -cp "$(ANTLR_JAR)" org.antlr.v4.Tool $(SRC)
	javac -cp ".:$(ANTLR_JAR)" $(GRAMMAR)*.java

# Run test on example file
run: build
	java -Xmx500M -cp ".:$(ANTLR_JAR)" org.antlr.v4.gui.TestRig $(GRAMMAR) hypercode $(EXAMPLE) -tree

# Clean up generated files
clean:
	rm -f $(GEN_FILES)

.PHONY: all build run clean

# Test Hypercode
TEST_DIR := hypercode_tests
TEST_FILES := $(wildcard $(TEST_DIR)/*.hc)

test-all: build
	@echo "🧪 Running Hypercode grammar tests..."
	@pass=0; fail=0; \
	for f in $(TEST_FILES); do \
	  echo "==> Testing $$f"; \
	  output=$$(java -Xmx500M -cp ".:$(ANTLR_JAR)" org.antlr.v4.gui.TestRig Hypercode hypercode $$f -tree 2>&1); \
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
