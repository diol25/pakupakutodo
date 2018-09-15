class TasksController < ApplicationController
  before_action :verify_cookie
  before_action :verify_list

  def index
    @tasks = @list.tasks
    @task = Task.new
  end

  def create
    @task = @list.tasks.build(task_params)
    respond_to do |format|
      if @task.save
        format.js
        format.html { redirect_to tasks_path }
      end
    end
  end

  def destroy
    @task= Task.find params[:id]
    if @task.destroy
      redirect_to tasks_path
    end
  end

  private

    def verify_cookie
      if cookies[:todo_list].nil?

        cookies[:todo_list] = SecureRandom.urlsafe_base64
      end
    end

    def verify_list
      @list ||= List.find_or_create_by(cookie_id: cookies[:todo_list])
    end

    def task_params
      params.require(:task).permit(:title)
    end
end
