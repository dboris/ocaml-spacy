(lang dune 3.5)

(name spacy)

(generate_opam_files true)

(source (github dboris/ocaml-spacy))
(authors "Boris D. <borisd@gmx.com>")
(maintainers "Boris D. <borisd@gmx.com>")
(license ISC)

(package
 (name spacy)
 (synopsis "OCaml wrapper for the spaCy NLP python library")
 (depends ocaml dune pyml)
 (tags (spacy nlp text python)))
