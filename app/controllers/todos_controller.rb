class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @tasks = Task.all

    respond_to do |format| 
      format.html
      format.json { render json: @tasks }
    end
  end

  def create
    @task = Task.new(params.permit(:text))

    if @task.save then
      render json: @task
    else
      render json: @task, status: 400
    end
  end

  def finish
    @task = Task.find(params[:id])
    @task.done = true
    @task.save

    render json: @task
  end

  def activate
    @task = Task.find(params[:id])
    @task.done = false
    @task.save

    render json: @task
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    render json: { success: true }
  end
end
