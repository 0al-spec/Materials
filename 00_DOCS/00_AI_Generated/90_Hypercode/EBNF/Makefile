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