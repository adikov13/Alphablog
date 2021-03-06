class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:notice] = "Welcome to alpha blog #{@user.username}"
			redirect_to articles_path
		else
			render 'new'
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def index 
		@user = User.all
	end

	def edit
		@user = User.find(params[:id])
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		flash[:notice] = "User deleted"
		redirect_to articles_path
	end
	def update 
		@user = User.find(params[:id])
		if @user.update (user_params)
			flash[:success] = "User updated successfully"
			redirect_to articles_path
		else
			render 'edit'
		end
	end
	private
		def user_params
			params.require(:user).permit(:username, :email, :password)
		end
end