include .env

up:
	@docker compose up -d --remove-orphans

develop: up
	@open http://localhost:8008

down:
	@docker compose down -v

build:
	@docker compose build

generate-pdf:
	@docker compose exec pdf_maker sh -c "node ./index.js"
	@docker compose cp pdf_maker:./cv.pdf ./public/cv.pdf

test-html: up
	@docker compose exec http-client sh -c "curl -X GET http://${SERVICE_NAME}:${PORT}"

view-pdf: up generate-pdf
	@open http://localhost:8008/cv.pdf