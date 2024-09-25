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
    if @entry.save
      category = params[:category]
      redirect_to entries_completions_path(category:)
    else
      flash[:error] = @entry.errors.full_messages.to_sentence
      category = params[:category]
      redirect_to new_entry_path(category:), status: :unprocessable_entity
    end
  end

  def completions
    @category = params[:category]
  end

  def index
    category = params[:category]
    category_id = Category.find_by(category_name: category).id
    @entries = Entry.includes(:user).where(category_id:)
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
    params.require(:entry).permit(:title, :description, :category_id)
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
