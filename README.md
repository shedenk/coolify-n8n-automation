# Coolify n8n Automation Template

Template untuk deploy sistem otomatisasi video harian (50 video pendek/hari) via n8n, MinIO, TTS, dan lainnya.

## Fitur

- n8n dengan tools: `yt-dlp`, `ffmpeg`, `puppeteer`, `pandoc`, `newspaper4k`, `qpdf`
- TTS via Wyoming Piper
- Upload otomatis ke MinIO
- Workflow siap pakai: download → TTS → merge video → upload

## Deploy di Coolify

1. Fork repo ini
2. Di Coolify → Add Service → Application
3. Pilih repo ini
4. Build Method: `Docker`
5. Dockerfile Path: `Dockerfile.n8n`
6. Tambahkan environment:
   - `N8N_BASIC_AUTH_USER`
   - `N8N_BASIC_AUTH_PASSWORD`
   - dll
7. Tambahkan volume:
   - `/home/node/.n8n`
   - `/downloads`
8. Deploy

## Workflow

Import `workflows/daily-video-automation.json` ke n8n.
