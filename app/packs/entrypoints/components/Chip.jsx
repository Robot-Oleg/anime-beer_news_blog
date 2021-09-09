import React, { useEffect } from "react";
import M from "materialize-css";

function Chip() {
  useEffect(() => {
      const options = {
        placeholder: "Enter a tag",
        secondaryPlaceholder: "+Tag",
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

