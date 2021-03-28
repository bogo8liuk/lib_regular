val match_count : ~to_check:string -> ~regdef:reg.definition -> int
val match_count_raw : ~to_check:string -> ~regdef:string -> int
val match_count_rule : ~to_check:string -> ~name:rule.name -> int

val matching_substrings : ~to_check:string -> ~regdef:reg.definition -> string list
val matching_substrings_raw : ~to_check:string -> ~regdef:string -> string list
val matching_substrings_rule : ~to_check:string -> ~name:rule.name -> string list

val split_string : ~to_change:string -> ~regdef:reg.definition -> string list
val split_string_raw : ~to_change:string -> ~regdef:string -> string list
val split_string_rule : ~to_change:string -> ~name:rule.name -> string list

(* It substitutes every substring in 'to_change' matching with 'regdef' with the result of the call:
     substitution to_compute
   The function is granted to be called at every match and not once for all. *)
val replace_with : ~to_change:string -> ~substitution:('a -> string) -> ~to_compute:'a -> ~regdef:reg.definition -> string
val replace_with_raw : ~to_change:string -> ~substitution:('a -> string) -> ~to_compute:'a -> ~regdef:string -> string
val replace_with_rule : ~to_change:string -> ~substitution:('a -> string) -> ~to_compute:'a -> ~name:rule.name -> string

(* It substitutes every substring in 'to_change' matching with 'regdef' with 'to_substitute' string. *)
val replace_string : ~to_change:string -> ~to_substitute:string -> ~regdef:reg.definition -> string
val replace_string_raw : ~to_change:string -> ~to_substitute:string -> ~regdef:string -> string
val replace_string_rule : ~to_change:string -> ~to_substitute:string -> ~name:rule.name -> string

(* It is same as 'replace_with', except that it replaces the first 'times' matches. If there is less
   matches than 'times', this call is equivalent to 'replace_with'. *)
val replace_with_first : ~to_change:string -> ~substitution:('a -> string) -> ~to_compute:'a -> ~regdef:reg.definition -> ~times:int -> string
val replace_with_first_raw : ~to_change:string -> ~substitution:('a -> string) -> ~to_compute:'a -> ~regdef:string -> ~times:int -> string
val replace_with_first_rule : ~to_change:string -> ~substitution:('a -> string) -> ~to_compute:'a -> ~name:rule.name -> ~times:int -> string

val replace_string_first : ~to_change:string -> ~to_substitute:string -> ~regdef:reg.definition -> ~times:int -> string
val replace_string_first_raw : ~to_change:string -> ~to_substitute:string -> ~regdef:string -> ~times:int -> string
val replace_string_first_rule : ~to_change:string -> ~to_substitute:string -> ~name:rule.name -> ~times:int -> string
;;
