class BlogpostPolicy < ApplicationPolicy
  attr_reader :user, :blogpost

  def initialize(user, blogpost)
    @user = user
    @blogpost = blogpost
  end

  def show?
    
  end

  def update?
    check_for_update
  end

  def edit?
    check_for_update
  end

  def permited_attributes
    if user.editor? || user.admin?
      [:title, :description, :text, :tag_list, :region, :category, :status]
    elsif user.writer?
      [:title, :description, :text, :region]
    end
  end

  private

  def check_for_update
    if user.admin?
      true
    elsif user.editor? && !blogpost.archived? && !blogpost.published?
      true
    elsif user.writer? && owner? && blogpost.unactive?
      true
    else
      false
    end
  end

  def owner?
    user.id == blogpost.user_id
  end
end