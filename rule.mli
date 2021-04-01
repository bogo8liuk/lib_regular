    module type RULE =
        sig
            type name = string

            (* It defines and registers a rule. A rule is a regular definition that can be used through its name. *)
            val create : name -> REG.DEF.t -> unit
            val create_raw : name -> string -> unit

            val to_regdef : name -> REG.DEF.t

            exception Inexistent_rule of name
        end
    ;;

