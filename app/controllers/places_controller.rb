class PlacesController < ApplicationController
  def index
    @user = User.find_by({ "id" => session["user_id"] })

    if @user == nil
      redirect_to "/login"
    else
      @places = Place.all
    end
  end

  def show
    @user = User.find_by({ "id" => session["user_id"] })

    if @user == nil
      redirect_to "/login"
    else
      @place = Place.find_by({ "id" => params["id"] })

      @entries = Entry.where({
        "place_id" => @place["id"],
        "user_id" => @user["id"]
      })
    end
  end

  def new
    @user = User.find_by({ "id" => session["user_id"] })

    if @user == nil
      redirect_to "/login"
    end
  end

  def create
    @user = User.find_by({ "id" => session["user_id"] })

    if @user == nil
      redirect_to "/login"
    else
      @place = Place.new
      @place["name"] = params["name"]
      @place.save

      redirect_to "/places"
    end
  end
end