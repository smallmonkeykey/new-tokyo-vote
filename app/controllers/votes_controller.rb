# frozen_string_literal: true

class VotesController < ApplicationController
  before_action :close_voting, only: [:create]
  before_action :check_vote_limit, only: [:create]

  def categories; end

  def completions
    @category = params[:category]
  end

  def create
    @vote = current_user.votes.new(vote_params)
    if @vote.save
      category = params[:category]
      redirect_to votes_completions_path(category:)
    else
      flash[:error] = @vote.errors.full_messages.to_sentence
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

  def check_vote_limit
    votes_count = current_user.votes.joins(entry: :category).where(categories: { category_name: params[:category] }).count

    return unless votes_count >= 3

    redirect_to root_path, alert: '既に3票投票しています。これ以上投票できません。'
  end
end
