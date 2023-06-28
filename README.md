This project enables the use of the [spaCy](https://spacy.io/)
NLP python library from OCaml.

## Prerequisites

Python and [spaCy](https://spacy.io/usage) must be installed on your system.

## Usage

Run the example with `make run`.

The following tokenizes a list of text documents and prints out some
information about each token:

```ocaml
open Spacy

let pp_token (`Token tok) =
  Printf.sprintf "%-20s %-20s\t%s\t%s\t%d\t%b"
    (string_attr tok "text")
    (string_attr tok "lemma_")
    (string_attr tok "pos_")
    (string_attr tok "tag_")
    (int_attr tok "i")
    (bool_attr tok "is_sent_start")

let () =
  List.to_seq
    [ "This is a sentence. This is another sentence."
    ; "What a great example of the capabilities of this library!"
    ]
  |> pipe (Language.get_model "en")
  |> Seq.iter (fun doc ->
    token_seq doc
    |> Seq.map pp_token
    |> Seq.iter print_endline)
```