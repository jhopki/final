class TopicsController < ApplicationController
  def index
  	@topics = Topic.all
  end

  def show
  	@topic = Topic.find(params[:id])
  end

  def new
  	@topic = Topic.new
  end

  def edit
  	@topic = Topic.find(params[:id])
  end

  def create
  	@topic = Topic.new(topic_params)

    @topic.user_id = current_user.id
  	if @topic.save
  		redirect_to topics_url
  	else
  		render :new
  	end
  end

  def update
  	@topic = Topic.find(params[:id])

  	if @topic.update_attributes(topic_params)
  		redirect_to topic_path(@topic)
  	else
  		render :edit
  	end
  end

  def destroy
  	@topic = Topic.find(params[:id])
  	@topic.destroy
  	redirect_to topics_path
  end

  private
  def topic_params
  	params.require(:topic).permit(:name, :description, :user_id)
  end
end


