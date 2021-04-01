    (* It returns true if the string 'to_match' matches exactly with 'regdef'. *)
    val is_matching : string -> REG.DEF.t -> bool
    val is_matching_raw : string -> REG.EXPR.t -> bool
    val is_matching_rule : string -> RULE.name -> bool

    val is_matching_prefix : string -> REG.DEF.t -> bool
    val is_matching_prefix_raw : string -> REG.EXPR.t -> bool
    val is_matching_prefix_rule : string -> RULE.name -> bool

    val is_matching_suffix : string -> REG.DEF.t -> bool
    val is_matching_suffix_raw : string -> REG.EXPR.t -> bool
    val is_matching_suffix_rule : string -> RULE.name -> bool
;;
