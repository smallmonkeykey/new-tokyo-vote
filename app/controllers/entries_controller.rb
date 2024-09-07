# frozen_string_literal: true

class EntriesController < ApplicationController
  include SessionsHelper
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
      redirect_to entries_completions_path
    else
      Rails.logger.debug(@entry.errors.full_messages)
      flash[:error] = @entry.errors.full_messages.to_sentence
      category = params[:category]
      redirect_to new_entry_path(category:), status: :unprocessable_entity
    end
  end

  def completions; end

  def index
    category = params[:category]
    category_id = Category.find_by(category_name: category).id
    @entries = Entry.where(category_id:)
    render_template(category, 'entries')
  end

  def show
    @entry = Entry.find(params[:id])
    @vote = Vote.new
  end

  private

  def entry_params
    params.require(:entry).permit(:nickname, :title, :image, :category_id)
  end

  # def render_template(category)
  #   case category
  #   when 'food'
  #     render 'entries_food'
  #   when 'drink'
  #     render 'entries_drink'
  #   when 'lt'
  #     render 'entries_lt'
  #   end
  # end
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
