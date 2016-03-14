class ReportsController < ApplicationController
  before_action :show, only: [:vote, :destroy]

  def new
    @report = Report.new
    @nearbyholes = @report.nearbys
  end

  def create
    @report = Report.new(report_params)
    # When report is created the status is automatically set to 0 (pending >> goes to admin for verification)
    #@report.status = @status
    #@status = 1
    @report.status = 1
    @report.vote_count = 0
    if @report.save
      redirect_to report_path(@report)
    else
      render :new
    end
  end

  def index
    if params[:latitude] && params[:longitude]
      @reports = Report.near([params[:latitude], params[:longitude]], 1, unit: :km)
    elsif params[:vote_count]
      @reports = Report.all.order(@report.vote_count=> :desc)
    elsif params[:status]
      @reports = Report.all.order(:status => :asc)
    else
      @reports = Report.all
    end
  end

  def show
    @report = Report.find(params[:id])
    @comment = Comment.new(user: current_user, report: @report)
    @vote = @report.votes.build
    @nearbyholes = @report.nearbys( 1, unit: :km)
  end

  def edit
    @report = Report.find(params[:id])
  end

  def update
    @report = Report.find(params[:id])

    if @report.update_attributes(report_params)
      redirect_to "/reports/#{@report.id}"
    else
      render :edit
    end
  end

  def destroy
    @report = Report.find(report_params[:id])
    @report.destroy
      redirect_to reports_path
  end

  # upvote_from user?

private
  def report_params
    params.require(:report).permit(:id, :description, :address, :status, :image)
  end
end
