class EntriesController < ApplicationController
  def new
    @user = User.find_by({ "id" => session["user_id"] })

    if @user == nil
      redirect_to "/login"
    else
      @places = Place.all
    end
  end

  def create
    @user = User.find_by({ "id" => session["user_id"] })

    if @user == nil
      redirect_to "/login"
    else
      @entry = Entry.new
      @entry["title"] = params["title"]
      @entry["description"] = params["description"]
      @entry["occurred_on"] = params["occurred_on"]
      @entry["place_id"] = params["place_id"]
      @entry["user_id"] = @user["id"]

      if params["uploaded_image"] != nil
        @entry.uploaded_image.attach(params["uploaded_image"])
      end

      @entry.save
      redirect_to "/places/#{@entry["place_id"]}"
    end
  end
end