module type REGULAR =
    sig
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

        val match_count : ~to_check:string -> ~regdef:regdef -> int
        val match_count_raw : ~to_check:string -> ~regdef:string -> int
        val match_count_rule : ~to_check:string -> ~rule_name:string -> int

        val matching_substrings : ~to_check:string -> ~regdef:regdef -> string list
        val matching_substrings_raw : ~to_check:string -> ~regdef:string -> string list
        val matching_substrings_rule : ~to_check:string -> ~rule_name:string -> string list

        val split_string : ~to_change:string -> ~regdef:regdef -> string list
        val split_string_raw : ~to_change:string -> ~regdef:string -> string list
        val split_string_rule : ~to_change:string -> ~rule_name:string -> string list

        (* It substitutes every substring in 'to_change' matching with 'regdef' with the result of the call:
             substitution to_compute
           The function is granted to be called at every match and not once for all. *)
        val replace_with : ~to_change:string -> ~substitution:(string -> string) -> ~to_compute:string -> ~regdef:regdef -> string
        val replace_with_raw : ~to_change:string -> ~substitution:(string -> string) -> ~to_compute:string -> ~regdef:string -> string
        val replace_with_rule : ~to_change:string -> ~substitution:(string -> string) -> ~to_compute:string -> ~rule_name:string -> string

        (* It substitutes every substring in 'to_change' matching with 'regdef' with 'to_substitute' string. *)
        val replace_string : ~to_change:string -> ~to_substitute:string -> ~regdef:regdef -> string
        val replace_string_raw : ~to_change:string -> ~to_substitute:string -> ~regdef:string -> string
        val replace_string_rule : ~to_change:string -> ~to_substitute:string -> ~rule_name:string -> string

        (* It is same as 'replace_with', except that it replaces the first 'times' matches. If there is less
           matches than 'times', this call is equivalent to 'replace_with'. *)
        val replace_with_first : ~to_change:string -> ~substitution:(string -> string) -> ~to_compute:string -> ~regdef:regdef -> ~times:int -> string
        val replace_with_first_raw : ~to_change:string -> ~substitution:(string -> string) -> ~to_compute:string -> ~regdef:string -> ~times:int -> string
        val replace_with_first_rule : ~to_change:string -> ~substitution:(string -> string) -> ~to_compute:string -> ~rule_name:string -> ~times:int -> string

        val replace_string_first : ~to_change:string -> ~to_substitute:string -> ~regdef:regdef -> ~times:int -> string
        val replace_string_first_raw : ~to_change:string -> ~to_substitute:string -> ~regdef:regdef -> ~times:int -> string
        val replace_string_first_rule : ~to_change:string -> ~to_substitute:string -> ~regdef:regdef -> ~times:int -> string

        exception Invalid_regdef of string
        exception Inexistent_rule of string
    end
;;
