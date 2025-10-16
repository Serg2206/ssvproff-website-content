site_name: SSVproff — Open Surgical Science
site_url: https://ssvnauka.com
repo_url: https://github.com/Serg2206/ssvproff-website-content
repo_name: Serg2206/ssvproff-website-content
theme:
  name: material
  language: ru
  palette:
    - media: "(prefers-color-scheme: light)"
      scheme: default
      primary: indigo
      accent: blue
    - media: "(prefers-color-scheme: dark)"
      scheme: slate
      primary: indigo
      accent: blue
nav:
  - Главная: index.md
  - Онкохирургия: 
    - articles/oncology/gastric-resection.md
  - Патогенез:
    - articles/pathogenesis/peritonitis.md
  - История:
    - articles/history/laparoscopy-1995.md
plugins:
  - search
  - git-revision-date-localized
markdown_extensions:
  - toc
  - tables
  - fenced_code
