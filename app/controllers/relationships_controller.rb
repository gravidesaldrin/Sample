class RelationshipsController < ApplicationController
  before_action :logged_in_user

  def index
    if params[:active] == "1"
      @users = current_user.followers.paginate page: params[:page]
    else
      @users = current_user.following.paginate page: params[:page]
    end
  end

  def create
    @user = User.find params[:followed_id]
    current_user.follow @user
    respond_to do |format|
      format.html {redirect_to @user}
      format.js
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    @users = current_user.following.paginate page: params[:page]
    @following = @users
    current_user.unfollow @user
    respond_to do |format|
      format.html {redirect_to @user}
      format.js
    end
  end
end
