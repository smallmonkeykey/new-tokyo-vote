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
      redirect_to new_entry_path(category: category), status: :unprocessable_entity
    end
  end

  def completions; end

  private

  def entry_params
    params.require(:entry).permit(:nickname, :title, :image, :category_id)
  end
end
