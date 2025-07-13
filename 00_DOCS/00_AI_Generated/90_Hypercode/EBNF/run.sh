#!/bin/bash
# antlr Hypercode.g4
# javac -cp .:$ANTLR_JAR Hypercode*.java
# grun Hypercode hypercode "$1" -tree
#!/bin/bash

JAR_PATH="/Users/egor/Development/ANTLR/antlr-4.13.0-complete.jar"

java -Xmx500M -cp ".:$JAR_PATH" org.antlr.v4.Tool Hypercode.g4
javac -cp ".:$JAR_PATH" Hypercode*.java
java -Xmx500M -cp ".:$JAR_PATH:." org.antlr.v4.gui.TestRig Hypercode hypercode "$1" -tree
