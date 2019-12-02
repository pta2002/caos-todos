class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :require_login

  def index
    @tasks = current_user.tasks

    respond_to do |format| 
      format.html
      format.json { render json: @tasks }
    end
  end

  def create
    @task = Task.new(params.require(:todo).permit(:text))
    @task.user = current_user

    if @task.save then
      render json: @task
    else
      render json: @task, status: 400
    end
  end

  def finish
    @task = current_user.tasks.find(params[:id])
    @task.done = true
    @task.save

    render json: @task
  end

  def activate
    @task = current_user.tasks.find(params[:id])
    @task.done = false
    @task.save

    render json: @task
  end

  def destroy
    @task = current_user.tasks.find(params[:id])
    @task.destroy

    render json: { success: true }
  end
end
