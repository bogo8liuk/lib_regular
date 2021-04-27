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

module NFA : NFA =
    struct
        module State : State =
            struct
                type category = Non_final | Final

                type t = int
            end

        type t =
            | Base of State.t * State.category
            | Next of State.t * State.category * (transition * t) list

        let _create case ?(id = 0) =
            | Single tr ->
                Next (id, Non_final, [(tr, Base (id + 1, Final))])
            | Choice (r1, r2) ->
                (* TODO *)
            | Listing clist ->
            | Range (c1, c2) ->
            | Concatenation (r1, r2) ->
            | Repetition r ->
            | Pos_repetition r ->
            | Def_repetition r ->
            | Possibility r ->

        let create case =
            _create case ~id:0

    end
;;
