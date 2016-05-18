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

  # POST /users
  # POST /users.json
  def create
    @user = User.new(name: params[:name], status: params[:status])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "index" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html #index.html.erb
      format.json {render :json => @users}
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(name: params[:name], status: params[:status])
        format.html { redirect_to @user, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "show" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
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
