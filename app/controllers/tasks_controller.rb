class TasksController < ApplicationController
  before_action :verify_cookie
  before_action :verify_list

  def index
  end

  def create
  end

  def destroy
  end

  private

    def verify_cookie
      if cookies[:todo_list].nil?

        cookies[:todo_list] = SecureRandom.urlsafe_base64
      end
    end

    def verify_list
      binding.pry
      List.find_or_create_by(cookie_id: cookies[:todo_list])
    end
end
