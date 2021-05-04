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

        type atom = {
            category : State.category ;
            adjacencies : (State.t * Automaton.transition) List.t
        }

        type t = atom Array.t (* State.t is used to index *)

        type regular_case =
            | Single of Automaton.transition
            | Choice of regular_case * regular_case
            | Listing of Char.t List.t
            | Range of Char.t * Char.t
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

        let make : atom List.t -> Int.t -> atom Array.t =
            (* TODO *)

        (* stack is used for tail recursion. *)
        let rec _create ~case ~id ~res ~stack =
            match case with
                | Single tr, s, e -> (
                    match stack with
                        | [] ->
                            make ((s, { category = Non_final ; adjacencies = [e, tr] }) :: res) (id + 1)
                        | (r, qs, qe) :: tail ->
                            _create
                                ~case:(r, qs, qe)
                                ~id:id
                                ~res:((s, { category = Non_final ; adjacencies = [(e, tr)] }) ::
                                    res)
                                ~stack:tail
                )
                | Choice (r1, r2), s, e ->
                    _create
                        ~case:(r1, id, id + 2)
                        ~id:(id + 3)
                        ~res:((id + 2, { category = Non_final ; adjacencies = [(e, Empty)] }) ::
                            (id + 3, { category = Non_final ; adjacencies = [(e, Empty)] }) ::
                            (s, { category = Non_final ; adjacencies = [(id, Empty); (id + 1, Empty)] }) ::
                            res)
                        ~stack:((r2, id + 1, id + 3) :: stack)
                | Listing clist, s, e ->
                | Range (c1, c2), s, e ->
                | Concatenation (r1, r2), s, e ->
                    _create
                        ~case:(r1, s, id + 1)
                        ~id:(id + 1)
                        ~res:res
                        ~stack:((r2, id + 1, e) :: stack)
                | Repetition r, s, e ->
                | Pos_repetition r, s, e ->
                | Def_repetition r, s, e ->
                | Possibility r, s, e ->
                | Construct t, s, e ->

        let create case =
            _create ~case:(case, 1, 0) ~id:1 ~res:[(0, Final, [])] ~stack:[]

    end
;;
