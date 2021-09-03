import React, { useReducer, useState } from 'react';
import ReactQuill from 'react-quill';
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

function sendBlogpost(title, description, text) {
  const body = JSON.stringify({
    title,
    description,
    text,
  });
  console.log(body);
}

function BlogpostEditor() {
  const [text, setText] = useState('');
  const [blogpost, setBlogpost] = useReducer(
    (state, newState) => ({ ...state, ...newState }),
    {
      title: '',
      description: '',
    },
  );

  const handleChange = (evt) => {
    const { name, value } = evt.target;
    setBlogpost({ [name]: value });
  };

  const handleText = (content, delta, source, editor) => {
    setText(editor.getHTML());
  };

  return (
    <div className="row">
      <form className="col s12">
      <div className="row">
          <div className="input-field col s12">
            <input id="header" type="text" className="validate" name="title" value={blogpost.title} onChange={handleChange} />
            <label htmlFor="header">
              debugger;
              {I18n.t("editor.header")}
            </label>
        </div>
      </div>
      <div className="row">
          <div className="input-field col s12">
              <textarea id="description" className="materialize-textarea" name="description" value={blogpost.description} onChange={handleChange} />
              <label htmlFor="description">
                Description
              </label>
          </div>
      </div>
      <div className="row">
        <div className="col s12">
          <div className="">
            <ReactQuill modules={modules} theme="snow" value={text} onChange={handleText} />
          </div>
        </div>
      </div>
      <div className="row">
        <div className="col s12">
          <button type="submit" onClick={() => sendBlogpost(blogpost.title, blogpost.description, text)} className="btn btn-waves-effect waves-teal btn-flat">
            submit
          </button>
        </div>
      </div>
      </form>
    </div>
  );
}

export default BlogpostEditor;
