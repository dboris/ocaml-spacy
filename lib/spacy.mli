module Language = Language

val pipe :
  [< `Model of Pytypes.pyobject ] ->
  string Seq.t ->
  [> `Doc of Pytypes.pyobject ] Seq.t
(** [pipe model string_seq] returns a sequence of parsed spaCy Docs,
    corresponding to the input string sequence. *)

val token_seq :
  [< `Doc of Pytypes.pyobject ] ->
  [> `Token of Pytypes.pyobject ] Seq.t
(** [token_seq doc] returns a sequnce of spaCy tokens. *)

val string_attr : Pytypes.pyobject -> string -> string
(** [string_attr py_object] returns the attribute of [py_object] (eg token)
    converted to OCaml string. *)

val int_attr : Pytypes.pyobject -> string -> int
(** [int_attr py_object] returns the attribute of [py_object] (eg token)
    converted to OCaml int. *)

val bool_attr : Pytypes.pyobject -> string -> bool
(** [bool_attr py_object] returns the attribute of [py_object] (eg token)
    converted to OCaml bool. *)
