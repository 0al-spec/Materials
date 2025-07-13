# ANTLR and Hypercode

Всё просто — нужно один раз подключить `antlr-4.13.0-complete.jar` в `classpath` и желательно добавить `alias`, чтобы работать удобно.

✅ 1. Добавь переменные окружения и `alias`

В файл `~/.zshrc` (или `~/.bashrc`, если у тебя `bash`), добавь:

```
# Путь к ANTLR JAR
export ANTLR_JAR=/Users/egor/Development/ANTLR/antlr-4.13.0-complete.jar
export CLASSPATH=".:$ANTLR_JAR:$CLASSPATH"

# Удобные команды
alias antlr4='java -Xmx500M -cp "$CLASSPATH" org.antlr.v4.Tool'
alias grun='java -Xmx500M -cp "$CLASSPATH" org.antlr.v4.gui.TestRig'
```

Затем активируй:

```
source ~/.zshrc
```

### ✅ 2. Компиляция и тест

Теперь в папке с `Hypercode.g4`:

- 1. Скомпилируй грамматику (если ещё нет)

```
antlr4 Hypercode.g4
```

- 2. Скомпилируй Java-классы

```
javac -cp .:$ANTLR_JAR Hypercode*.java
```

- 3. Создай пример

```
echo -e "Application\nButton\nCancel\n" > example.hc
```

- 4. Проверь дерево

```
grun Hypercode hypercode example.hc -tree
```

## 🧪 Результат

Ты увидишь:

```
(hypercode
  (line (IDENTIFIER Application) (NEWLINE \n))
  (line (IDENTIFIER Button) (NEWLINE \n))
  (line (IDENTIFIER Cancel) (NEWLINE \n))
)
```

## 🎉 Всё работает — ты можешь начинать тестировать реальный Hypercode-код.

## Автоматизация

Выполнить в `Terminal`:

```
make            # скачает jar, сгенерирует и соберёт всё
make run        # запустит парсер с примером
make clean      # удалит все артефакты
```
