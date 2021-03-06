class UsersController < ApplicationController
	before_action :current_user

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id 
			redirect_to user_path(@user)
		else
			render :new
		end
	end

	def show
		require_login
		@user = current_user
		@reported_issue = ReportedIssue.new
	end
	
	private

	def user_params
		params.require(:user).permit(:name, :email, :password)
	end

end
