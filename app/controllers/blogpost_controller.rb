class BlogpostController < ApplicationController
  def create
    Blogpost.create(blogpost_params)
  end

  private

  def blogpost_params
    params.require(:blogpost).permit(:title, :description, :text)
  end
end