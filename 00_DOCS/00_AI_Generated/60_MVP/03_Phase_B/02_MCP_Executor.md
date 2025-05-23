Вот подробно развернутый раздел 3: MCP-исполнитель (внутренний) с пошаговыми инструкциями, адаптированными под новичков в Node.js и Unix socket:

⸻

3. MCP-исполнитель (внутренний)

3.1. Реализуй MCP JSON-RPC сервер на express через Unix socket
	•	Установи модуль express:

npm install express


	•	Создай mcpServer.js в src/ и импортируй express, fs, http
	•	Определи путь к сокету (например, process.env.AGENT_SOCKET)
	•	Перед запуском удали существующий сокет (если файл уже есть)
	•	Создай express() приложение, добавь app.use(express.json())
	•	Слушай на Unix socket через app.listen(socketPath)
	•	Логируй, что сервер стартовал (console.log("MCP listening on socket..."))

3.2. Сконфигурируй endpoint /invoke с POST-приёмом JSON
	•	Добавь в mcpServer.js app.post('/invoke', handler)
	•	Проверяй, что req.body содержит agent_id, tool, args
	•	Получи паспорт агента из модуля passportRegistry.js
	•	Найди нужный tool по имени, достань его cmd
	•	Верни 400 при ошибках формата, 404 если агент не найден
	•	Логируй все входящие запросы с trace_id

3.3. Имплементируй исполнение shell-команд через child_process.spawn
	•	Импортируй child_process.spawn
	•	Собери финальную команду на основе шаблона из YAML
	•	Подставь переменные ${name} из args
	•	Вызови spawn(cmd, args) с { stdio: 'pipe' }
	•	Обработай stdout, stderr, exitCode
	•	На ошибки -- возвращай HTTP 500 + stderr

3.4. Пропиши базовую проверку caps перед вызовом
	•	Получи caps из паспорта (caps.read, caps.write)
	•	Проверь, что путь в аргументах соответствует разрешённым шаблонам
	•	Используй minimatch или простой startsWith()
	•	При нарушении -- верни 403 Forbidden
	•	Логируй отказ с указанием заблокированного пути и агента

3.5. Реализуй stdout/stderr стриминг в JSON-ответ
	•	Собери вывод из stdout построчно (data.toString())
	•	Параллельно собирай stderr
	•	По завершении команды, отправь JSON:

{ "status": "ok", "stdout": "...", "stderr": "" }


	•	При ненулевом exit-коде -- добавь status: "error" и код
	•	Для длинных выводов -- пока можно ограничиться буфером

3.6. Обеспечь логирование вызовов MCP
	•	Создай logger.js и экспортируй функцию log(entry)
	•	Логируй входящие запросы: timestamp, agent_id, tool, args
	•	Логируй результат: exitCode, duration, stderr.length
	•	Записывай логи в console.log для journald совместимости
	•	Подготовь JSON-логи в будущем (на следующий этап)

⸻

Если нужно, могу дополнительно пояснить, как работает Unix socket в Express и чем отличается spawn от exec.