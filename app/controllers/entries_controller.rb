# frozen_string_literal: true

class EntriesController < ApplicationController
  def categories; end

  def new
    category = params[:category]

    if category == 'food'
      render 'new_food'
    elsif category == 'drink'
      render 'new_drink'
    end
  end

  def completions; end
end
