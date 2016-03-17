class VotesController < ApplicationController
  before_filter :require_login, except: [:show]

  def new
    @vote = Vote.new
  end

  def index
    @votes = Vote.all
  end

  def create

    @vote = Vote.new(vote_params)
    @vote.user = current_user

    if @vote.save
      redirect_to report_path(@vote.report), notice: 'Vote added, thank you!'
    else
      redirect_to report_path(@vote.report),
      notice: 'The vote did not save. Make sure you did not vote already.'
    end

  end

  private
  def vote_params
    params.require(:vote).permit(:user_id, :report_id)
  end
end
