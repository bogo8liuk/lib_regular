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

open Base

module NFA : NFA =
    struct
        module State : State =
            struct
                type category = Non_final | Final

                type t = Int.t
            end

        type atom = (State.category * (State.t * Automaton.transition) List.t)

        type t = atom Array.t (* State.t is used to index *)

        type regular_case =
            | Single of Automaton.transition
            | Choice of regular_case * regular_case
            | Listing of char list
            | Range of char * char
            | Concatenation of regular_case * regular_case
            | Repetition of regular_case
            | Pos_repetition of regular_case
            | Def_repetiton of regular_case
            | Possibility of regular_case
            | Construct of t

        let number_of : State.t * atom -> State.t =
            fun (s, _) -> s

        let atom_of : State.t * atom -> atom =
            fun (_, a) -> a

        let make : atom List.t -> atom Array.t =
            (* TODO *)

        let rec _create ~case ~id ~res ~meta =
            match case with
                | Single tr ->
                    let q1 = id
                    and (q2, symbol) = (id + 1, tr) in
                    match meta with
                        | [] ->
                            make (q1, Final, [(q2, symbol)]) :: res
                        | r :: tail ->
                            _create ~case:r ~id:(id + 2) ~res:((q1, Non_final, [(q2, symbol)])) ~meta:tail
                | Choice (r1, r2) ->
                | Listing clist ->
                | Range (c1, c2) ->
                | Concatenation (r1, r2) ->
                | Repetition r ->
                | Pos_repetition r ->
                | Def_repetition r ->
                | Possibility r ->
                | Construct t ->

        let create case =
            _create ~case:case ~id:0 ~res:[] ~meta:[]

    end
;;
