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

module type Reg =
    sig
        type definition

        val create : string -> definition

        exception Invalid_definition of string
    end
;;

(* <function_name>_raw param_1 ... ~regdef:<string_1> ... param_n
     is equivalent to call:
   <function_name> param_1 ... ~regdef:(reg.create <string_1>) ... param_n *)

module type Rule =
    sig
        type name = string

        (* It defines and registers a rule. A rule is a regular definition that can be used through its name. *)
        val create : name -> Reg.definition -> unit
        val create_raw : name -> string -> unit

        val to_regdef : name -> Reg.definition

        exception Inexistent_rule of name
    end
;;

(* <function_name>_rule param_1 ... ~rule_name:<string_1> ... param_n
     is equivalent to call:
   <function_name> param_1 ... ~regdef:(rule.to_regdef <string_1>) ... param_n *)

(* It returns true if the string 'to_match' matches exactly with 'regdef'. *)
val is_matching : string -> Reg.definition -> bool
val is_matching_raw : string -> string -> bool
val is_matching_rule : string -> Rule.name -> bool

val is_matching_prefix : string -> Reg.definition -> bool
val is_matching_prefix_raw : string -> string -> bool
val is_matching_prefix_rule : string -> Rule.name -> bool

val is_matching_suffix : string -> Reg.definition -> bool
val is_matching_suffix_raw : string -> string -> bool
val is_matching_suffix_rule : string -> Rule.name -> bool
;;
