import React, {useEffect} from 'react'
import M from 'materialize-css'
import regions from './regions'

function Select() {
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
          Choose your region
        </option>
        {regions.map((region, index) => <option key={index} value={region.name.toString()}>{region.name}</option> )}
      </select>
      <label>Country</label>
    </>
  )
}

export default Select;