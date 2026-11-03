# Markdown CV publisher

A template that takes a CV written in Markdown, converts it to HTML and PDF, and builds both automatically with GitHub Actions.

It uses [pandoc](https://pandoc.org/) and [WeasyPrint](https://weasyprint.org/) to convert the files, and `cv.css` to style them.

> **Note:** This repository is meant to be used as a template. Edit `input.md` with your own content and adapt the workflow to wherever you want to publish your CV. The deploy step in `.github/workflows/build-and-deploy.yml` copies the output to a VPS over SSH. This is only an example, so replace it with your own deployment target (GitHub Pages, S3, Netlify, etc.) or remove it.

## How to run locally

First, build the converter image:

```sh
docker build -t local-cv-converter .
```

### Convert to HTML

```sh
docker run \
  -w /data \
  -v ".:/data" \
  -u "$(id -u):$(id -g)" \
  local-cv-converter \
  -s input.md \
  --css=cv.css \
  --embed-resources \
  --metadata pagetitle="My CV" \
  -o dist/output.html
```

### Convert to PDF

```sh
docker run \
  -w /data \
  -v ".:/data" \
  -u "$(id -u):$(id -g)" \
  local-cv-converter \
  -s input.md \
  -t html \
  --css=cv.css \
  --embed-resources \
  --metadata pagetitle="My CV" \
  --pdf-engine=weasyprint \
  -o dist/output.pdf
```
