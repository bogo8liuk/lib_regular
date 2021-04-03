open Regular

let () =
    let i = Reg.create "hi" in
    let j = Rule.create_raw "HI" "hi" in
    let k = is_matching_prefix_rule "hi" "HI" in
    let a = match_count "gi" i in
    let b = split_string_rule "hi" "HI" in
    0
;;
