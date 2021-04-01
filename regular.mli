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
        module Expr :
            sig
                type t = string (* concrete: should be abstract? *)

                val is_valid : t -> bool
            end
        ;;

        module Def :
            sig
                type t

                val create : Expr.t -> t

                exception Invalid_definition of Expr.t
            end
        ;;

    (* <function_name>_raw param_1 ... ~regdef:<string_1> ... param_n
         is equivalent to call:
       <function_name> param_1 ... ~regdef:(reg.create <string_1>) ... param_n *)

    (* <function_name>_rule param_1 ... ~rule_name:<string_1> ... param_n
         is equivalent to call:
       <function_name> param_1 ... ~regdef:(rule.to_regdef <string_1>) ... param_n *)

        module Rule :
            sig
                type name = string

                (* It defines and registers a rule. A rule is a regular definition that can be used through its name. *)
                val create : name -> Def.t -> unit
                val create_raw : name -> Expr.t -> unit

                val to_regdef : name -> Def.t

                exception Inexistent_rule of name
            end
        ;;

    (* It returns true if the string 'to_match' matches exactly with 'regdef'. *)
        val is_matching : string -> Def.t -> bool
        val is_matching_raw : string -> Expr.t -> bool
        val is_matching_rule : string -> Rule.name -> bool

        val is_matching_prefix : string -> Def.t -> bool
        val is_matching_prefix_raw : string -> Expr.t -> bool
        val is_matching_prefix_rule : string -> Rule.name -> bool

        val is_matching_suffix : string -> Def.t -> bool
        val is_matching_suffix_raw : string -> Expr.t -> bool
        val is_matching_suffix_rule : string -> Rule.name -> bool
    end
;;
