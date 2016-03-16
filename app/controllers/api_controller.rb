class ApiController < ApplicationController
  respond_to :json

  load_and_authorize_resource except: [:create]

  skip_before_action :verify_authenticity_token if Rails.env == "development"

  include SerializeHelper
  include ApiHelper
  
  def index
    respond_with loaded_resources.page(params[:page]).per(ENV["PER_PAGE"])
  end

  def show
    respond_with loaded_resource
  end

  def destroy
    if loaded_resource.delete
      render json: {id: params[:id]}
    else
      render json: {error: I18n.t("info.something_went_wrong") }
    end
  end

  def create
    resource = loaded_class.new permited_params
    if resource.save
      render json: {symbol_params_one => serialize_object(resource, serializer_name)}
    else
      render json: {error: I18n.t("info.something_went_wrong") }
    end
  end

end

