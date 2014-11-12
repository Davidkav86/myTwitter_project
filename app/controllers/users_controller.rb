class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts
  end

  def new
  	@user = User.new
  end

  def create
  	secure_params = params.require(:user).permit(:name, :email, 
                             :password, :password_confirmation)
    @user = User.new(secure_params)
    if @user.save
    	sign_in @user  # Call the sign in method in the sessions_helper.rb     
      flash[:success] = "Welcome to the Twitter App!"    
      redirect_to @user  
    else
        render 'new' # Handle an unsuccessful save.
    end
  end

end
