
# SSVproff - Surgery & AI in Medicine

Профессиональный научный блог и портфолио для SSVproff - хирургия, онкология, криотерапия и искусственный интеллект в медицине.

## 🎯 О проекте

Этот сайт представляет собой гибридную платформу, объединяющую:
- Статический контент (Hugo + PaperMod тема)
- Научные публикации и статьи
- Интерактивные AI демонстрации
- Блог о медицине и технологиях

## 📋 Требования

- **Hugo Extended** версии 0.120.0 или выше
- Git для управления версиями
- Make для автоматизации команд

## 🚀 Быстрый старт

### 1. Клонирование репозитория

```bash
git clone --recurse-submodules https://github.com/Serg2206/ssvproff-website-content.git
cd ssvproff-website-content
```

Если вы уже клонировали репозиторий без submodules:

```bash
git submodule update --init --recursive
```

### 2. Установка Hugo

#### macOS (Homebrew)
```bash
brew install hugo
```

#### Linux (Snap)
```bash
snap install hugo --channel=extended
```

#### Windows (Chocolatey)
```bash
choco install hugo-extended
```

#### Или скачайте с официального сайта
https://github.com/gohugoio/hugo/releases

### 3. Запуск локального сервера

```bash
make serve
```

Сайт будет доступен по адресу: http://localhost:1313

### 4. Сборка для продакшена

```bash
make build
```

Статические файлы будут созданы в директории `public/`

## 🛠️ Доступные команды

- `make serve` - Запуск локального сервера разработки
- `make build` - Сборка статического сайта
- `make clean` - Удаление сгенерированных файлов
- `make deploy` - Информация о деплое (автоматический через GitHub Actions)

## 📁 Структура проекта

```
ssvproff-website-content/
├── content/              # Контент сайта
│   ├── ru/              # Русский контент
│   │   ├── about/       # О себе
│   │   ├── publications/# Публикации
│   │   ├── blog/        # Блог
│   │   ├── ai-lab/      # AI Lab
│   │   └── contact/     # Контакты
│   └── en/              # Английский контент
│       └── ...          # Аналогичная структура
├── layouts/             # Кастомные шаблоны
├── static/              # Статические файлы
│   ├── images/          # Изображения
│   └── pdfs/            # PDF файлы
├── data/                # Данные для моделей
├── docs/                # Документация
├── scripts/             # Скрипты
├── themes/              # Темы Hugo
│   └── papermod/        # PaperMod тема (submodule)
├── .github/             # GitHub Actions
│   └── workflows/       # CI/CD конфигурация
├── config.toml          # Конфигурация Hugo
├── Makefile             # Автоматизация команд
└── README.md            # Этот файл
```

## 🌐 Деплой на Netlify

### Настройка GitHub Secrets

1. Перейдите в Settings → Secrets and variables → Actions
2. Добавьте новый secret: `NETLIFY_TOKEN`
3. Получите токен на https://app.netlify.com/user/applications

### Автоматический деплой

При каждом push в ветку `main` автоматически запускается GitHub Actions workflow, который:
1. Устанавливает Hugo Extended 0.120.0
2. Собирает сайт командой `make build`
3. Деплоит на Netlify

## ✍️ Добавление контента

### Создание новой публикации (русский)

```bash
hugo new content/ru/publications/название-статьи.md
```

### Создание новой публикации (английский)

```bash
hugo new content/en/publications/article-title.md
```

### Создание нового поста в блоге

```bash
hugo new content/ru/blog/название-поста.md
```

## 🎨 Кастомизация

Основные настройки находятся в `config.toml`:
- Базовый URL сайта
- Настройки языков (русский/английский)
- Меню навигации
- Параметры темы PaperMod
- Социальные ссылки

## 📚 Документация

Подробная документация доступна в директории `docs/`:
- `docs/SETUP.md` - Детальная инструкция по настройке

## 🤝 Вклад в проект

Этот репозиторий является шаблоном для личного сайта. Для использования:
1. Создайте новый репозиторий на основе этого шаблона
2. Настройте свои данные в `config.toml`
3. Добавьте свой контент в `content/`

## 📄 Лицензия

Контент и код распространяются под лицензией MIT.

## 📧 Контакты

- GitHub: [@Serg2206](https://github.com/Serg2206)
- Email: ssvproff@example.com

---

**Создано с использованием Hugo и темы PaperMod**
