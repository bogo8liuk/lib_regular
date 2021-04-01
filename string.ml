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

let match_count to_check regdef = 1
let match_count_raw to_check regdef = 1
let match_count_rule to_check name = 1

let matching_substrings to_check regdef = []
let matching_substrings_raw to_check regdef = []
let matching_substrings_rule to_check name = []

let split_string to_change regdef = []
let split_string_raw to_change regdef = []
let split_string_rule to_change name = []

let replace_with to_change substitution to_compute regdef = "hi"
let replace_with_raw to_change substitution to_compute regdef = "hi"
let replace_with_rule to_change substitution to_compute name = "hi"

let replace_string to_change to_substitute regdef = "hi"
let replace_string_raw to_change to_substitute regdef = "hi"
let replace_string_rule to_change to_substitute name = "hi"

let replace_with_first to_change substitution to_compute regdef times = "hi"
let replace_with_first_raw to_change substitution to_compute regdef times = "hi"
let replace_with_first_rule to_change substitution to_compute name times = "hi"

let replace_string_first to_change to_substitute regdef times = "hi"
let replace_string_first_raw to_change to_substitute regdef times = "hi"
let replace_string_first_rule to_change to_substitute name times = "hi"

;;
