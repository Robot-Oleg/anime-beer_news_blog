import React, {useEffect} from 'react'
import M from 'materialize-css'
import countries from './countries'

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
          Choose your country
        </option>
        {countries.map((country, index) => <option key={index} value={country.name.toString()}>{country.name}</option> )}
      </select>
      <label>Country</label>
    </>
  )
}

export default Select;