import React, { useEffect } from "react";
import M from "materialize-css";

function Chip(props) {
  const tags = []
  if (!!props.tags) {
    tags = props.tags.map((tag) => { return { tag: tag } })
  }
  useEffect(() => {
      const options = {
        placeholder: "Enter a tag",
        secondaryPlaceholder: "+Tag",
        data: tags,
      };
      M.Chips.init(Chip, options);
  })


  return (
    <>
      <div
        ref={Chips => {
          Chip = Chips;
        }}
        className="chips chips-placeholder"
      />
    </>
  );
}

export default Chip;

