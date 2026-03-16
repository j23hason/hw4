class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new
    @user["username"] = params["username"]
    @user["email"] = params["email"]
    @user.password = params["password"]

    if @user.save
      session["user_id"] = @user["id"]
      redirect_to "/places"
    else
      flash["notice"] = @user.errors.full_messages.join(", ")
      redirect_to "/signup"
    end
  end
end