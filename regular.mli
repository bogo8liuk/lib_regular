type regdef

val create_regdef : string -> regdef

(* <function_name>_raw param_1 ... ~regdef:<string_1> ... param_n
     is equivalent to call:
   <function_name> param_1 ... ~regdef:(create_regdef <string_1>) ... param_n *)

(* It defines and registers a rule. A rule is a regular definition that can be used through its name. *)
val create_rule : ~name:string -> ~regdef:regdef -> unit
val create_rule_raw : ~name:string -> ~regdef:string -> unit

val rule_to_regdef : ~rule_name:string -> regdef

(* <function_name>_rule param_1 ... ~rule_name:<string_1> ... param_n
     is equivalent to call:
   <function_name> param_1 ... ~regdef:(rule_to_regdef <string_1>) ... param_n *)

(* It returns true if the string 'to_match' matches exactly with 'regdef'. *)
val is_matching : ~to_match:string -> ~regdef:regdef -> bool
val is_matching_raw : ~to_match:string -> ~regdef:string -> bool
val is_matching_rule : ~to_match:string -> ~rule_name:string -> bool

val is_matching_prefix : ~to_match:string -> ~regdef:regdef -> bool
val is_matching_prefix_raw : ~to_match:string -> ~regdef:string -> bool
val is_matching_prefix_rule : ~to_match:string -> ~rule_name:string -> bool

val is_matching_suffix : ~to_match:string -> ~regdef:regdef -> bool
val is_matching_suffix_raw : ~to_match:string -> ~regdef:string -> bool
val is_matching_suffix_rule : ~to_match:string -> ~rule_name:string -> bool

exception Invalid_regdef of string
exception Inexistent_rule of string
;;
