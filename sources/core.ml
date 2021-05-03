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

module Regdef : Regdef =
    struct
        type t =
        type literal = String.t

        let is_valid literal =

        let empty =

        let listing set =

        let range c d =

        let concatenation def1 def2 =

        let choice def1 def2 =

        let repetition def =

        let positive_repetition def =

        let defined_repetition def times =

        let possibility def =

        exception Invalid_definition of literal
    end
;;

module Rule : Rule =
    struct
        type name = String.t

        let create name regdef = ()
        let create_raw name regdef = ()

        let to_regdef name = "hi"

        exception Inexistent_rule of name
    end
;;

let is_matching to_match regdef = true
let is_matching_raw to_match regdef = true
let is_matching_rule to_match name = true

let is_matching_prefix to_match regdef = true
let is_matching_prefix_raw to_match regdef = true
let is_matching_prefix_rule to_match name = true

let is_matching_suffix to_match regdef = true
let is_matching_suffix_raw to_match regdef = true
let is_matching_suffix_rule to_match regdef = true
;;
