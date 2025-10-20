
.PHONY: serve build clean deploy help

help:
	@echo "Available commands:"
	@echo "  make serve   - Start Hugo development server"
	@echo "  make build   - Build static site"
	@echo "  make clean   - Remove generated files"
	@echo "  make deploy  - Deploy to Netlify (via GitHub Actions)"

serve:
	hugo server -D --bind 0.0.0.0

build:
	hugo --minify

clean:
	rm -rf public/ resources/

deploy: build
	@echo "Deploy to Netlify via GitHub Actions"
	@echo "Push your changes to trigger automatic deployment"
