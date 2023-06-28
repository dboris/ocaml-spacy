open Base

module Models = Map.Make(String)

let models = ref Models.empty

let sm_models =
  [ "en", "en_core_web_sm"
  ; "de", "de_core_news_sm"
  ; "fr", "fr_core_news_sm"
  ; "ru", "ru_core_news_sm"
  ; "zh", "zh_core_web_sm"
  ; "ja", "ja_core_news_sm"
  ; "es", "es_core_news_sm"
  ; "it", "it_core_news_sm"
  ; "pt", "pt_core_news_sm"
  ; "ko", "ko_core_news_sm"
  ; "el", "el_core_news_sm"
  ]

let lg_models =
  [ "en", "en_core_web_trf"
  ; "de", "de_dep_news_trf"
  ; "fr", "fr_dep_news_trf"
  ; "ru", "ru_core_news_lg"
  ; "zh", "zh_core_web_trf"
  ; "ja", "ja_core_news_trf"
  ; "es", "es_dep_news_trf"
  ; "it", "it_core_news_lg"
  ; "pt", "pt_core_news_lg"
  ; "ko", "ko_core_news_lg"
  ; "el", "el_core_news_lg"
  ]

let load_model lang_code model_name =
  let load = Py.Module.get_function py_spacy "load" in
  let model = load [| Py.String.of_string model_name |] in
  models := Models.add lang_code model !models

let get_model ?(size = `Small) lang_code =
  let load_small () =
    load_model lang_code (List.assoc lang_code sm_models)
  and load_large () =
    load_model lang_code (List.assoc lang_code lg_models)
  in
  let () =
    if not (Models.mem lang_code !models) then
      match size with
      | `Small when List.mem_assoc lang_code sm_models ->
        load_small ()
      | `Large when List.mem_assoc lang_code lg_models ->
        load_large ()
      | _ ->
        raise (Invalid_argument ("Language not supported: " ^ lang_code))
  in
  `Model (Models.find lang_code !models)