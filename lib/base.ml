let () =
  if not (Py.is_initialized ())
  then Py.initialize ()

let py_builtins = Py.Module.builtins ()
let py_spacy = Py.import "spacy"
let py_iter = Py.Module.get_function py_builtins "iter"