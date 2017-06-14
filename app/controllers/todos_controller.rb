class TodosController < ApplicationController

  def index
    @todo = Todo.new
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.save
    redirect_to root_path
  end

  def stack
    if Todo.count > 0
      @todo = Todo.new(:task => Todo.first.task,:count => Todo.first.count)
      @todo.add_count
      if @todo.count >= 3
        @todo = Todo.first
        @todo.destroy
        redirect_to root_path
      else
        #@todo.update_attributes = { "count = (@todo.count+1) "}
        if @todo.save
          @todo = Todo.first
          @todo.destroy
          redirect_to root_path
        else
          redirect_to root_path
        end
      end
    else
      redirect_to root_path
    end
  end

  def destroy
    if Todo.exists? == false
      redirect_to root_path
    else
      @todos = Todo.first
      @todos.destroy
      redirect_to root_path
    end
  end

  private
    def todo_params
      params.require(:todo).permit(:task)
    end
end
