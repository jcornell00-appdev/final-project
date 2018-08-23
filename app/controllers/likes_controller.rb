class LikesController < ApplicationController
  def index
    @likes = Like.all

    render("like_templates/index.html.erb")
  end

  def show
    @like = Like.find(params.fetch("id_to_display"))

    render("like_templates/show.html.erb")
  end

  def new_form
    render("like_templates/new_form.html.erb")
  end

  def create_row
    @like = Like.new

    @like.user_id = params.fetch("user_id")
    @like.place_id = params.fetch("place_id")

    if @like.valid?
      @like.save

      redirect_to("/places/#{@like.place_id}", :notice => "Like created successfully.")
    else
      render("like_templates/new_form.html.erb")
    end
  end

  def edit_form
    @like = Like.find(params.fetch("prefill_with_id"))

    render("like_templates/edit_form.html.erb")
  end

  def update_row
    @like = Like.find(params.fetch("id_to_modify"))

    @like.user_id = params.fetch("user_id")
    @like.place_id = params.fetch("place_id")

    if @like.valid?
      @like.save

      redirect_to("/likes/#{@like.id}", :notice => "Like updated successfully.")
    else
      render("like_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @like = Like.find(params.fetch("id_to_remove"))

    @like.destroy

    redirect_to("/places/#{@like.place_id}", :notice => "Like deleted successfully.")
  end

  def my_likes
    @places = current_user.liked_places
    
    render("like_templates/my_likes.html.erb")
  end

end
