Product Requirements Document (PRD)

Проект: Agentification Layer (AL)

⸻

Фаза A -- Окружение и инфраструктура

A.1. Подготовка к запуску (Docker + systemd)
	•	Развёртывание демона через systemd unit
	•	Настройка сокета /run/agentifyd.sock
	•	Ручной и сервисный запуск, перезапуск
	•	docker-compose с volume для паспортов
	•	README с описанием всех вариантов запуска

A.2. Подготовка среды разработки (DevContainer)
	•	Docker Desktop + VS Code Dev Containers
	•	Инициализация Node.js проекта с зависимостями
	•	Подключение grpc, js-yaml, express и dotenv
	•	Структура проекта и dev-окружение

A.3. Документация и walkthrough
	•	YAML-паспорт: схема и примеры
	•	OpenAPI для MCP, .proto для A2A
	•	Архитектура и цепочка вызовов
	•	Walkthrough по agentctl и a2aClient
	•	TODO.md и баг-репорты после прогонки

⸻

Фаза B -- Реализация MVP (функциональные компоненты)

B.1. Парсер YAML-паспортов
	•	Загрузка и валидация .yaml файлов
	•	Структура: id, tools, cmd, caps
	•	Логика ошибок и schema enforcement

B.2. MCP-исполнитель
	•	Express-сервер на Unix socket
	•	JSON-RPC endpoint /invoke
	•	spawn команд с подстановкой args
	•	stdout/stderr в JSON-ответ

B.3. A2A Discovery и Server
	•	gRPC server по a2a.proto
	•	Методы submitGoal и streamResult
	•	Проксирование в MCP
	•	Поддержка trace_id

B.4. Реестр агентов и hot-reload
	•	agentRegistry: Map<agent_id, passport>
	•	Загрузка при старте
	•	Обновление при изменении файлов
	•	Валидация доступности агента при вызовах

B.5. Безопасность и изоляция
	•	Проверка путей через caps
	•	Фильтрация допустимых команд
	•	sandbox spawn без shell/env
	•	Архитектура расширения: seccomp, chroot, namespaces

B.6. Логирование и трассировка
	•	Логгер с trace_id и agent_id
	•	stdout-вывод для systemd/journald
	•	Структурированные логи

B.7. Интеграция и тестирование
	•	CLI-утилита agentctl
	•	Мок A2A клиент
	•	e2e-путь: A2A → MCP → shell
	•	Поведение при ошибках
	•	Тесты в tests/e2e/ + фиксация эталонных вызовов

⸻

Завершение

Agentification Layer MVP после прохождения всех фаз может быть собран, задокументирован и опубликован как dev-toolkit или OSS-модуль. A2A-протокол расширен, MCP скрыт, системные сущности становятся агентами под контролем AL.