module React_component_with_props = {
  [@react.component]
  let make = (~lola) => {
    <div> {React.string(lola)} </div>;
  };
};

module Single_case = {
  [@react.component]
  let make = () => {
    <div> <React_component_with_props lola="Single" key="1" /> </div>;
  };
};

module Array_case = {
  [@react.component]
  let make = () => {
    <div>
      [|<React_component_with_props lola="Array" key="1" />|]->React.array
    </div>;
  };
};
