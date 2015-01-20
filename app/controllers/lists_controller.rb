class ListsController < ApplicationController
  load_and_authorize_resource
  #before_action :set_list_by_id, only: [:show, :edit, :update, :destroy]
  before_action :set_list_by_url, only: [:show, :edit, :update, :destroy]

  # GET /lists
  # GET /lists.json
  def index
    @lists = List.all
  end
  
  def dashboard
      @lists = current_user.lists
  end

  # GET /lists/:url
  # GET /lists/:url.json
  def show
    @ideas = @list.ideas;
  end

  # GET /lists/new
  def new
    @list = List.new
    @list.ideas.build
  end

  # GET /lists/:url/edit
  def edit
  end

  # POST /lists
  # POST /lists.json
  def create
    @list = List.new(list_params)
    
    # If user cannot enter in field it sets to their user id
    if @list.user_id.blank?
      if current_user
        @list.user_id = current_user.id
      end
    end
    # For admins to assign as ANON
    if @list.user_id == 0
      @list.user_id = nil
    end

    respond_to do |format|
      if @list.save
        format.html { redirect_to @list, notice: 'List was successfully created.' }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/:url
  # PATCH/PUT /lists/:url.json
  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to @list, notice: 'List was successfully updated.' }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/:url
  # DELETE /lists/:url.json
  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to lists_url, notice: 'List was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list_by_id
      @list = List.find(params[:id])
    end
    
    def set_list_by_url
      @list = List.find_by_url(params[:url])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      if current_user && current_user.role == 'admin'
        params.require(:list).permit(:name, :url, :description, :user_id,
          ideas_attributes: [:id, :list_id, :body, :due_date, :completion_status, :votes, :_destroy])
      else
        params.require(:list).permit(:name, :description,
          ideas_attributes: [:body, :due_date, :completion_status, :votes]) 
      end
    end
end
