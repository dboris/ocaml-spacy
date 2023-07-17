.PHONY: build clean run

build clean:
	@dune $@

run:
	dune exec example/main.exe