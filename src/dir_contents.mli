(** Directories contents *)

(** This modules takes care of attaching modules and mlds files found
    in the source tree or generated by user rules to library,
    executables, tests and documentation stanzas. *)

open Import

type t

(** Files in this directory. At the moment, this doesn't include all
    generated files, just the ones generated by [rule], [ocamllex],
    [ocamlyacc], [menhir] stanzas. *)
val text_files : t -> String.Set.t

module Library_modules : sig
  type t =
    { modules          : Module.t Module.Name.Map.t
    ; alias_module     : Module.t option
    ; main_module_name : Module.Name.t
    }
end

module Executables_modules : sig
  type t = Module.t Module.Name.Map.t
end

(** Modules attached to a library. [name] is the library best name. *)
val modules_of_library : t -> name:string -> Library_modules.t

(** Modules attached to a set of executables. *)
val modules_of_executables : t -> first_exe:string -> Executables_modules.t

(** Find out what buildable a module is part of *)
val lookup_module : t -> Module.Name.t -> Jbuild.Buildable.t option

(** All mld files attached to this documentation stanza *)
val mlds : t -> Jbuild.Documentation.t -> Path.t list

val get : Super_context.t -> dir:Path.t -> t
