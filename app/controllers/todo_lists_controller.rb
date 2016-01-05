class TodoListsController < ApplicationController
	before_action :set_todo_list, only: [:show, :edit, :update, :destroy]
	before_action :set_project, only: [:index, :show, :new, :create, :edit, :update, :destroy]

	before_action :authenticate_user!
	# before_action :todo_list_owner

	def index
	end

	def show
	end

	def new
	end

	def create
		@todo_list = @project.todo_lists.create(todo_list_params)

		redirect_to @project
	end

	def edit
	end

	def update
		if @todo_list.update(todo_list_params)
			redirect_to project_todo_list_path(@project, @todo_list)
		else
			render 'edit'
		end
	end

	def destroy
		if @todo_list.destroy
			flash[:success] = "Todo List item was deleted."
		else
			flash[:error] = "Todo List item could not be deleted."
		end

		redirect_to @project
	end



	private

	def todo_list_params
		params[:todo_list].permit(:title, :description)
	end

	def set_todo_list
		@todo_list = TodoList.find(params[:id])
	end

	def set_project
		@project = Project.find(params[:project_id])
	end

	# def todo_list_owner
	# 	@todo_list = TodoList.find(params[:id]
	# 	unless @todo_list.project_id.user_id == current_user.id
	# 		redirect_to root_path
	# 	end
	# end
end
