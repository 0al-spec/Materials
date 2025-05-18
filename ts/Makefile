# #########################################################
# Format
# #########################################################

format:
	npx biome format --write .

# #########################################################
# Clean
# #########################################################

clean-%:
	rm -rf $*/build

# #########################################################
# Install
# #########################################################

install-%:
	cd $* && npm i

# #########################################################
# Build TypeScript project
# #########################################################

build-watch-%:
	npx tsc -w -p $*/tsconfig.json

build-%:
	time npx tsc -p $*/tsconfig.json

# #########################################################
# Lint: Biome & Madge
# #########################################################

lint-watch-%:
	npx nodemon -d 1 -e ts,json \
		-w Makefile \
		-w biome.jsonc \
		-w package.json \
		-w tsconfig.default.jsonc \
		-w tsconfig.node.jsonc \
		-w $*/src \
		--exec 'clear && make lint-$*'

lint-%:
	npx biome lint --write $*/src && \
	npx biome format --write && \
	npx madge --warning -c $*/src

# #########################################################
# Tests
# #########################################################

test-watch-%:
	npx vitest --dir $*/src

test-upd-%:
	npx vitest -u --dir $*/src

test-%:
	npx vitest --dir $*/src --run

# #########################################################
# Run
# #########################################################

run-watch-%:
	npx tsx --watch $*/build/src/index.js

run-%:
	npx tsx $*/build/src/index.js
