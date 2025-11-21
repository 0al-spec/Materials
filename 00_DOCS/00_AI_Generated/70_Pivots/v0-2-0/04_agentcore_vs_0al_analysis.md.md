# Анализ архитектуры Amazon Bedrock AgentCore и сравнение с 0AL

## Архитектура Amazon Bedrock AgentCore

**Amazon Bedrock AgentCore** — это модульная система для безопасного исполнения и масштабирования AI-агентов в среде AWS. Она состоит из следующих компонентов:

- **AgentCore Runtime** — изолированное серверлес-окружение для агентов. Поддерживает sandbox-режимы исполнения и автоматическое масштабирование.
- **AgentCore Memory** — модуль долговременной и краткосрочной памяти для агентов.
- **AgentCore Gateway** — интерфейс для подключения внешних API и AWS-сервисов как инструментов агента.
- **Browser / Code Interpreter Tools** — безопасные инструменты исполнения кода и просмотра веба в изолированных VM.
- **AgentCore Identity** — подсистема идентификации и делегирования прав агентам.
- **AgentCore Observability** — телеметрия, логи, трассировка reasoning-дерева и интеграция с CloudTrail / OpenTelemetry.

## Механизмы безопасности

- Идентификация агента осуществляется через OAuth2 / IAM роли, агенты получают уникальные учётки.
- Все действия агентов логируются. Сессии изолированы, инструменты запускаются в песочницах.
- Используются WAF, token vault, IAM policies для принципа "наименьших привилегий".
- Агент не может выйти за пределы своей роли, инструментов и namespace'ов.

## Сравнение с 0AL (Zero-trust Agents Layer)

| Аспект | Amazon AgentCore | 0AL |
|-------|------------------|-----|
| **Модель доверия** | Zero-trust, IAM + токены | Zero-trust, Agent Passport |
| **Декларации** | Распределены по Gateway, IAM, SDK | Единый YAML "паспорт" |
| **Изоляция** | Контейнеры, sandbox-инструменты | chroot, seccomp, syscall-polices |
| **Поддержка декларативности** | Частичная (модули отдельно) | Полная (паспорт — декларация всего) |
| **Гибкость и масштабирование** | Высокая, серверлес, нативно в AWS | Независимо от платформы |
| **Аудит и отслеживание** | CloudWatch + Trace Tree + Logs | Встроенный аудит на уровне агента |

## Вывод

AgentCore — зрелая облачная реализация zero-trust подхода, пригодная для продакшена. Она не использует криптографически подписанные декларации (как Agent Passport), но реализует ту же философию безопасности: ограничение полномочий, изоляция, аудит. В будущем возможна интеграция Agent Passport как формата декларации прав и доверия между агентами на разных платформах.

## Источники

- [AgentCore Overview](https://aws.amazon.com/bedrock/agentcore/)
- [AgentCore Tools: Browser & Code Interpreter](https://aws.amazon.com/blogs/machine-learning/amazon-bedrock-agentcore-preview/)
- [AgentCore Memory, Gateway, Identity](https://docs.aws.amazon.com/bedrock/latest/userguide/agents.html)
- [Agent Passport (0AL)](https://github.com/0al-spec/agent-passport)