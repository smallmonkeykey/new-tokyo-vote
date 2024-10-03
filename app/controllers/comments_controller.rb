# frozen_string_literal: true

class CommentsController < ApplicationController
  skip_before_action :logged_in_user, only: %i[index show]
  before_action :check_closing_time

  def index
        @food_grouped_comments = Vote.fetch_group_comment('food')
        @drink_grouped_comments = Vote.fetch_group_comment('drink')
        @lt_grouped_comments = Vote.fetch_group_comment('lt')

  end

  def show
      @entry = Entry.find(params[:id])
  @entry_comments = Vote.where(entry_id: @entry.id)
                        .where.not(comment: [nil, ""])
  end

    private

  def check_closing_time
    return unless Time.current < CLOSING_TIME

    redirect_to root_path, alert: 'このページは現在公開されていません。'
  end
end
