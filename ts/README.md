# TypeScript-based projects with NPM Workspace

## Prerequisite

Install `nvm` (Node Version Manager):
```shell
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
```

Install `node` and `npm`:
```shell
nvm install --lts --latest-npm
```

Check `node` version:
```shell
node -v
v22.15.1
```

Check `npm` version:
```shell
npm -v
10.9.2
```

## NPM workspace

```shell
cd ts && npm i
```

## For some project in workspace

E.g. project `agent`. Open separated terminals:
  - Build: `make build-watch-agent`
  - Lint: `make lint-watch-agent`
  - Test: `make test-watch-agent` 
  - Run: `make run-watch-agent`
