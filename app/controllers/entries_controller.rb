# frozen_string_literal: true

class EntriesController < ApplicationController
  include AdminHelper
  before_action :set_event
  before_action :require_admin, only: [:new], if: proc { params[:category] == 'lt' }
  before_action :check_entry_period, only: %i[new create]
  before_action :check_event_status

  def categories; end

  def new
    category = params[:category]
    @category = Category.find_by(category_name: category)
    @entry = Entry.new(event: @event)
    render_template(category, 'new')
  end

  def create
    @entry = current_user.entries.new(entry_params.merge(event: @event))
    category = params[:category]
    if @entry.save
      redirect_to event_entries_completions_path(@event, category:)
    else
      redirect_to new_event_entry_path(@event, category:), flash: { error: @entry.errors.full_messages.to_sentence }
    end
  end

  def completions
    @category = params[:category]
  end

  def index
    category = params[:category]
    category_id = Category.find_by(category_name: category).id
    @entries = @event.entries.with_attached_image.includes(:user).where(category_id:)
    render_template(category, 'index')
  end

  def show
    @entry = @event.entries.find(params[:id])
    @name = @entry.user.name
    @vote = Vote.new
    @category = params[:category]
  end

  private

  def entry_params
    params.require(:entry).permit(:title, :description, :category_id, :image)
  end

  def render_template(category, action_name)
    case category
    when 'food'
      render "#{action_name}_food"
    when 'drink'
      render "#{action_name}_drink"
    when 'lt'
      render "#{action_name}_lt"
    end
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

  def check_entry_period
    return if params[:category] == 'lt'

    redirect_to event_path(@event), alert: '現在、エントリーは受付けていません。' if !@event.open?
  end
end
