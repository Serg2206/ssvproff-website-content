
# Детальная инструкция по настройке SSVproff Website

## Содержание

1. [Предварительные требования](#предварительные-требования)
2. [Установка Hugo](#установка-hugo)
3. [Клонирование и настройка проекта](#клонирование-и-настройка-проекта)
4. [Локальная разработка](#локальная-разработка)
5. [Настройка Netlify](#настройка-netlify)
6. [Работа с контентом](#работа-с-контентом)
7. [Кастомизация темы](#кастомизация-темы)
8. [Troubleshooting](#troubleshooting)

## Предварительные требования

### Необходимое ПО

- **Git** 2.30+
- **Hugo Extended** 0.120.0+
- **Make** (опционально, но рекомендуется)
- Текстовый редактор (VS Code, Sublime Text, etc.)

### Проверка установленных версий

```bash
git --version
hugo version
make --version
```

## Установка Hugo

### macOS

#### Через Homebrew (рекомендуется)
```bash
brew install hugo
```

#### Проверка extended версии
```bash
hugo version
# Должно содержать "extended"
```

### Linux

#### Ubuntu/Debian
```bash
# Через Snap (рекомендуется)
sudo snap install hugo --channel=extended

# Или через apt (может быть устаревшая версия)
sudo apt install hugo
```

#### Fedora/CentOS
```bash
sudo dnf install hugo
```

#### Arch Linux
```bash
sudo pacman -S hugo
```

### Windows

#### Через Chocolatey
```bash
choco install hugo-extended
```

#### Через Scoop
```bash
scoop install hugo-extended
```

#### Ручная установка
1. Скачайте Hugo Extended с https://github.com/gohugoio/hugo/releases
2. Распакуйте в `C:\Hugo\bin`
3. Добавьте `C:\Hugo\bin` в PATH

## Клонирование и настройка проекта

### 1. Клонирование репозитория

```bash
# С submodules (рекомендуется)
git clone --recurse-submodules https://github.com/Serg2206/ssvproff-website-content.git
cd ssvproff-website-content

# Если уже клонировали без submodules
git submodule update --init --recursive
```

### 2. Проверка структуры

```bash
# Проверка наличия темы
ls -la themes/papermod

# Должны увидеть файлы темы
```

### 3. Первый запуск

```bash
# Запуск локального сервера
make serve

# Или напрямую через Hugo
hugo server -D --bind 0.0.0.0
```

Откройте браузер: http://localhost:1313

## Локальная разработка

### Структура контента

```
content/
├── ru/                    # Русский контент
│   ├── _index.md         # Главная страница
│   ├── about/            # О себе
│   │   └── _index.md
│   ├── publications/     # Публикации
│   │   ├── _index.md
│   │   └── article-1.md
│   ├── blog/             # Блог
│   │   ├── _index.md
│   │   └── post-1.md
│   ├── ai-lab/           # AI Lab
│   │   └── _index.md
│   └── contact/          # Контакты
│       └── _index.md
└── en/                    # Английский контент
    └── ...               # Аналогичная структура
```

### Front Matter шаблон

```yaml
---
title: "Заголовок статьи"
date: 2025-10-20T10:00:00+03:00
draft: false
author: "Сергей В. Сушков"
tags: ["хирургия", "ИИ", "медицина"]
categories: ["Публикации"]
description: "Краткое описание статьи"
cover:
    image: "/images/cover.jpg"
    alt: "Описание изображения"
    caption: "Подпись к изображению"
---
```

### Создание нового контента

```bash
# Новая публикация (русский)
hugo new content/ru/publications/название-статьи.md

# Новая публикация (английский)
hugo new content/en/publications/article-title.md

# Новый пост в блоге
hugo new content/ru/blog/название-поста.md
```

### Работа с изображениями

```bash
# Размещение изображений
static/images/
├── covers/           # Обложки статей
├── publications/     # Изображения для публикаций
└── blog/            # Изображения для блога
```

Использование в Markdown:
```markdown
![Описание](/images/covers/image.jpg)
```

### Работа с PDF

```bash
# Размещение PDF файлов
static/pdfs/
├── publications/     # PDF публикаций
└── presentations/    # Презентации
```

Ссылка в Markdown:
```markdown
[Скачать PDF](/pdfs/publications/article.pdf)
```

## Настройка Netlify

### 1. Создание сайта на Netlify

1. Зайдите на https://app.netlify.com
2. Нажмите "Add new site" → "Import an existing project"
3. Выберите GitHub и репозиторий `Serg2206/ssvproff-website-content`
4. Настройки сборки:
   - **Build command**: `make build`
   - **Publish directory**: `public`
   - **Branch**: `main`

### 2. Настройка переменных окружения

В Netlify Dashboard → Site settings → Environment variables:

```
HUGO_VERSION = 0.120.0
```

### 3. Получение токенов

#### NETLIFY_TOKEN
1. Перейдите: https://app.netlify.com/user/applications
2. Создайте новый Personal Access Token
3. Скопируйте токен

#### NETLIFY_SITE_ID
1. Site settings → General → Site details
2. Скопируйте "Site ID"

### 4. Настройка GitHub Secrets

1. Перейдите в репозиторий на GitHub
2. Settings → Secrets and variables → Actions
3. Добавьте secrets:
   - `NETLIFY_TOKEN`: ваш Personal Access Token
   - `NETLIFY_SITE_ID`: ID вашего сайта

### 5. Настройка домена (опционально)

1. Domain settings → Add custom domain
2. Следуйте инструкциям для настройки DNS

## Работа с контентом

### Многоязычность

Структура для двух языков:

```
content/
├── ru/
│   └── about/_index.md
└── en/
    └── about/_index.md
```

Переключение языка в URL:
- Русский: `https://site.com/about/`
- Английский: `https://site.com/en/about/`

### Таксономии

#### Теги
```yaml
tags: ["хирургия", "онкология", "ИИ"]
```

#### Категории
```yaml
categories: ["Публикации", "Исследования"]
```

### Shortcodes

Hugo поддерживает встроенные shortcodes:

```markdown
{{< youtube VIDEO_ID >}}
{{< tweet TWEET_ID >}}
{{< figure src="/images/photo.jpg" title="Заголовок" >}}
```

## Кастомизация темы

### Переопределение шаблонов

Создайте файлы в `layouts/` для переопределения:

```
layouts/
├── _default/
│   ├── single.html      # Шаблон отдельной страницы
│   └── list.html        # Шаблон списка
├── partials/
│   ├── header.html      # Хедер
│   └── footer.html      # Футер
└── shortcodes/
    └── custom.html      # Кастомные shortcodes
```

### Кастомные CSS

Создайте `assets/css/extended/custom.css`:

```css
/* Ваши стили */
.custom-class {
    color: #333;
}
```

### Кастомные JS

Создайте `assets/js/custom.js`:

```javascript
// Ваш JavaScript код
console.log('Custom JS loaded');
```

## Troubleshooting

### Hugo не находит тему

```bash
# Проверьте наличие submodule
git submodule status

# Если пусто, инициализируйте
git submodule update --init --recursive
```

### Ошибка "extended version required"

Убедитесь, что установлена extended версия Hugo:

```bash
hugo version
# Должно содержать "extended"
```

### Проблемы с кодировкой

Убедитесь, что файлы сохранены в UTF-8:

```bash
file -i content/ru/about/_index.md
# Должно показать: charset=utf-8
```

### Netlify деплой не работает

1. Проверьте логи сборки в Netlify Dashboard
2. Убедитесь, что `NETLIFY_TOKEN` и `NETLIFY_SITE_ID` настроены
3. Проверьте, что ветка `main` содержит все изменения

### Изображения не отображаются

1. Проверьте путь: должен начинаться с `/`
2. Убедитесь, что файлы в `static/images/`
3. Проверьте регистр имени файла (case-sensitive)

## Полезные ссылки

- [Hugo Documentation](https://gohugo.io/documentation/)
- [PaperMod Theme](https://github.com/adityatelange/hugo-PaperMod)
- [Netlify Documentation](https://docs.netlify.com/)
- [Markdown Guide](https://www.markdownguide.org/)

## Поддержка

При возникновении проблем:
1. Проверьте документацию Hugo
2. Изучите issues в репозитории темы PaperMod
3. Создайте issue в этом репозитории

---

**Последнее обновление**: 20 октября 2025
