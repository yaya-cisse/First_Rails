class UsersController < ApplicationController

  def index 
    @users = User.all
    respond_to do |format|
      format.html #index.html.erb
      format.json {render :json => @users} 
    end
  end

  def get_users
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html #index.html.erb
      format.json {render :json => @users}
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html {redirect_to users_url} #index.html.erb
      format.json {render :json => @users}
    end
  end


end
