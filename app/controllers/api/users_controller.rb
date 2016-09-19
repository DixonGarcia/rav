module API
  class UsersController < ApplicationController
    protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

    def create
      user = User.new(user_params)
      if user.save
        render :json => {:success => true, :user_id => user.id}, status: :ok
      else
        render :json => {:success => false}, status: :unprocessable_entity
      end
    end

    def login
      params = user_params
      user = User.find_by_email(params['email'].downcase)
      if User.auth(params) then
        sign_in(user)
        render :json => {:success => true, :user => user}
      else
        render :json => {:success => false}
      end
    end

    private
      def user_params
        params.require(:user).permit(:name,:email,:password)
      end
  end
end
