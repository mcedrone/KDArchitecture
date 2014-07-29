class UsersController < ApplicationController

	before_action :set_user, only: [:settings, :update]
  before_filter :redirect_unless_signed_in, only: [:settings, :update]

	def settings
	end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params[:user]
    end

    def redirect_unless_signed_in
      if !signed_in?
        redirect_to signin_path
        return
      end
    end

end
