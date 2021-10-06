class BlogpostsController < ApplicationController
  before_action :set_blogpost, only: [:show, :edit, :destroy, :update]
  before_action :authenticate_user!, only: [:create, :edit, :update]

  def index
    # query = params[:search].presence || '*'
    if !!params[:category]
      blogpost = Blogpost.joins(:category).where(category: { name: params[:category] })
    elsif !!params[:meangful]
      blogpost = Blogpost.where(meangful: true)
    else
      blogpost = Blogpost.all
    end
    @country = request.location.country
    @pagy, @blogpost = pagy(blogpost, items: 9)
  end

  def meaningful
    @blogpost = Blogpost.where(meangful: true)
  end

  def create
    @blogpost = current_user.blogposts.new(permitted_attributes(@blogpost))
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
    commontator_thread_show(@blogpost)
    current_user.views.create(blogpost_id: @blogpost.id) unless current_user.nil?
  end

  def edit
    authorize @blogpost
  end

  def update
    authorize @blogpost
    @blogpost.update(permitted_attributes(@blogpost))
  end

  private

  def set_blogpost
    @blogpost = Blogpost.find(params[:id])
  end
end