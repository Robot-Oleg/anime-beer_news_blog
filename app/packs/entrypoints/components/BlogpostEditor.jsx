import React, { useReducer, useState } from 'react';
import ReactQuill from 'react-quill';
import Chip from './Chip'
import Select from './Select'
import I18n from "i18n-js"

const modules = {
  toolbar: [
    [{ header: '1' }, { header: '2' }, { font: [] }],
    [{ size: [] }],
    ['bold', 'italic', 'underline', 'strike', 'blockquote'],
    [
      { list: 'ordered' },
      { list: 'bullet' },
      { indent: '-1' },
      { indent: '+1' },
    ],
    ['link', 'image', 'video'],
    ['clean'],
  ],
  clipboard: {
    // toggle to add extra line breaks when pasting HTML:
    matchVisual: false,
  },
};

function sendBlogpost(url, title, description, text) {
  let tags_item = document.getElementsByClassName('chips')
  let tags = tags_item[0].M_Chips.chipsData.map((item) => item.tag )

  let region_item = document.getElementsByClassName('select')
  let region = region_item[0].value

  const body = JSON.stringify({
    title,
    description,
    text,
    tags,
    region,
  });
  let token = document.querySelector('meta[name="csrf-token"]').content;

  fetch(url, {
    method: "post",
    headers: {
      "Content-Type": "application/json",
      'X-CSRF-Token': token
    },
    body: body,
  })
}

function BlogpostEditor(props) {
  const [text, setText] = useState(props.text)

  const [blogpost, setBlogpost] = useReducer(
    (state, newState) => ({ ...state, ...newState }),
    {
      title: props.title,
      description: props.description,
      category: props.category,
    },
  );

  const handleChange = (evt) => {
    const { name, value } = evt.target;
    setBlogpost({ [name]: value });
  };

  const handleText = (content, delta, source, editor) => {
    setText(editor.getHTML());
  };

  const tags =  <div className="row">
                  <div className="input-field col s12">
                    <Chip tags={props.tags}/>
                  </div>
                </div>

  const category =  <div className="row">
                      <div className="input-field col s12">
                        <input id="category" type="text" className="validate" name="category" value={blogpost.category} onChange={handleChange} />
                        <label htmlFor="category" className="active">Category</label>
                      </div>
                    </div>

  return (
    <div className="row">
      <form className="col s12">
        <div className="row">
            <div className="input-field col s12">
              <input id="header" type="text" className="validate" name="title" value={blogpost.title} onChange={handleChange} />
              <label htmlFor="header" className="active">
                {I18n.t("editor.header")}
              </label>
            </div>
        </div>
        <div className="row">
          <div className="input-field col s12">
              <textarea id="description" className="materialize-textarea" name="description" value={blogpost.description} onChange={handleChange} />
              <label htmlFor="description" className="active">
                Description
              </label>
          </div>
        </div>
        <div className="row">
          <div className="input-field col s12">
            <Select />
          </div>
        </div>
        <div className="row">
          <div className="col s12">
            <div className="">
              <ReactQuill modules={modules} theme="snow" value={text} onChange={handleText} />
            </div>
        </div>
        </div>
        {props.enableCategory ? category : null}
        {props.enableTags ? tags : null}
        <div className="row">
          <div className="col s12">
            <button type="button" onClick={() => sendBlogpost(props.url, blogpost.title, blogpost.description, text)} className="btn btn-waves-effect waves-teal btn-flat">
              submit
            </button>
          </div>
        </div>
      </form>
    </div>
  );
}

export default BlogpostEditor;
