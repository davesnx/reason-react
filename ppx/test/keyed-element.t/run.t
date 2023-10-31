  $ ../ppx.sh --output ml component.re
  module React_component_with_props =
    struct
      external makeProps :
        lola:'lola -> ?key:string -> unit -> < lola: 'lola   >  Js.t = ""
      [@@mel.obj ]
      let make =
        ((fun ~lola ->
            ReactDOM.jsx "div"
              (((ReactDOM.domProps)[@merlin.hide ])
                 ~children:(React.string lola) ()))
        [@warning "-16"])
      let make =
        let Output$React_component_with_props (Props : < lola: 'lola   >  Js.t)
          = make ~lola:(Props ## lola) in
        Output$React_component_with_props
    end
  module DummyComponentThatMapsChildren =
    struct
      external makeProps : ?key:string -> unit -> <  >  Js.t = ""[@@mel.obj ]
      let make () =
        ReactDOM.jsx "div"
          (((ReactDOM.domProps)[@merlin.hide ])
             ~children:([|(React.jsx React_component_with_props.make
                             (React_component_with_props.makeProps ~lola:"Hola"
                                ()))|]
                          |. React.array) ())
      let make =
        let Output$DummyComponentThatMapsChildren (Props : <  >  Js.t) =
          make () in
        Output$DummyComponentThatMapsChildren
    end
