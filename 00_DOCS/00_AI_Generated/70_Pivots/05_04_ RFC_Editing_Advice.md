## Лучшее программное обеспечение и формат файлов для работы над новым документом RFC

**Выбор формата и инструментов для написания RFC зависит от целей, этапа работы, опыта команды и требований IETF. Ниже приведены актуальные рекомендации на 2025 год.**

---

### **Рекомендуемый формат файла**

- **RFCXML** (иногда называют xml2rfc) -- основной и единственный «дефинитивный» формат для публикации RFC. Именно этот XML-файл содержит всю необходимую информацию для последующего преобразования в HTML, PDF и текстовые версии и считается каноническим[4][5].
- Для черновиков и совместной работы часто используют **Markdown**, но его обязательно нужно конвертировать в RFCXML для финального этапа и публикации[2].

---

### **Лучшее программное обеспечение**

#### **1. xml2rfc**
- Официальный инструмент для работы с RFCXML.
- Позволяет создавать, валидировать и конвертировать документы RFCXML в текст, HTML и PDF[8].
- Доступен как командная строка, так и с простым GUI.
- Шаблоны для новых документов можно найти на сайте xml2rfc или у RFC Editor[8].

#### **2. NroffEdit**
- WYSIWYG-редактор для написания черновиков в формате nroff, который также поддерживается для IETF-документов[3][8].
- Позволяет видеть исходный код и отформатированный текст параллельно.
- Подходит для тех, кто предпочитает визуальное редактирование и работу с шаблонами[3].

#### **3. Совместная работа**
- Для коллективной работы на ранних этапах часто используют **Google Docs**, **Markdown в репозиториях GitHub/GitLab**, **Notion** и другие облачные редакторы, так как они удобны для комментирования и обсуждения[6][9].
- После согласования текста документ конвертируют в RFCXML для финальной подготовки и публикации[2].

---

### **Процесс работы**

1. **Черновик**: Можно начать с Markdown или Google Docs для совместной работы и обсуждения[2][6][9].
2. **Конвертация**: Перевести черновик в RFCXML с помощью инструментов (например, pandoc, markdown2rfc).
3. **Редактирование и валидация**: Использовать xml2rfc для проверки структуры, ссылок и форматирования[8].
4. **Финальный экспорт**: Получить из RFCXML все необходимые публикационные форматы (HTML, PDF, текст).
5. **Подача в IETF**: Приемлемы только RFCXML или plain text, но для публикации требуется именно RFCXML[2][4].

---

### **Сравнительная таблица форматов и инструментов**

| Формат      | Для чего подходит           | Инструменты         | Примечания                         |
|-------------|----------------------------|---------------------|------------------------------------|
| RFCXML      | Финальная публикация, валидация | xml2rfc, XML-редакторы | Канонический формат RFC            |
| Markdown    | Черновики, совместная работа   | VS Code, Obsidian, GitHub | Требует конвертации в RFCXML       |
| nroff       | Черновики, визуальное редактирование | NroffEdit           | Поддерживается, но менее популярен |
| Google Docs | Совместная работа            | Google Docs         | Не для финальной публикации        |

---

### **Вывод**

- **Лучший формат для финальной работы и публикации RFC -- RFCXML**.
- **Лучший инструмент -- xml2rfc** (официальный и поддерживаемый).
- Для совместной работы на ранних этапах удобно использовать Markdown или облачные редакторы, но обязательно переводить итоговый текст в RFCXML перед публикацией[2][4][5][7][8].

**Рекомендуемая стратегия:**
- Пишите черновики в удобном для команды формате (Markdown, Google Docs).
- Для публикации и прохождения всех этапов IETF переводите документ в RFCXML и редактируйте с помощью xml2rfc.

Источники
[1] ietf-tools/RfcEditor: Some RFC Editing tools - GitHub https://github.com/ietf-tools/RfcEditor
[2] Choosing a format and tools | Internet-Draft Author Resources - IETF https://authors.ietf.org/choosing-a-format-and-tools
[3] [PDF] Tools for Creating Internet-Drafts - » RFC Editor https://www.rfc-editor.org/rfc-editor/tools_87.pdf
[4] RFC 9720 - RFC Formats and Versions - IETF Datatracker https://datatracker.ietf.org/doc/rfc9720/
[5] RFC 7990: RFC Format Framework https://www.rfc-editor.org/rfc/rfc7990.html
[6] A thorough team guide to RFCs - LeadDev https://leaddev.com/software-quality/thorough-team-guide-rfcs
[7] Writing An IETF Draft: Formatting, Authorship, And Submissions https://packetpushers.net/blog/writing-an-ietf-draft-formatting-authorship-and-submissions/
[8] [PDF] RFC Editor Tutorial - FTP Directory Listing https://ftp.ripe.net/rfc/rfc-editor/tutorial74.pdf
[9] Quick tip Tuesday: ⭐️ Writing RFCs for fun and profit - DEV ... https://dev.to/wesen/quick-tip-tuesday-writing-rfcs-for-fun-and-profit-3bo
[10] RFC 9700 - Best Current Practice for OAuth 2.0 Security https://datatracker.ietf.org/doc/rfc9700/
[11] RFC Search Detail - » RFC Editor https://www.rfc-editor.org/bcps
[12] [Summary] RFC: An updated style guide for the year 2025 #59522 https://github.com/angular/angular/discussions/59522
[13] rfc2025.txt - IETF https://www.ietf.org/rfc/rfc2025.txt
[14] What is the editor used for writing RFC text files? - Stack Overflow https://stackoverflow.com/questions/1831158/what-is-the-editor-used-for-writing-rfc-text-files
[15] Making technical decisions using RFCs - DEV Community https://dev.to/eminetto/making-technical-decisions-using-rfcs-1j4f
[16] [PDF] Tools for Creating Internet-Drafts - IETF https://www.ietf.org/proceedings/94/slides/slides-94-edu-toolsids-5.pdf
[17] [PDF] Recommended Formats Statement 2024-2025 - Library of Congress https://www.loc.gov/preservation/resources/rfs/RFS%202024-2025.pdf
[18] RFC 7995 - PDF Format for RFCs - IETF Datatracker https://datatracker.ietf.org/doc/html/rfc7995
[19] Request for Comments - Wikipedia https://en.wikipedia.org/wiki/Request_for_Comments
