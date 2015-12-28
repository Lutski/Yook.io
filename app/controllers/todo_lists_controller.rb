class TodoListsController < ApplicationController

	def index
		@project = Project.find(params[:project_id])
	end

	def show
		@todo_list = TodoList.find(params[:id])
		@project = Project.find(params[:project_id])
	end

	def new
		@project = Project.find(params[:project_id])
	end

	def create
		@project = Project.find(params[:project_id])
		@todo_list = @project.todo_lists.create(todo_list_params)

		redirect_to @project
	end

	def edit
		
	end

	def update
		
	end

	def destroy
		
	end



	private

	def todo_list_params
		params[:todo_list].permit(:title, :description)
	end
end
