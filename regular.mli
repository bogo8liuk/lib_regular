type regdef

module type reg =
    sig
        type definition

        val create : string -> definition

        exception Invalid_definition of string
    end
;;

(* <function_name>_raw param_1 ... ~regdef:<string_1> ... param_n
     is equivalent to call:
   <function_name> param_1 ... ~regdef:(reg.create <string_1>) ... param_n *)

module type rule =
    sig
        type name = string

        (* It defines and registers a rule. A rule is a regular definition that can be used through its name. *)
        val create : ~name:name -> ~regdef:reg.definition -> unit
        val create_raw : ~name:name -> ~regdef:string -> unit

        val to_regdef : ~name:name -> reg.definition

        exception Inexistent_rule of name
    end
;;

(* <function_name>_rule param_1 ... ~rule_name:<string_1> ... param_n
     is equivalent to call:
   <function_name> param_1 ... ~regdef:(rule.to_regdef <string_1>) ... param_n *)

(* It returns true if the string 'to_match' matches exactly with 'regdef'. *)
val is_matching : ~to_match:string -> ~regdef:reg.definition -> bool
val is_matching_raw : ~to_match:string -> ~regdef:string -> bool
val is_matching_rule : ~to_match:string -> ~name:rule.name -> bool

val is_matching_prefix : ~to_match:string -> ~regdef:reg.definition -> bool
val is_matching_prefix_raw : ~to_match:string -> ~regdef:string -> bool
val is_matching_prefix_rule : ~to_match:string -> ~name:rule.name -> bool

val is_matching_suffix : ~to_match:string -> ~regdef:reg.definition -> bool
val is_matching_suffix_raw : ~to_match:string -> ~regdef:string -> bool
val is_matching_suffix_rule : ~to_match:string -> ~name:rule.name -> bool
;;
