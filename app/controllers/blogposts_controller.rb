class BlogpostsController < ApplicationController
  def index
  end

  def create
    @blogpost = current_user.blogposts.new(blogpost_params)
    if @blogpost.save
      render 'index'
    else
      render 'new'
    end
  end

  def new
    @blogpost = Blogpost.new
  end

  def show
    @blogpost = Blogpost.find(params[:id])
  end

  private

  def blogpost_params
    params.require(:blogpost).permit(:title, :description, :text, :tags, :region, :category)
  end
end