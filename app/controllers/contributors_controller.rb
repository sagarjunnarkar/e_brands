class ContributorsController < ApplicationController
  before_action :set_contributor, only: %i[ show update destroy ]
  load_and_authorize_resource
  # GET /contributors
  # GET /contributors.json
  def index
    @contributors = Contributor.all
  end

  # GET /contributors/1
  # GET /contributors/1.json
  def show
  end

  # POST /contributors
  # POST /contributors.json
  def create
    @contributor = Contributor.new(contributor_params)

    if @contributor.save
      render :show, status: :created, location: @contributor
    else
      render json: @contributor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contributors/1
  # PATCH/PUT /contributors/1.json
  def update
    if @contributor.update(contributor_params)
      render :show, status: :ok, location: @contributor
    else
      render json: @contributor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /contributors/1
  # DELETE /contributors/1.json
  def destroy
    @contributor.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contributor
      @contributor = Contributor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contributor_params
      params.require(:contributor).permit(:company_id, :user_id)
    end
end
