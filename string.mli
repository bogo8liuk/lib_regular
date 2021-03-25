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
;;
