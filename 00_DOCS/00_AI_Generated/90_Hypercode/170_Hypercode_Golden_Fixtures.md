# Golden-fixture

## TL;DR

Golden-fixture (он же golden file, эталонный вывод) — это заранее сохранённый «правильный» результат работы программы (парсера, компилятора, CLI). Тест сравнивает актуальный вывод с этим файлом-эталоном; расхождение → фейл.

## Зачем нужны

Где применяют	Что проверяют	Почему удобно
Парсеры / компиляторы	AST, JSON-dump, сериализованный IR	Сразу видно diff при регрессии
CLI-утилиты	Текст или YAML, который печатает команда	Экономит время на assert’ы «по полям»
Рендереры шаблонов	HTML/Markdown output	Проверка «на глаз» через git diff

Главная цель — быстро ловить непреднамеренные изменения поведения, особенно когда вывод содержит десятки строк/узлов.

## Как выглядит на практике (Python + pytest)

```python
import pathlib, subprocess, difflib

FIXTURES = pathlib.Path("tests/golden")

def run_cli(path):
    return subprocess.check_output(["hypercode", "parse", path]).decode()

def test_parse_example():
    source = "examples/hello.hc"
    got = run_cli(source)

    golden = (FIXTURES / "hello.ast.txt").read_text()

    assert got == golden, "\n".join(
difflib.unified_diff(golden.splitlines(), got.splitlines(), lineterm="")
    )
```
    
•	Первый запуск: создаём hello.ast.txt, кладём в git.
•	Дальше: если внутренний код поменялся → тест покажет git diff-подобную выдачу, видно, что именно «сломалось».

## Режим «record / update»

Обычно добавляют флаг:

```
pytest -k golden --update-golden
```

Тогда тест, вместо проверки, перезаписывает файлы эталонов — удобно, когда изменение вывода ожидаемое.

## Best practices

1. Храним в VCS — diff сразу попадает в PR.
2. Дробим по темам: один golden — один кейс, чтобы diff был маленьким.
3. Не кладём бинарники, лучше текст (YAML, JSON, pretty-printed).
4. CI-правило: если golden обновлён — ревьюер обязан посмотреть diff вручную.

## В контексте Hypercode

•	examples/*.hc → прогон «parse → dump-AST».
•	Сохраняем tests/golden/*.ast.json.
•	Любое изменение грамматики или merge-логики сразу видно: новый узел, переехавшее поле — тест краснеет.

Таким образом golden-fixtures — дешёвый, но очень надёжный плацдарм регрессионных тестов на ранних этапах разработки DSL/компиляторов.