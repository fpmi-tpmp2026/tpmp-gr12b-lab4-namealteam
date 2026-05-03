# Задание 6. CI/CD, Codecov и GitHub Pages

## Что добавлено

Для проекта туристического бюро настроена автоматизация сборки и публикации:

- сборка и unit-тесты запускаются в GitHub Actions;
- coverage генерируется через `gcov`;
- отчёт отправляется в Codecov;
- статическая страница проекта публикуется через GitHub Pages.

## Workflow

### Триггеры

- `push` в ветки `main` и `dev`;
- `pull_request` в ветки `main` и `dev`;
- ручной запуск через `workflow_dispatch`.

### Проверки

- сборка на Ubuntu и macOS;
- запуск `make check`;
- запуск `make coverage`;
- выгрузка `coverage.info` в Codecov через `codecov/codecov-action@v5` с OIDC.

### Публикация

На `push` в `main` workflow дополнительно публикует статический сайт из папки `site/` в GitHub Pages.

## Локальные команды

```bash
make
make check
make coverage
make clean
```

## Что видно в браузере

- [GitHub Pages](https://namealx.github.io/lab4-tourism/)
- [Codecov](https://codecov.io/gh/namealx/lab4-tourism)

## Вывод

Проект теперь проверяется автоматически: код собирается, тесты запускаются, coverage отправляется в сервис анализа покрытия, а страница проекта публикуется без ручного деплоя.
