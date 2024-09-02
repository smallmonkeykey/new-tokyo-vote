# frozen_string_literal: true

class VotesController < ApplicationController
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
end
