val load_model : string -> string -> unit
(** [load_model lang_code model_name] loads the language model and
    associates it to the corresponding language code. This is useful if
    you need to load a custom model before calling {!get_model} *)

val get_model :
  ?size:[> `Large | `Small ] -> string -> [> `Model of Pytypes.pyobject ]
(** [get_model lang_code] loads and returns the language model associated
    to the [lang_code] language code. The [size] parameter selects the
    language model size. [`Small] is optimized for efficiency,
    [`Large] for accuracy. Default is [`Small]. *)
