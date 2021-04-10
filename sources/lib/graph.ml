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

module Graph =
    struct
        module Node =
            struct
                type 'a t = {
                    id : int ;
                    mutable data : 'a
                } [@@deriving hash, compare, sexp]
        
                let id v = v.id
                let data v = v.data
            end
        
        type 'a node_data_pair = {
            node : int ;
            mutable data : 'a
        }

        type 'a 'b t = ('a Node.t, ('b node_data_pair) list) Hashtbl.t

        let create () = Hashtbl.create (module Node)

        let add_node g n d = Hashtbl.add g n d
        let add_arch g n1 n2 d = Hashtbl.set g n1 { n2 ; d }
    end
;;
