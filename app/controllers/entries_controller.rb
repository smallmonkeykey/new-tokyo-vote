# frozen_string_literal: true

class EntriesController < ApplicationController
  def categories; end

  def new
    category = params[:category]
    @category = Category.find_by(category_name: category)

    if category == 'food'
      @entry = Entry.new
      render 'new_food'
    elsif category == 'drink'
      @entry = Entry.new
      render 'new_drink'
    end
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
    render_template(category)
  end

  def show; end

  private

  def entry_params
    params.require(:entry).permit(:nickname, :title, :image, :category_id)
  end

  def render_template(category)
    case category
    when 'food'
      render 'entries_food'
    when 'drink'
      render 'entries_drink'
    when 'lt'
      render 'entries_lt'
    end
  end
end
