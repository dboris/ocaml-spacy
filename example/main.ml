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
  |> Seq.iter @@ fun doc ->
    token_seq doc
    |> Seq.map pp_token
    |> Seq.iter print_endline;
    print_endline "Sentences:";
    sentence_seq doc
    |> Seq.map (fun (`Span sent) -> string_attr sent "text")
    |> Seq.iter print_endline
