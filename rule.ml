

module RRule : Rule =
    struct
        type name = string

        let create ~name ~regdef = ()
        let create_raw ~name ~regdef = ()

        let to_regdef ~name = "hi"
    end
;;
