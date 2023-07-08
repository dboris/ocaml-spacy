open Base

module Language = Language

let iter_map f obj =
  Py.Iter.to_seq_map f (py_iter [| obj |])

let pipe (`Model model) str_seq =
  let pipe =
    Py.Module.get_function model "pipe"
  in
  Py.Iter.to_seq_map
    (fun doc -> `Doc doc)
    (pipe [| Py.Iter.of_seq_map Py.String.of_string str_seq |])

let token_seq doc_or_span =
  (match doc_or_span with
  | `Doc doc -> doc
  | `Span span -> span)
  |> iter_map (fun tok -> `Token tok)

let sentence_seq (`Doc doc) =
  iter_map (fun sent -> `Span sent) (Py.Module.get doc "sents")

let string_attr obj attr =
  Py.String.to_string (Py.Module.get obj attr)

let int_attr obj attr =
  Py.Int.to_int (Py.Module.get obj attr)

let bool_attr obj attr =
  Py.Bool.to_bool (Py.Module.get obj attr)

let float_attr obj attr =
  Py.Float.to_float (Py.Module.get obj attr)
