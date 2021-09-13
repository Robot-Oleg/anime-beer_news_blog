class CategoryController < ApplicationController
  def new
    @category = Category.new
  end
end