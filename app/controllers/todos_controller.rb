class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      render :create
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      render :update
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    render :destroy
  end

  private
    def todo_params
      params.require(:todo).permit(:title)
    end
end