class RunsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :use_unsafe_params, only: [:api]

  def index
    @runs = Run.all
  end

  def new
    @run = Run.new
  end

  def edit
    @run = Run.find(params[:id])
  end

  def show
    @run = Run.find(params[:id])
  end

  def create
    #render plain: run_params
    raw_params = run_params
    raw_params[:tags] = JSON.parse(raw_params[:tags])
    raw_params[:data] = JSON.parse(raw_params[:data])
    @run = Run.new(raw_params)

    if @run.save
      redirect_to runs_path
    else
      render 'new'
    end
  end

  def api
    #JSON.parse(params)
    #render plain: params[:run]

    raw_params = params[:run]
    #raw_params[:tags] = JSON.parse(raw_params[:tags])
    #raw_params[:data] = JSON.parse(raw_params[:data])
    @run = Run.new(raw_params)
    @run.save
    #if @run.save
    #	redirect_to runs_path
    #else
    #	render 'new'
    #end
  end

  def update
    @run = Run.find(params[:id])

    if @run.update(run_params)
      redirect_to runs_path
    else
      render 'edit'
    end
  end

  def destroy
    @run = Run.find(params[:id])
    @run.destroy

    redirect_to runs_path
  end

  def params
    @_dangerous_params || super
  end

  private

  def run_params
    params.require(:run).permit(
      :title, :date, :env, {:tags => []}, :comment, :data
    )
  end

  def use_unsafe_params
    @_dangerous_params = request.parameters
  end
end
