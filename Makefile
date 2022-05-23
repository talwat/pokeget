PREFIX = ~/.local

all:
	@echo "Run 'export VERSION=<version>' to select the version"
	@echo "Selected version: $$VERSION"

zipfiles:
	@-rm -v output/*.tar.* output/*.tar output/*.zip
	@-mkdir -v output

	@echo "Making source archives..."
	@echo "Making .tar files..."
	@tar cvf output/pokeget_$$VERSION-src.tar Makefile pokeget
	@tar cvf output/pokeget-lite_$$VERSION-src.tar Makefile pokeget-lite

	@echo "Making .tar.gz files..."
	@tar cvzf output/pokeget_$$VERSION-src.tar.gz Makefile pokeget
	@tar cvzf output/pokeget-lite_$$VERSION-src.tar.gz Makefile pokeget-lite

	@echo "Making .tar.xz files..."
	@tar cvf - Makefile pokeget | xz -z - > output/pokeget_$$VERSION.tar.xz
	@tar cvf - Makefile pokeget-lite | xz -z - > output/pokeget-lite_$$VERSION.tar.xz

	@echo "Making .zip files..."
	@zip -r output/pokeget_$$VERSION.zip Makefile pokeget
	@zip -r output/pokeget-lite_$$VERSION.zip Makefile pokeget-lite

install:
	@mkdir -p $(PREFIX)/bin
	@cp -p pokeget $(PREFIX)/bin/pokeget
	@chmod +x $(PREFIX)/bin/pokeget

uninstall:
	@rm -rf $(PREFIX)/bin/pokeget

clean:
	@-rm -v -rf output

pathadd:
	@echo 'export PATH="$$HOME/.local/bin:$$PATH"' >> ~/.profile
	@test -f ~/.bashrc && echo 'export PATH="$$HOME/.local/bin:$$PATH"' >> ~/.bashrc
	@test -f ~/.zshrc && echo 'export PATH="$$HOME/.local/bin:$$PATH"' >> ~/.zshrc

getpokedex:
	@./scripts/get_pokedex.sh

gitrestore:
	@git restore Formula
	@git restore other
	@git status

gh-copy:
	@cp README.md docs/index.md
	@cp *.md docs/
	@rm docs/README.md
	@./scripts/dev/fix_md.sh