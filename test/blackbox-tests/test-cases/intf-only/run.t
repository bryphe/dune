Successes:

  $ dune build --display short --root foo --debug-dep 2>&1 | grep -v Entering
      ocamldep test/bar.ml.d
      ocamldep foo.ml.d
        ocamlc .foo.objs/foo__.{cmt,cmi,cmo}
      ocamlopt .foo.objs/foo__.{cmx,o}
      ocamldep intf.mli.d
        ocamlc .foo.objs/foo__Intf.{cmti,cmi}
        ocamlc .foo.objs/foo.{cmt,cmi,cmo}
        ocamlc test/.bar.objs/bar.{cmt,cmi,cmo}
        ocamlc test/bar.cma
      ocamlopt .foo.objs/foo.{cmx,o}
      ocamlopt test/.bar.objs/bar.{cmx,o}
      ocamlopt test/bar.{cmxa,a}
      ocamlopt test/bar.cmxs
        ocamlc foo.cma
      ocamlopt foo.{cmxa,a}
      ocamlopt foo.cmxs

Errors:

  $ dune build --display short --root a foo.cma 2>&1 | grep -v Entering
  File "dune", line 2, characters 1-13:
  Warning: Some modules don't have an implementation.
  You need to add the following field to this stanza:
  
    (modules_without_implementation (x y))
  
  This will become an error in the future.
        ocamlc .foo.objs/foo.{cmo,cmt,cmi}
        ocamlc foo.cma
  $ dune build --display short --root b foo.cma 2>&1 | grep -v Entering
  File "dune", line 3, characters 34-37:
  Warning: The following modules must be listed here as they don't have an implementation:
  - y
  This will become an error in the future.
        ocamlc .foo.objs/foo.{cmo,cmt,cmi}
        ocamlc foo.cma
  $ dune build --display short --root c foo.cma 2>&1 | grep -v Entering
  File "dune", line 3, characters 35-36:
  Error: Module X doesn't exist.
  $ dune build --display short --root d foo.cma 2>&1 | grep -v Entering
  File "dune", line 3, characters 35-36:
  Error: Module X has an implementation, it cannot be listed here
