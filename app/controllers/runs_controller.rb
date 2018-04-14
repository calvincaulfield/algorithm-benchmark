class RunsController < ApplicationController
  skip_before_action :verify_authenticity_token
  #before_action :use_unsafe_params, only: [:api]
  before_action :use_unsafe_params

 
  def index
    @runs = Run.order(:created_at).all
  end

  def new
    @run = Run.new
  end

  def edit
    @run = Run.find(params[:id])
  end

  def show
    @run = Run.find(params[:id])
   # render 'show', locals: { filter_tags: params[:filter_tags] }
    render 'show', locals: { include_tags: params[:include_tags], exclude_tags: params[:exclude_tags] }
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

    @run = Run.new( params[:run])
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

  def testFunc
    return 1
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
