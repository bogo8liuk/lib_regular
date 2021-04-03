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

open Core

val match_count : string -> Regdef.t -> int
val match_count_raw : string -> Regdef.literal -> int
val match_count_rule : string -> Rule.name -> int

val matching_substrings : string -> Regdef.t -> string list
val matching_substrings_raw : string -> Regdef.literal -> string list
val matching_substrings_rule : string -> Rule.name -> string list

val split_string : string -> Regdef.t -> string list
val split_string_raw : string -> Regdef.literal -> string list
val split_string_rule : string -> Rule.name -> string list

val replace_with : string -> ('a -> string) -> 'a -> Regdef.t -> string
val replace_with_raw : string -> ('a -> string) -> 'a -> Regdef.literal -> string
val replace_with_rule : string -> ('a -> string) -> 'a -> Rule.name -> string

val replace_string : string -> string -> Regdef.t -> string
val replace_string_raw : string -> string -> Regdef.literal -> string
val replace_string_rule : string -> string -> Rule.name -> string

val replace_with_first : string -> ('a -> string) -> 'a -> Regdef.t -> int -> string
val replace_with_first_raw : string -> ('a -> string) -> 'a -> Regdef.literal -> int -> string
val replace_with_first_rule : string -> ('a -> string) -> 'a -> Rule.name -> int -> string

val replace_string_first : string -> string -> Regdef.t -> int -> string
val replace_string_first_raw : string -> string -> Regdef.literal -> int -> string
val replace_string_first_rule : string -> string -> Rule.name -> int -> string
;;
