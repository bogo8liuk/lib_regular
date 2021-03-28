(*
MIT License

Copyright (c) 2021 bogo8liuk

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*)

val match_count : ~to_check:string -> ~regdef:Reg.definition -> int
val match_count_raw : ~to_check:string -> ~regdef:string -> int
val match_count_rule : ~to_check:string -> ~name:Rule.name -> int

val matching_substrings : ~to_check:string -> ~regdef:Reg.definition -> string list
val matching_substrings_raw : ~to_check:string -> ~regdef:string -> string list
val matching_substrings_rule : ~to_check:string -> ~name:Rule.name -> string list

val split_string : ~to_change:string -> ~regdef:Reg.definition -> string list
val split_string_raw : ~to_change:string -> ~regdef:string -> string list
val split_string_rule : ~to_change:string -> ~name:Rule.name -> string list

(* It substitutes every substring in 'to_change' matching with 'regdef' with the result of the call:
     substitution to_compute
   The function is granted to be called at every match and not once for all. *)
val replace_with : ~to_change:string -> ~substitution:('a -> string) -> ~to_compute:'a -> ~regdef:Reg.definition -> string
val replace_with_raw : ~to_change:string -> ~substitution:('a -> string) -> ~to_compute:'a -> ~regdef:string -> string
val replace_with_rule : ~to_change:string -> ~substitution:('a -> string) -> ~to_compute:'a -> ~name:Rule.name -> string

(* It substitutes every substring in 'to_change' matching with 'regdef' with 'to_substitute' string. *)
val replace_string : ~to_change:string -> ~to_substitute:string -> ~regdef:Reg.definition -> string
val replace_string_raw : ~to_change:string -> ~to_substitute:string -> ~regdef:string -> string
val replace_string_rule : ~to_change:string -> ~to_substitute:string -> ~name:Rule.name -> string

(* It is same as 'replace_with', except that it replaces the first 'times' matches. If there is less
   matches than 'times', this call is equivalent to 'replace_with'. *)
val replace_with_first : ~to_change:string -> ~substitution:('a -> string) -> ~to_compute:'a -> ~regdef:Reg.definition -> ~times:int -> string
val replace_with_first_raw : ~to_change:string -> ~substitution:('a -> string) -> ~to_compute:'a -> ~regdef:string -> ~times:int -> string
val replace_with_first_rule : ~to_change:string -> ~substitution:('a -> string) -> ~to_compute:'a -> ~name:Rule.name -> ~times:int -> string

val replace_string_first : ~to_change:string -> ~to_substitute:string -> ~regdef:Reg.definition -> ~times:int -> string
val replace_string_first_raw : ~to_change:string -> ~to_substitute:string -> ~regdef:string -> ~times:int -> string
val replace_string_first_rule : ~to_change:string -> ~to_substitute:string -> ~name:Rule.name -> ~times:int -> string
;;
