class TasksController < ApplicationController
  before_action :set_project

  def new
    @task = @project.tasks.build
  end
  def create
    @task = @project.tasks.create(task_params)
    respond_to do |format|
    if @task.save
      format.html { redirect_to @project, notice: 'Task was successfully created.' }
      format.json { render :show, status: :created, location: @project.task }
    else
      format.html { render :new }
      format.json { render json: @task.errors, status: :unprocessable_entity }
    end
      end
  end

  def edit
    if current_user.admin?
    @task = Task.find(params[:id])
    else
      redirect_to @project, alert: "You don't have permission"
    end
  end

  def update
    if current_user.admin?
    @task = @project.tasks.find(params[:id])
    @task.update task_params
    redirect_to @project, notice: 'Task was successfully updated.'
    else
      redirect_to @project, alert: "You don't have permission"
    end
  end

  def destroy
    if current_user.admin?
    @task = @project.tasks.find(params[:id])
    if @task.destroy
      flash[:success] = "Task was deleted."
    else
      flash[:error] = "Task could not be deleted."
    end
    redirect_to @project, notice: 'Task was successfully deleted.'
    else
      redirect_to @project, alert: "You don't have permission"
    end
  end

  private
  def set_project
    @project = Project.find(params[:project_id])
  end

  def task_params
    params[:task].permit(:title, :description, :status, user_ids:[])
  end

end
