class RunsController < ApplicationController
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
	
	private
		def run_params
			params.require(:run).permit(
				:title, :date, :env, :tags, :data)
		end
end
