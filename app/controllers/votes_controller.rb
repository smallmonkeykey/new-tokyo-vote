# frozen_string_literal: true

class VotesController < ApplicationController
  MAX_VOTES_PER_CATEGORY = 3

  before_action :set_event
  before_action :close_voting, only: [:create]
  before_action :check_vote_limit, only: [:create]

  def categories; end

  def completions
    @category = params[:category]
  end

  def create
    @vote = current_user.votes.new(vote_params)
    category = params[:category]
    if @vote.save
      redirect_to event_votes_completions_path(@event, category:)
    else
      redirect_to event_entry_path(@event, category:, id: vote_params[:entry_id]), flash: { error: @vote.errors.full_messages.to_sentence }
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:comment, :entry_id)
  end

  def close_voting
    return if @event.open?

    redirect_to event_rankings_path(@event), alert: 'この時間は投票できません'
  end

  def check_vote_limit
    votes_count = current_user.votes
                              .for_event(@event.id)
                              .for_category(params[:category])
                              .count

    return unless votes_count >= MAX_VOTES_PER_CATEGORY

    redirect_to event_path(@event), alert: '既に3票投票しています。これ以上投票できません。'
  end

  def set_event
    @event = Event.find(params[:event_id])
  end
end
