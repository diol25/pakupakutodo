class TasksController < ApplicationController
  before_action :verify_cookie
  before_action :verify_list

  def index
    @first_task = @list.tasks.first
    @task = Task.new
  end

  def create
    @task = @list.tasks.build(task_params)
    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_path } if @list.tasks.count == 1
        format.js
      else
        format.html { render :index }
      end
    end
  end

  def destroy
    @task = Task.find params[:id]
    respond_to do |format|
      if @task.destroy
        if @list.tasks.blank?
          @first_task = []
        else
          @first_task = @list.tasks.first
        end

        format.js
        format.html { redirect_to tasks_path }
      end
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
