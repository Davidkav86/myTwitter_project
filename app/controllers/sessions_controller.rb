class SessionsController < ApplicationController

      def new
      end

      def create
         user = User.find_by_email(params[:session][:email].downcase)
         if user && user.authenticate(params[:session][:password])
          sign_in user
          redirect_to user # Shorthand for 'redirect_to action: 'show', id: user.id'
         else
           flash.now[:error] = 'Invalid email/password combination'
           render 'new'
         end
      end
      
      # Called when a user is signing out
      def destroy
        sign_out # in the sessions_helper
        redirect_to root_url
      end
    end
