# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_event
  skip_before_action :logged_in_user, only: %i[index show]
  before_action :check_closing_time

  def index
    votes = Vote.for_event(@event.id)
    @food_grouped_comments  = votes.for_category('food').fetch_group_comment
    @drink_grouped_comments = votes.for_category('drink').fetch_group_comment
    @lt_grouped_comments    = votes.for_category('lt').fetch_group_comment
  end

  def show
    @entry = Entry.find(params[:id])
    @entry_comments = Vote.for_event(@event.id).where(entry_id: @entry.id).where.not(comment: [nil, ''])
  end

  private

  def check_closing_time
    return unless Time.current < CLOSING_TIME

    redirect_to root_path, alert: 'このページは現在公開されていません。'
  end

  def set_event
    @event = Event.find(params[:event_id])
  end
end
