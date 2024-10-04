# frozen_string_literal: true

class EntriesController < ApplicationController
  include AdminHelper
  before_action :require_admin, only: [:new], if: proc { params[:category] == 'lt' }

  def categories; end

  def new
    category = params[:category]
    @category = Category.find_by(category_name: category)
    @entry = Entry.new
    render_template(category, 'new')
  end

  def create
    @entry = current_user.entries.new(entry_params)
    category = params[:category]
    if @entry.save
      redirect_to entries_completions_path(category:)
    else
      redirect_to new_entry_path(category:), flash: { error: @entry.errors.full_messages.to_sentence }
    end
  end

  def completions
    @category = params[:category]
  end

  def index
    category = params[:category]
    category_id = Category.find_by(category_name: category).id
    @entries = Entry.with_attached_image.includes(:user).where(category_id:)
    render_template(category, 'entries')
  end

  def show
    @entry = Entry.find(params[:id])
    @name = @entry.user.name
    @vote = Vote.new
    @category = params[:category]
  end

  private

  def entry_params
    params.require(:entry).permit(:title, :description, :category_id, :image)
  end

  def render_template(category, action_name)
    case category
    when 'food'
      render "#{action_name}_food"
    when 'drink'
      render "#{action_name}_drink"
    when 'lt'
      render "#{action_name}_lt"
    end
  end
end
