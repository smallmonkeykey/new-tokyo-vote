# frozen_string_literal: true

class VotesController < ApplicationController
  before_action :close_voting, only: [:create]
  def categories; end

  def completions; end

  def create
    @vote = current_user.votes.new(vote_params)
    if @vote.save
      redirect_to votes_completions_path
    else
      category = params[:category]
      redirect_to entries_path(category:), status: :unprocessable_entity
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:comment, :entry_id)
  end

  def close_voting
    return unless Time.current >= CLOSING_TIME

    redirect_to rankings_path, alert: 'この時間は投票できません'
  end
end
