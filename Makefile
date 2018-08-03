OCB_FLAGS = -cflag -use-ocamlfind -I src
OCB = ocamlbuild $(OCB_FLAGS)

all: native byte

clean:
	$(OCB) -clean

native: sanity
	$(OCB) computorv1.native

byte: sanity
	$(OCB) computorv1.byte

profile: sanity
	$(OCB) -tag profile computorv1.native

debug: sanity
	$(OCB) -tag debug computorv1.byte

sanity:
	ocamlfind query

test: native
	./computorv1.native "2 * a ^ 3 + b ^ 1 + 5"

install_deps:
	@echo "\033[32msearching for dependencies....\033[0m"
	@opam install yojson

.PHONY: all clean byte native profile debug sanity test
