class EntriesController < ApplicationController
  def categories
  end

  def new
    category = params[:category]

    if category == 'food'then
      render 'new_food'
    elsif category == 'drink' then
      render 'new_drink'
    end
  end

  def completions
  end
end
