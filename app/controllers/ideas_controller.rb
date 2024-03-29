class IdeasController < ApplicationController
  load_and_authorize_resource
  before_action :set_idea, only: [:show, :edit, :update, :destroy]

  # GET /ideas
  # GET /ideas.json
  def index
    @ideas = Idea.all
  end

  # GET /ideas/1
  # GET /ideas/1.json
  def show
  end

  # GET /ideas/new
  def new
    @idea = Idea.new
  end

  # GET /ideas/1/edit
  def edit
  end
  
  # POST /ideas/1/upvote
  def upvote
    if current_user
      current_user.vote_exclusively_for(@idea)
      render json: [@idea.id, @idea.plusminus], :status => 200
    else
      puts "anonymous user trying to upvote"
    end
  end
  
  # POST /ideas/1/downvote
  def downvote
    if current_user
      current_user.vote_exclusively_against(@idea)
      render json: [@idea.id, @idea.plusminus], :status => 200
    else
      puts "anonymous user trying to downvote"
    end
  end
  
  # POST /ideas/1/unvote
  def unvote
      if current_user
        current_user.unvote_for(@idea)
        render json: [@idea.id, @idea.plusminus], :status => 200
    else
      puts "anonymous user trying to unvote -> IF YOU SEE THIS, IT IS REALLY BAD"
    end
  end

  # POST /ideas
  # POST /ideas.json
  def create
    @idea = Idea.new(idea_params)

    respond_to do |format|
      if @idea.save
        format.html { redirect_to @idea, notice: 'Idea was successfully created.' }
        format.json { render :show, status: :created, location: @idea }
      else
        format.html { render :new }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ideas/1
  # PATCH/PUT /ideas/1.json
  def update
    respond_to do |format|
      if @idea.update(idea_params)
        format.html { redirect_to @idea, notice: 'Idea was successfully updated.' }
        format.json { render :show, status: :ok, location: @idea }
      else
        format.html { render :edit }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ideas/1
  # DELETE /ideas/1.json
  def destroy
    @idea.destroy
    respond_to do |format|
      format.html { redirect_to ideas_url, notice: 'Idea was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea
      @idea = Idea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_params
      if current_user && current_user.role == 'admin'
        params.require(:idea).permit(:body, :due_date, :completion_status, :list_id)
      #else
        #params.require(:idea).permit(:body, :due_date) # create_params
        # :completion_status # list admin
        # :votes) # never! only increment or clear for list admin?
      end
    end
end
