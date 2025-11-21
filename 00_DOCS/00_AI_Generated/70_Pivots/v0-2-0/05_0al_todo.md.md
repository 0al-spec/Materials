# TODO: Расширение 0AL для покрытия функциональности Amazon Bedrock AgentCore

## ✅ agent-passport/

- [ ] Добавить `identity.claims` секцию (email, DID, OAuth2).
- [ ] Добавить `grants` / `delegatedRights` (делегирование прав).
- [ ] Поддержка `tokenScopes` (аналог OAuth2 scopes).
- [ ] Добавить `memoryNamespace` / `stateDomain`.
- [ ] Добавить `toolUsagePolicies` (лимиты, частота, аргументы).
- [ ] Добавить `auditable: true`.

## ✅ zeroald/

- [ ] Поддержка `resourceProfile` (CPU, RAM, I/O).
- [ ] Песочница: `chroot`, `netns`, `seccomp`, `exec allowlist`.
- [ ] Внедрение `AgentSession`: временное окружение.
- [ ] Логгирование всех exec/syscall/net событий.

## ✅ agentifyd/

- [ ] Слежение за PID-группой, логгирование stdout/stderr/syscalls.
- [ ] Проверка декларации паспорта перед запуском.
- [ ] Поддержка `agentSessionID` и audit trace.

## ✅ hypercode/

- [ ] Расширить `@rules` до уровня: права, память, инструменты.
- [ ] Добавить `@tool`, `@resource`, `@env`, `@capability`.
- [ ] Поддержка декларативного импорта capability от других агентов.

## ✅ zeroal (CLI)

- [ ] `zeroal validate passport.yaml`
- [ ] `zeroal run --passport passport.yaml`
- [ ] `zeroal log --session <id>`
- [ ] `zeroal sandbox trace`

## ✅ docs / observability

- [ ] Формат `agent-trace.json` (в духе OpenTelemetry).
- [ ] Визуализатор reasoning tree.
- [ ] `signedExecutionReport` — отчёт исполнения.
- [ ] Архив/просмотр сессий агента (crash, audit, ресурсы).

## ✅ Общее

- [ ] MIME-типы: `application/vnd.0al.agent+yaml`, `+passport`, `+trace`.
- [ ] Абстракция `Agent Tool` для декларации exec API.
- [ ] Исследовать совместимость с Google A2A AgentCard / MCP.

---

_Цель: добиться функционального паритета с AgentCore AWS в рамках открытого и платформонезависимого проекта._