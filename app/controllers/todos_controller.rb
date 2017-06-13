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
    @todo = Todo.new(:task => Todo.first.task)
    @todo.save
    @todo = Todo.first
    @todo.destroy
    redirect_to root_path
  end

  def destroy
    @todos = Todo.first
    @todos.destroy
    redirect_to root_path
  end

  private
    def todo_params
      params.require(:todo).permit(:task)
    end
end
