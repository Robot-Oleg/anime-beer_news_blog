class BlogpostsController < ApplicationController
  before_action :set_blogpost, only: [:show, :edit, :destroy, :update]
  before_action :authenticate_user!, only: [:create, :edit, :update]

  def index
    @blogpost = Blogpost.all
  end

  def create
    @blogpost = current_user.blogposts.new(permited_attributes(@blogpost))
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
  end

  def edit
    authorize @blogpost
  end

  def update
    authorize @blogpost
    @blogpost.update(permited_attributes(@blogpost))
  end

  private

  def set_blogpost
    @blogpost = Blogpost.find(params[:id])
  end
end