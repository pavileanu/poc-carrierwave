class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @users = User.all
    render action: 'index'
  end

  # GET /users/1 or /users/1.json
  def show  
  end

  # GET /users/new
  def new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    file_location = Rails.root.join('public', 'picture1.png').to_s
    file = File.open(file_location)
    user = User.new
    user.file = file
    user.name = 'my name'
    begin 
      user.save!
    rescue
      @users = User.all
      @notice = 'ERROR SAVING INTO S3'
      render action: 'index'
      return
    end  
    @users = User.all
    render action: 'index'
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
  end

  # DELETE /users/1 or /users/1.json
  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :file)
    end
end
