  $ env ORIG_PATH="$PATH" PATH="$PWD/ocaml-bin:$PATH" jbuilder build --display short
      ocamldep bin/toto.ml.d
        ocamlc bin/.toto.eobjs/toto.{cmo,cmt,cmi}
        ocamlc bin/toto.exe
      ocamldep src/foo.ml.d
        ocamlc src/.foo.objs/foo.{cmt,cmi,cmo}
        ocamlc src/foo.cma

Check that building a native only executable fails
  $ env ORIG_PATH="$PATH" PATH="$PWD/ocaml-bin:$PATH" jbuilder build --display short native-only/foo.exe
  Don't know how to build native-only/foo.exe
  [1]
