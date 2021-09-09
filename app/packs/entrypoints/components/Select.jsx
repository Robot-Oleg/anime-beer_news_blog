import React, {useEffect} from 'react'
import M from 'materialize-css'

function Select(props) {
  useEffect(() => {
    M.FormSelect.init(Select)
  })

  return (
    <>
      <select
        ref={FormSelect => {
          Select = FormSelect;
        }}
        className="select"
      >
        <option value="0" disabled defaultValue>
          Choose your option
        </option>
        <option value="opt 1">Option 1</option>
        <option value="opt 2">Option 2</option>
        <option value="opt 3">Option 3</option>
      </select>
      <label>{props.name}</label>
    </>
  )
}

export default Select;