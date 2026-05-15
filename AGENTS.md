# Repository Guidelines

## Project Structure & Module Organization

This repository builds a static CV page and can render it to PDF. The root contains the Node entry point, Docker setup, and Makefile automation. `index.js` uses `html-pdf-node` to generate `cv.pdf` from the running web service. The CV source lives in `public/index.html` and `public/index.css`. Image, font, and logo assets are under `public/public/`; keep new assets there and reference them with the existing relative paths such as `./public/profile.png`.

## Build, Test, and Development Commands

- `npm install`: install Node dependencies from `package-lock.json`.
- `npm run make`: run `index.js` directly; this expects `SERVICE_NAME` and `PORT` to resolve a reachable HTML page.
- `make build`: build Docker images for the web server and PDF maker.
- `make develop`: start Docker Compose and open `http://localhost:8008`.
- `make generate-pdf`: render the current CV into `public/cv.pdf`.
- `make view-pdf`: generate and open the PDF in the browser.
- `make test-html`: curl the web service from the Docker network.
- `make down`: stop containers and remove volumes.

## Coding Style & Naming Conventions

Use the existing plain HTML, CSS, and CommonJS style. Keep indentation at 4 spaces in HTML/CSS/JS. Prefer descriptive CSS class names that match the current pattern, for example `.job-experience`, `.secondary`, or `.mt-30`. Store static files with lowercase, hyphenated names when adding new assets; preserve existing names unless updating all references.

## Testing Guidelines

There is no unit test framework in this project. Before submitting changes, run `make test-html` after `make develop` or `make up` to confirm the static page is served. For visual or layout changes, run `make generate-pdf` and inspect `public/cv.pdf` to ensure the print layout still fits the A4 page.

## Commit & Pull Request Guidelines

Recent commits use short, informal imperative summaries, for example `fixing the color` or `adding my information of philips`. Keep commits concise and focused on one change. Pull requests should describe the visible CV or PDF changes, mention any asset additions, list the validation commands run, and include screenshots or the generated PDF when layout changes are involved.

## Configuration Notes

Docker and Makefile commands read `.env`; the current expected values are `PORT=8008` and `SERVICE_NAME=web_server`. Do not commit generated files unless intentionally updating the published PDF output.
